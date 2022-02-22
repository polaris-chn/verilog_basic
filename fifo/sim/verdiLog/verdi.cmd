verdiWindowResize -win $_Verdi_1 "0" "25" "1920" "1003"
debImport "/home/IC/Desktop/FIFO_Verdi/sim/detect_1011.v" \
          "/home/IC/Desktop/FIFO_Verdi/sim/tb_seq_1011.v" -path \
          {/home/IC/Desktop/FIFO_Verdi/sim}
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/IC/Desktop/FIFO_Verdi/sim/seq_1011.fsdb}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_seq_1011"
wvGetSignalSetScope -win $_nWave2 "/tb_seq_1011/detect_1011_inst"
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_seq_1011/detect_1011_inst/clk_i} \
{/tb_seq_1011/detect_1011_inst/cstate\[3:0\]} \
{/tb_seq_1011/detect_1011_inst/nstate\[3:0\]} \
{/tb_seq_1011/detect_1011_inst/out_o} \
{/tb_seq_1011/detect_1011_inst/rst_n_i} \
{/tb_seq_1011/detect_1011_inst/seq_i} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_seq_1011/detect_1011_inst/clk_i} \
{/tb_seq_1011/detect_1011_inst/cstate\[3:0\]} \
{/tb_seq_1011/detect_1011_inst/nstate\[3:0\]} \
{/tb_seq_1011/detect_1011_inst/out_o} \
{/tb_seq_1011/detect_1011_inst/rst_n_i} \
{/tb_seq_1011/detect_1011_inst/seq_i} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G1" 6)}
wvGetSignalClose -win $_nWave2
wvSelectGroup -win $_nWave2 {G2}
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectGroup -win $_nWave2 {G2}
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
schCreateWindow "/tb_seq_1011/detect_1011_inst/cstate\[3:0\]" -delim "/" \
           -busContention
schSelect -win $_nSchema3 -inst \
          "tb_seq_1011.detect_1011_inst.detect_1011\(@1\):FSM0:15:50:FSM"
schPushViewIn -win $_nSchema3
fsmSetCurrentWindow -win $_nState4
fsmResizeWindow 0 28 1281 332 -win $_nState4
fsmResizeWindow 0 28 1281 332 -win $_nState4
fsmResizeWindow 0 28 1281 332 -win $_nState4
wvSetCursor -win $_nWave2 29.922582 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 16.544667 -snap {("G1" 5)}
srcHBSelect "tb_seq_1011.detect_1011_inst" -win $_nTrace1
wvSetCursor -win $_nWave2 42.201828 -snap {("G1" 6)}
verdiDockWidgetSetCurTab -dock windowDock_nSchema_3
verdiDockWidgetSetCurTab -dock windowDock_nState_4
verdiDockWidgetSetCurTab -dock windowDock_nSchema_3
wvSetCursor -win $_nWave2 37.354757 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 58.940378 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 47.953685 -snap {("G1" 2)}
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvRemoveAlias -win $_nWave2
wvUnsetAliasTable -win $_nWave2 -global -signal {("G1" 2)}
debExit
