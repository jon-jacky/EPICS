
# this contains vdb.py
export PATH=$PATH:/users/jon/epics/local/bin

# this contains epicsUtils.py
export PYTHONPATH=$PYTHONPATH:/users/jon/epics/bessy

vdb.py fw_motion_input_subs.vdb > fw_motion_input_subs.dot
dotsvg fw_motion_input_subs

vdb.py fw_motion_achieved_subs.vdb > fw_motion_achieved_subs.dot
dotsvg fw_motion_achieved_subs

vdb.py filter_wedge.vdb > filter_wedge.dot
dotsvg filter_wedge

vdb.py filter_wedge_subs.vdb > filter_wedge_subs.dot
dotsvg filter_wedge_subs

vdb.py filter_wedge_merged.vdb > filter_wedge_merged.dot
dotsvg filter_wedge_merged

vdb.py filter_wedge_motion_merged.vdb > filter_wedge_motion_merged.dot
dotsvg filter_wedge_motion_merged
