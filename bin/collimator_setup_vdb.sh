
# this contains vdb.py
export PATH=$PATH:/users/jon/epics/local/bin

# this contains epicsUtils.py
export PYTHONPATH=$PYTHONPATH:/users/jon/epics/bessy

vdb.py lcc.vdb > lcc.dot
dotsvg lcc

vdb.py collimator_setup.vdb > collimator_setup.dot
dotsvg collimator_setup

vdb.py collimator_setup_merged.vdb > collimator_setup_merged.dot
dotsvg collimator_setup_merged
