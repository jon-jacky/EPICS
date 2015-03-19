#!/usr/bin/env python
"""
Generate .dot from EPICS .db files.  Alternative to vdct for visualizing EPICS databases

First argument is path to .db file
Writes .dot file to stdout
"""

import sys
import string

# use parseDb in Python epicsUtils from BESSY
# http://www-csr.bessy.de/control/bii_scripts/html/python/epicsUtils.html
# http://www-csr.bessy.de/control/bii_scripts/repo/bii_scripts/lib/python/epicsUtils.py

import epicsUtils

nodes = set()         # on-page nodes: records appear in database
nodes_offpage = set() # off-page nodes: records not in database but link destinations

def make_header(db_file):
    print """digraph %s {
  rankdir=LR;
""" % db_file.rpartition('/')[2].partition('.')[0] # extract file basename

                                                   # FIXME not portable, use os module
def make_node(record):
    name = record['recordname']
    nodes.add(name)
    rtyp = record['RTYP']
    label = '%s\\n%s' % (name, rtyp)
    if 'DTYP' in record and 'asyn' in record['DTYP']:
        label += '\\n%s' % record['DTYP']  # asyn, some waveform
    if 'PORT' in record:
        label += '\\n%s' % record['PORT']  # asyn
    if 'CALC' in record:
        label += '\\n%s' % record['CALC']  # calc, calcout, scalcout, acalcout
    if 'OOPT' in record:
        label += '\\n%s' % record['OOPT']  # calcout, scalcout
    if 'OCAL' in record:
        label += '\\n%s' % record['OCAL']  # calc, calcout, scalcout, acalcout
    if 'DOPT' in record:
        label += '\\n%s' % record['DOPT']  # calcout, scalcout
    print '  "%s" [ shape=box, label="%s" ]' % (name, label)

def make_node_offpage(dest):
    nodes_offpage.add(dest)

def make_link(key, record):
    source = record['recordname']
    destination, space, attributes = record[key].partition(' ')
    dest, dot, field = destination.partition('.')
    make_node_offpage(dest)
    label = '%s %s %s' % (key, attributes, field)
    if key[:2] == 'IN':
        style = 'dashed'
    else:
        style = { 'OUT': 'solid', # control + data
                  'INP': 'dashed', 'DOL': 'dashed', # data only
                  'LNK': 'dotted', 'FLN': 'dotted', 'SDI': 'dotted' }[key[:3]] # control only
    args = (dest, source, label, style) if key[:3] in ('INP','DOL','SDI') or key[:2] == 'IN' \
        else (source, dest, label, style) 
    if record['RTYP'].upper() == 'SEQ':
        # In SEQ record, LNKi outputs value of DOLi
        doli = ', %s' % record['DOL%s' % key[3]]
        style = 'solid' # control + data
        args = (source, dest, label+doli, style)
    print '  "%s" -> "%s" [ label="%s", style="%s" ]' % args
                                             

def make_footer():
    print
    print '}'

if __name__ == '__main__':
    db_file = sys.argv[1]
    db_text = open(db_file).read()
    db = epicsUtils.parseDb(db_text)
    make_header(db_file)
    for record in db:
        make_node(record)
        for key in record:
            if (key[:3] in ('INP','DOL','OUT','LNK','FLN','SDI') or key[:2] == 'IN'
                and record[key] # eliminate empty links
                and set(string.letters) & set(record[key]) # exclude numbers
                and '%' not in record[key]): # exclude timestamp format
                make_link(key, record)
    nodes_offpage = nodes_offpage - nodes
    for node in nodes_offpage:
        print '  "%s" [ shape=box, style=dashed ]' % node
    make_footer()
