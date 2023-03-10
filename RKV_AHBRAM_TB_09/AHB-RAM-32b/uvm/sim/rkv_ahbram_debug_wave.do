# Begin_DVE_Session_Save_Info
# DVE view(Wave.1 ) session
# Saved on Sun Jun 12 18:15:38 2022
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Wave.1: 33 signals
# End_DVE_Session_Save_Info

# DVE version: O-2018.09-SP2_Full64
# DVE build date: Feb 28 2019 23:39:41


#<Session mode="View" path="/home/liubin/project/rkv_labs/v2_labs/v2x_addon/spr22/AHB-RAM-32b/uvm/sim/rkv_ahbram_debug_wave.do.tcl" type="Debug">

#<Database>

gui_set_time_units 1ps
#</Database>

# DVE View/pane content session: 

# Begin_DVE_Session_Save_Info (Wave.1)
# DVE wave signals session
# Saved on Sun Jun 12 18:15:38 2022
# 33 signals
# End_DVE_Session_Save_Info

# DVE version: O-2018.09-SP2_Full64
# DVE build date: Feb 28 2019 23:39:41


#Add ncecessay scopes
gui_load_child_values {rkv_ahbram_tb.ahb_if}
gui_load_child_values {rkv_ahbram_tb.dut}

gui_set_time_units 1ps

set _wave_session_group_3 ahbram
if {[gui_sg_is_group -name "$_wave_session_group_3"]} {
    set _wave_session_group_3 [gui_sg_generate_new_name]
}
set Group1 "$_wave_session_group_3"

gui_sg_addsignal -group "$_wave_session_group_3" { {Sim:rkv_ahbram_tb.dut.HCLK} {Sim:rkv_ahbram_tb.dut.HRESETn} {Sim:rkv_ahbram_tb.dut.HSELBRAM} {Sim:rkv_ahbram_tb.dut.HREADY} {Sim:rkv_ahbram_tb.dut.HTRANS} {Sim:rkv_ahbram_tb.dut.HSIZE} {Sim:rkv_ahbram_tb.dut.HWRITE} {Sim:rkv_ahbram_tb.dut.HADDR} {Sim:rkv_ahbram_tb.dut.HWDATA} {Sim:rkv_ahbram_tb.dut.HREADYOUT} {Sim:rkv_ahbram_tb.dut.HRESP} {Sim:rkv_ahbram_tb.dut.HRDATA} }

set _wave_session_group_4 ahb_if
if {[gui_sg_is_group -name "$_wave_session_group_4"]} {
    set _wave_session_group_4 [gui_sg_generate_new_name]
}
set Group2 "$_wave_session_group_4"

gui_sg_addsignal -group "$_wave_session_group_4" { {Sim:rkv_ahbram_tb.ahb_if.hclk} {Sim:rkv_ahbram_tb.ahb_if.hresetn} {Sim:rkv_ahbram_tb.ahb_if.hgrant} {Sim:rkv_ahbram_tb.ahb_if.hrdata} {Sim:rkv_ahbram_tb.ahb_if.hready} {Sim:rkv_ahbram_tb.ahb_if.hresp} {Sim:rkv_ahbram_tb.ahb_if.haddr} {Sim:rkv_ahbram_tb.ahb_if.hsize} {Sim:rkv_ahbram_tb.ahb_if.htrans} {Sim:rkv_ahbram_tb.ahb_if.hwdata} {Sim:rkv_ahbram_tb.ahb_if.hwrite} {Sim:rkv_ahbram_tb.ahb_if.hburst} {Sim:rkv_ahbram_tb.ahb_if.hbusreq} {Sim:rkv_ahbram_tb.ahb_if.hlock} {Sim:rkv_ahbram_tb.ahb_if.hprot} {Sim:rkv_ahbram_tb.ahb_if.debug_hresp} {Sim:rkv_ahbram_tb.ahb_if.debug_htrans} {Sim:rkv_ahbram_tb.ahb_if.debug_hsize} {Sim:rkv_ahbram_tb.ahb_if.debug_hburst} {Sim:rkv_ahbram_tb.ahb_if.debug_xact} {Sim:rkv_ahbram_tb.ahb_if.debug_status} }
if {![info exists useOldWindow]} { 
	set useOldWindow true
}
if {$useOldWindow && [string first "Wave" [gui_get_current_window -view]]==0} { 
	set Wave.1 [gui_get_current_window -view] 
} else {
	set Wave.1 [lindex [gui_get_window_ids -type Wave] 0]
if {[string first "Wave" ${Wave.1}]!=0} {
gui_open_window Wave
set Wave.1 [ gui_get_current_window -view ]
}
}

set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 0 1354000
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group1}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group2}]
gui_list_select -id ${Wave.1} {rkv_ahbram_tb.dut.HRDATA }
gui_seek_criteria -id ${Wave.1} {Any Edge}


gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.1} -text {*}
gui_list_set_insertion_bar  -id ${Wave.1} -group ${Group2}  -item {rkv_ahbram_tb.ahb_if.debug_status[1:0]} -position below

gui_marker_move -id ${Wave.1} {C1} 1347172
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false
#</Session>

