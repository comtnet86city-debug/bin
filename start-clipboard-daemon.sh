#!/bin/bash
export DISPLAY="${DISPLAY:-:10.0}"
exec python3 /home/jwd/bin/clipboard-png-daemon \
    >> /home/jwd/ai_projects/logs/clipboard-daemon.log 2>&1
