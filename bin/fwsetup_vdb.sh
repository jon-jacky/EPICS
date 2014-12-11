
# this contains vdb.py
export PATH=$PATH:/users/jon/epics/local/bin

# this contains epicsUtils.py
export PYTHONPATH=$PYTHONPATH:/users/jon/epics/bessy

vdb.py filter_wedge_setup_subs.vdb > filter_wedge_setup_subs.dot
dotsvg filter_wedge_setup_subs

vdb.py filter_wedgetype_setup_subs.vdb > filter_wedgetype_setup_subs.dot
dotsvg filter_wedgetype_setup_subs

vdb.py filter_wedge_setup.vdb > filter_wedge_setup.dot
dotsvg filter_wedge_setup

vdb.py filter_wedge_setup_merged.vdb > filter_wedge_setup_merged.dot
dotsvg filter_wedge_setup_merged


