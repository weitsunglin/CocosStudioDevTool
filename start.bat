@echo off

rem Start inanna.ffs_batch and wait for it to complete
start /wait "" "inanna.ffs_batch"

rem Now execute restart.bat
F:\_project\sync_data_restar_debug_tool\restart.bat

pause
