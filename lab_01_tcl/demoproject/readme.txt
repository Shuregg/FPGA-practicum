The script should be located next to the source folders! (**/demoproject/demoproject.tcl ; **/demoproject/<source dir>)

For Windows:
call D:\Programs\Vivado\2019.2\settings64.bat  
demoproject> vivado -mode=batch -nojournal -nolog -source .\demoproject.tcl

For linux-like systems:
/tools/Xilinx/Vivado\2019.2/settings64.sh
demoproject> vivado -mode batch -nojournal -nolog -source ./demoproject.tcl