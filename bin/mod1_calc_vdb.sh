
# this contains vdb.py
export PATH=$PATH:/users/jon/epics/local/bin

# this contains epicsUtils.py
export PYTHONPATH=$PYTHONPATH:/users/jon/epics/bessy

vdb.py mod1_calc_outputs.vdb > mod1_calc_outputs.dot
dotsvg mod1_calc_outputs

# to create merged:
# cat mod1_calc_outputs.vdb mod1_write_outputs_subs.db  > mod1_merged.db

vdb.py mod1_merged.vdb > mod1_merged.dot
dotsvg mod1_merged
