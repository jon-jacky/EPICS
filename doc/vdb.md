vdb.py
======

**vdb.py** generates a data flow graph from an EPICS database.

**vdb.py** lays out the graph automatically in a way that usually
makes the data flow and control flow clear, unlike programs such as
*vdct* where you must place the records on the page yourself.

How it works
------------

**vdb.py** uses *parseDb* in
[epicsUtils](http://www-csr.bessy.de/control/bii_scripts/html/python/epicsUtils.html)
(download
[here](http://www-csr.bessy.de/control/bii_scripts/repo/bii_scripts/lib/python/epicsUtils.py))
from [BESSY](http://www-csr.bessy.de/) to load an EPICS database file
into a list of dictionaries, one dictionary per EPICS record, where
the dictionary keys are the field names (with one additional key,
*recordname*).  Then *vdb.py* generates a script in the *dot* graph
layout language where each node is an EPICS record and each edge is a
link: INP, OUT, FLNK, etc.   The edges are labelled so that they indicate
control flow as well as data flow.

**vdb.py** sends the *dot* graph layout script to standard output.  We
usually redirect it to a *.dot* file.  Then our *dotsvg* script uses
the *dot* program from the [Graphviz](http://www.graphviz.org/)
package to generate an *.svg* graphics file, which can be viewed in a
browser.


