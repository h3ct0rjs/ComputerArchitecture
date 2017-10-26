library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Processor is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end Processor;

architecture Behavioral of Processor is

  COMPONENT Sumador
    PORT(
      Operador1 : IN std_logic_vector(31 downto 0);
      Resultado : OUT std_logic_vector(31 downto 0)
      );
  END COMPONENT;

  COMPONENT adder_SEU22
    PORT(
      OP1 : IN std_logic_vector(31 downto 0);
      OP2 : IN std_logic_vector(31 downto 0);
      AddOut : OUT std_logic_vector(31 downto 0)
      );
  END COMPONENT;

	COMPONENT adder_COR
	PORT(
		OP1 : IN std_logic_vector(29 downto 0);
		OP2 : IN std_logic_vector(31 downto 0);
		Addout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT ALU
	PORT(
      ALUOP : IN std_logic_vector(5 downto 0);
      Carry : IN std_logic;
      OPer1 : IN std_logic_vector(31 downto 0);
      OPer2 : IN std_logic_vector(31 downto 0);
      Salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT CU
	PORT(
      OP : IN std_logic_vector(1 downto 0);
      OP3 : IN std_logic_vector(5 downto 0);
      icc : IN std_logic_vector(3 downto 0);
      Cond : IN std_logic_vector(3 downto 0);

      wren : OUT std_logic;
      PCsource : OUT std_logic_vector(1 downto 0);
      ALUOP : OUT std_logic_vector(5 downto 0);
      RdEnMem : OUT std_logic;
      WrEnMem : OUT std_logic;
      RFsource : OUT std_logic_vector(1 downto 0);
      RFdest : OUT std_logic
		);
	END COMPONENT;

COMPONENT DataMemory
	PORT(
      WrEnMem : IN std_logic;
      RdEnMem : IN std_logic;
      reset : IN std_logic;
      crd : IN std_logic_vector(31 downto 0);
      ALUResult : IN std_logic_vector(31 downto 0);
      DataToMem : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT IM
	PORT(
    --clkFPGA: in std_logic;
		rst : IN std_logic;
		addr : IN std_logic_vector(31 downto 0);
		data : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT MUX_wm
	PORT(
		RDin : IN std_logic_vector(5 downto 0);
		o15 : IN std_logic_vector(5 downto 0);
		RFDest : IN std_logic;
		nRD : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	COMPONENT MUX_rf
	PORT(
		CRS2 : IN std_logic_vector(31 downto 0);
		SEUimm13 : IN std_logic_vector(31 downto 0);
		i : IN std_logic;
		OPer2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT MUX_COR
	PORT(
		ALUaddress : IN std_logic_vector(31 downto 0);
		PC_dis30 : IN std_logic_vector(31 downto 0);
		PC_seu : IN std_logic_vector(31 downto 0);
		PC_4 : IN std_logic_vector(4 downto 0);
		PCsource : IN std_logic_vector(1 downto 0);
		MUXout : OUT std_logic_vector(4 downto 0)
		);
	END COMPONENT;

COMPONENT MUX_DM
	PORT(
		PC : IN std_logic_vector(4 downto 0);
		RFsource : IN std_logic_vector(1 downto 0);
		DataToMem : IN std_logic_vector(31 downto 0);
		ALUResult : IN std_logic_vector(31 downto 0);
		DataToReg : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT PC
	PORT(
		DAT_in : IN std_logic_vector(4 downto 0);
		rst : IN std_logic;
		clk : IN std_logic;
		DAT_out : OUT std_logic_vector(4 downto 0)
		);
	END COMPONENT;

	COMPONENT PSR_Modifier
	PORT(
		rst : IN std_logic;
		OP1 : IN std_logic_vector(31 downto 0);
		OP2 : IN std_logic_vector(31 downto 0);
		AluOp : IN std_logic_vector(7 downto 0);
		AluResult : IN std_logic_vector(31 downto 0);
		NZVC : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

COMPONENT PSR
	PORT(
		clk : IN std_logic;
		Rst : IN std_logic;
		NZVC : IN std_logic_vector(3 downto 0);
		Ncwp : IN std_logic_vector(4 downto 0);
		Cwp : OUT std_logic_vector(4 downto 0);
		Carry : OUT std_logic;
		icc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	COMPONENT RF
	PORT(
		rst : IN std_logic;
		RS1 : IN std_logic_vector(5 downto 0);
		RS2 : IN std_logic_vector(5 downto 0);
		RD : IN std_logic_vector(5 downto 0);
		DATATOREG : IN std_logic_vector(31 downto 0);
		dwr : IN std_logic;
		ORS1 : OUT std_logic_vector(31 downto 0);
		ORS2 : OUT std_logic_vector(31 downto 0);
		CRD : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT Mod5Seu
	PORT(
		imm13 : IN std_logic_vector(12 downto 0);
		SEUimm32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT windows_manager_arch is
   Port ( 
           rst : in std_logic;
           rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           CWP : in  STD_LOGIC_VECTOR (4 downto 0);
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0);
           nCWP : out  STD_LOGIC_VECTOR (4 downto 0);
           no7 : out  STD_LOGIC_VECTOR (5 downto 0)
         );
	END COMPONENT;

	COMPONENT SEU22
	PORT(
		disp22 : IN std_logic_vector(21 downto 0);
		seuOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal nPCtoPC : std_logic_vector (31 downto 0) := (others => '0');
signal PCtoOthers : std_logic_vector(31 downto 0):= (others => '0');
signal IMout : std_logic_vector(31 downto 0):= (others => '0');
signal nrdWM : std_logic_vector (5 downto 0):= (others => '0');
signal o7WM : std_logic_vector (5 downto 0):= (others => '0');
signal pc_4 : std_logic_vector (31 downto 0):= (others => '0');
signal disp22e : std_logic_vector (31 downto 0):= (others => '0');
signal disp22_PC : std_logic_vector (31 downto 0):= (others => '0');
signal disp30_PC : std_logic_vector (31 downto 0):= (others => '0');
signal cualuop : std_logic_vector (5 downto 0):= (others => '0');
signal carry_p : std_logic:='0';
signal crs1_p : std_logic_vector (31 downto 0):= (others => '0');
signal crs2_p : std_logic_vector (31 downto 0):= (others => '0');
signal seusimm13 : std_logic_vector (31 downto 0):= (others => '0');
signal frs2 : std_logic_vector (31 downto 0):= (others => '0');
signal ALUout : std_logic_vector (31 downto 0):= (others => '0');
signal icc_p : std_logic_vector (3 downto 0):= (others => '0');
signal wren_p : std_logic:='0';
signal rfdest_p : std_logic:='0';
signal rfsource_p : std_logic_vector (1 downto 0):= (others => '0');
signal pcsource_p : std_logic_vector (1 downto 0):= (others => '0');
signal rdenmem_p : std_logic:='0';
signal wrenmem_p : std_logic:='0';
signal crd_p : std_logic_vector (31 downto 0);
signal datatoreg_p : std_logic_vector (31 downto 0):= (others => '0');
signal datatomux : std_logic_vector (31 downto 0):= (others => '0');
signal mux1torf : std_logic_vector (5 downto 0):= (others => '0');
signal nrs1_p : std_logic_vector (5 downto 0):= (others => '0');
signal nrs2_p : std_logic_vector (5 downto 0):= (others => '0');
signal cwp_p : std_logic_vector (4 downto 0):= (others => '0');
signal ncwp_p : std_logic_vector (4 downto 0):= (others => '0');
signal nzvc_p : std_logic_vector (3 downto 0):= (others => '0');
signal mux3tonpc : std_logic_vector (4 downto 0):= (others => '0');





begin
	Inst_SEU22: SEU22 PORT MAP(
		disp22 => IMout(21 downto 0),
		seuOut => disp22e
	);
	Inst_Sumador_module: Sumador PORT MAP(
			Operador1 => PCtoOthers,
			Resultado => pc_4
		);
	Inst_adder_SEU22: adder_SEU22 PORT MAP(
		OP1 => PCtoOthers,
		OP2 => disp22e,
		AddOut => disp22_PC
	);
	Inst_adder_COR: adder_COR PORT MAP(
		OP1 => IMout(29 downto 0),
		OP2 => PCtoOthers,
		Addout => disp30_PC
	);
	Inst_ALU: ALU PORT MAP(
		ALUOP => cualuop,
		Carry => carry_p,
		OPer1 => crs1_p,
		OPer2 => frs2,
		Salida => ALUout
	);
	Inst_CU: CU PORT MAP(
		OP => IMout (31 downto 30),
		OP3 => IMout (24 downto 19),
		icc => icc_p,
		Cond => IMout (28 downto 25),
		wren => wren_p,
		PCsource => pcsource_p,
		ALUOP => cualuop,
		RdEnMem => rdenmem_p,
		WrEnMem => wrenmem_p,
		RFsource => rfsource_p,
		RFdest => rfdest_p

	);
	Inst_DataMemory: DataMemory PORT MAP(
		WrEnMem => wrenmem_p,
		RdEnMem => rdenmem_p,
		reset => reset,
		crd => crd_p,
		ALUResult => ALUout,
		DataToMem => datatomux
	);
	Inst_IM: IM PORT MAP(
		--clkFPGA=>clk,
		rst => reset,
		addr => PCtoOthers,
		data => IMout
	);
	Inst_MUX_wm: MUX_wm PORT MAP(
		RDin => nrdWM,
		o15 => o7WM,
		RFDest => rfdest_p,
		nRD => mux1torf
	);
	Inst_MUX_rf: MUX_rf PORT MAP(
		CRS2 => crs2_p,
		SEUimm13 => seusimm13,
		i => IMout (13),
		OPer2 => frs2
	);
	Inst_MUX_COR: MUX_COR PORT MAP(
		ALUaddress => ALUout,
		PC_dis30 => disp30_PC,
		PC_seu => disp22_PC,
		PC_4 => pc_4,
		PCsource => pcsource_p,
		MUXout => mux3tonpc
	);
	Inst_MUX_DM: MUX_DM PORT MAP(
		PC => PCtoOthers,
		RFsource => rfsource_p,
		DataToMem => datatomux ,
		ALUResult => ALUout,
		DataToReg => datatoreg_p
	);
	Inst_PC: PC PORT MAP(
		DAT_in => nPCtoPC,
		rst => reset,
		clk => clk,
		DAT_out => PCtoOthers
	);
	Inst_nPC: PC PORT MAP(
		DAT_in => mux3tonpc,
		rst => reset,
		clk => clk,
		DAT_out => nPCtoPC
	);


	Inst_PSR_Modifier: PSR_Modifier PORT MAP(
		rst => reset,
		OP1 => crs1_p ,
		OP2 => crs2_p,
		AluOp => cualuop,
		AluResult => ALUout,
		NZVC => nzvc_p
	);
	Inst_PSR: PSR PORT MAP(
		clk => clk,
		Rst => reset ,
		NZVC => nzvc_p,
		Ncwp => ncwp_p,
		Cwp => cwp_p,
		Carry => carry_p,
		icc => icc_p
	);
  
	Inst_RF: RF PORT MAP(
		rst => reset,
		RS1 => nrs1_p,
		RS2 => nrs2_p,
		RD => mux1torf,
		DATATOREG => datatoreg_p ,
		Dwr => wren_p,
		ORS1 => crs1_p,
		ORS2 => crs2_p,
		CRD => crd_p
	);
	Inst_Mod5Seu: Mod5Seu PORT MAP(
		imm13 => IMout (12 downto 0),
		SEUimm32 =>  seusimm13
	);
	Inst_windows_manager_arch: windows_manager_arch PORT MAP(
		rst => reset,
		cwp => cwp_p,
		rs1 => IMout (18 downto 14),
		rs2 => IMout (4 downto 0) ,
		rd => IMout (29 downto 25),
    op => IMout (31 downto 30),
		op3 => IMout (24 downto 19),
		ncwp => ncwp_p,
		nrs1 => nrs1_p,
		nrs2 => nrs2_p,
		nrd => nrdWM,
		no7 => o7WM
	);

DataOut<=datatoreg_p;

end Behavioral;
