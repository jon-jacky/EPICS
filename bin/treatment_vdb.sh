
# this contains vdb.py
export PATH=$PATH:/users/jon/epics/local/bin

# this contains epicsUtils.py
export PYTHONPATH=$PYTHONPATH:/users/jon/epics/bessy

vdb.py treatment.vdb > treatment.dot
dotsvg treatment

vdb.py treatment_record.vdb > treatment_record.dot
dotsvg treatment_record

vdb.py treatment_merged.vdb > treatment_merged.dot
dotsvg treatment_merged
