
# this contains vdb.py
export PATH=$PATH:/users/jon/epics/local/bin

# this contains epicsUtils.py
export PYTHONPATH=$PYTHONPATH:/users/jon/epics/bessy

vdb.py dosimetry_setup.vdb > dosimetry_setup.dot
dotsvg dosimetry_setup

vdb.py dosimetry_setup_merged.vdb > dosimetry_setup_merged.dot
dotsvg dosimetry_setup_merged
