.PHONY : com sim clean

VCS = vcs	-sverilog +v2k -timescale=1ns/1ns \
			-debug_all

SIM = ./simv -gui

com:
		${VCS} -f vending_machine.f

sim:
		${SIM}

clean:
		rm -rf ./csrc ./DVEfiles *.daidir *.log simv* *.key *.vpd 