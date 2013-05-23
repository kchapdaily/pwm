
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name pwm -dir "/home/kevin/projects/pwm/planAhead_run_1" -part xc6slx16csg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "top_level_pwm.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {pwm_module.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {top_level_pwm.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top top_level_pwm $srcset
add_files [list {top_level_pwm.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx16csg324-3
