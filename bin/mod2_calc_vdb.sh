
# this contains vdb.py
export PATH=$PATH:/users/jon/epics/local/bin

# this contains epicsUtils.py
export PYTHONPATH=$PYTHONPATH:/users/jon/epics/bessy

vdb.py mod2_calc_outputs.vdb > mod2_calc_outputs.dot
dotsvg mod2_calc_outputs

vdb.py mod2_merged.vdb > mod2_merged.dot
dotsvg mod2_merged
