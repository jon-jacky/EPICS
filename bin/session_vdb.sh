
# this contains vdb.py
export PATH=$PATH:/users/jon/epics/local/bin

# this contains epicsUtils.py
export PYTHONPATH=$PYTHONPATH:/users/jon/epics/bessy

vdb.py session.vdb > session.dot
dotsvg session

vdb.py session_subs.vdb > session_subs.dot
dotsvg session_subs

vdb.py session_merged.vdb > session_merged.dot
dotsvg session_merged
