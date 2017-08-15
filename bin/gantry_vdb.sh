
# this contains vdb.py
export PATH=$PATH:/users/jon/epics/local/bin

# this contains epicsUtils.py
export PYTHONPATH=$PYTHONPATH:/users/jon/epics/bessy

vdb.py gantry_couch_converters.gantry_180_err.vdb > gantry_180_err.dot
dotsvg gantry_180_err
