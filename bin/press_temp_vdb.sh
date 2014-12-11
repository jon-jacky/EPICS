
# this contains vdb.py
export PATH=$PATH:/users/jon/epics/local/bin

# this contains epicsUtils.py
export PYTHONPATH=$PYTHONPATH:/users/jon/epics/bessy

vdb.py press_temp.vdb > press_temp.dot
dotsvg press_temp

vdb.py press_temp_subs.vdb > press_temp_subs.dot
dotsvg press_temp_subs

vdb.py press_temp_merged.vdb > press_temp_merged.dot
dotsvg press_temp_merged
