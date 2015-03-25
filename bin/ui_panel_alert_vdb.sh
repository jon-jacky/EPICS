
# this contains vdb.py
export PATH=$PATH:/users/jon/epics/local/bin

# this contains epicsUtils.py
export PYTHONPATH=$PYTHONPATH:/users/jon/epics/bessy

vdb.py ui_panel_alert.vdb > ui_panel_alert.dot
dotsvg ui_panel_alert


