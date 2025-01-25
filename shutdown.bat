@echo off

:restart

shutdown -r -f -t 1 -m \\host-pc005
timeout 300

goto restart