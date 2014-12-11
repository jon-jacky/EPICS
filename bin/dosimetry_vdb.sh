
# this contains vdb.py
export PATH=$PATH:/users/jon/epics/local/bin

# this contains epicsUtils.py
export PYTHONPATH=$PYTHONPATH:/users/jon/epics/bessy

vdb.py dosimetry.vdb > dosimetry.dot
dotsvg dosimetry

vdb.py dosimetry_subs.vdb > dosimetry_subs.dot
dotsvg dosimetry_subs


vdb.py dosimetry_merged.vdb > dosimetry_merged.dot
dotsvg dosimetry_merged
