
# this contains vdb.py
export PATH=$PATH:/Users/jon/epics/bin

# this contains epicsUtils.py
export PYTHONPATH=$PYTHONPATH:/Users/jon/bessy.silver

vdb.py gantry_couch_converters.gantry_180_err.vdb > gantry_180_err.dot
#dotsvg gantry_180_err
#dotpdf gantry_180_err

vdb.py gantry_couch_converters.gantry_180_err.no_vscan.vdb > gantry_180_err.no_vscan.dot
#dotsvg gantry_180_err.no_vscan
#dotpdf gantry_180_err.no_vscan

