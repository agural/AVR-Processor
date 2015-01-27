----------------------------------------------------------------------------
--  AVR Processor Control Block
--  Revision History:
--      01/26/15        Peter Cuy       initial version
--
----------------------------------------------------------------------------
-- bring in the necessary packages
library  ieee;
use  ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library opcodes;
use opcodes.opcodes.all;

library ALUCommands;
use ALUCommands.ALUCommands.all;


entity AVRControl is
    port (
            clock                   :  in  std_logic;                          --the system clock
            IR                      :  in  opcode_word;                        -- Instruction Register
            ALUStatusMask           :  out  std_logic_vector(7 downto 0);
            ALUBitChangeEn          :  out  std_logic;
            ALUBitClrSet            :  out  std_logic;
            ALUBitTOp               :  out  std_logic;
            ALUOp2Sel               :  out  std_logic;
            ImmediateOut            :  out  std_logic_vector(7 downto 0);
            ALUBlockSel             :  out  std_logic_vector(1 downto 0);
            ALUBlockInstructionSel  :  out  std_logic_vector(3 downto 0);
            
            --Outputs to registers
            EnableIn    :   out  std_logic;
            SelIn       :   out  std_logic_vector(5 downto 0);
            SelA        :   out  std_logic_vector(5 downto 0);
            SelB        :   out  std_logic_vector(5 downto 0)
        );
end AVRControl;

architecture DataFlow of AVRControl is
    signal CycleCount  :   std_logic := '0';
begin

    DecodeInstruction: process (IR)
    begin
        ALUOp2Sel <= RegOp2;        --default operand 2 is from register
        if std_match(IR, OpADC   ) then 
            ALUStatusMask <= flag_mask_ZCNVSH;
            ALUBlockSel <= ALUAddBlock;
        end if;

        if std_match(IR, OpADD   ) then 
            ALUStatusMask <= flag_mask_ZCNVSH;
            ALUBlockSel <= ALUAddBlock;
        end if;
        
        if std_match(IR, OpADIW  ) then 
            ALUStatusMask <= flag_mask_ZCNVS;
            ALUOp2Sel<= ImmedOp2;
            ALUBlockSel <= ALUAddBlock;
        end if;
        
        if std_match(IR, OpAND   ) then 
            ALUStatusMask <= flag_mask_ZNVS;
            ALUBlockSel <= ALUFBlock;
        end if;
        
        if std_match(IR, OpANDI  ) then 
            ALUOp2Sel<= ImmedOp2;
            ALUStatusMask <= flag_mask_ZNVS;
            ALUBlockSel <= ALUFBlock;
        end if;
        
        if std_match(IR, OpASR   ) then 
            ALUStatusMask <= flag_mask_ZCNVS;
            ALUBlockSel <= ALUShiftBlock;
        end if;
        
        if std_match(IR, OpBCLR  ) then 
        end if;
        
        if std_match(IR, OpBLD   ) then 
        end if;
        
        if std_match(IR, OpBSET  ) then 
        end if;
        
        if std_match(IR, OpBST   ) then 
        
        end if;
        
        if std_match(IR, OpCOM   ) then 
            ALUStatusMask <= flag_mask_ZCNVS;
            ALUBlockSel <= ALUFBlock;
        end if;
        
        if std_match(IR, OpCP    ) then 
            ALUStatusMask <= flag_mask_ZCNVSH;
        end if;
        
        if std_match(IR, OpCPC   ) then 
            ALUStatusMask <= flag_mask_ZCNVSH;
        end if;
        
        if std_match(IR, OpCPI   ) then 
            ALUStatusMask <= flag_mask_ZCNVSH;
            ALUOp2Sel<= ImmedOp2;
        end if;
        
        if std_match(IR, OpDEC   ) then 
            ALUStatusMask <= flag_mask_ZNVS;
        end if;
        
        if std_match(IR, OpEOR   ) then 
            ALUStatusMask <= flag_mask_ZNVS;
        end if;
        
        if std_match(IR, OpINC   ) then 
            ALUStatusMask <= flag_mask_ZNVS;
        end if;
        
        if std_match(IR, OpLSR   ) then 
            ALUStatusMask <= flag_mask_ZCNVS;
        end if;
        
        if std_match(IR, OpMUL   ) then 
            ALUStatusMask <= flag_mask_ZC;
        end if;
        
        if std_match(IR, OpNEG   ) then 
            ALUStatusMask <= flag_mask_ZCNVSH;
        end if;
        
        if std_match(IR, OpOR    ) then 
            ALUStatusMask <= flag_mask_ZNVS;
        end if;
        
        if std_match(IR, OpORI   ) then 
            ALUStatusMask <= flag_mask_ZNVS;
            ALUOp2Sel<= ImmedOp2;
        end if;
        
        if std_match(IR, OpROR   ) then 
            ALUStatusMask <= flag_mask_ZCNVS;
        end if;
        
        if std_match(IR, OpSBC   ) then 
            ALUStatusMask <= flag_mask_ZCNVSH;
        end if;
        
        if std_match(IR, OpSBCI  ) then
            ALUStatusMask <= flag_mask_ZCNVSH;
            ALUOp2Sel<= ImmedOp2;        
        end if;
        
        if std_match(IR, OpSBIW  ) then 
            ALUStatusMask <= flag_mask_ZCNVS;
            ALUOp2Sel<= ImmedOp2;
        end if;
        
        if std_match(IR, OpSUB   ) then 
            ALUStatusMask <= flag_mask_ZCNVSH;
        end if;
        
        if std_match(IR, OpSUBI  ) then 
            ALUStatusMask <= flag_mask_ZCNVSH;
            ALUOp2Sel<= ImmedOp2;
        end if;
        
        if std_match(IR, OpSWAP  ) then 
            ALUStatusMask <= flag_mask_KEEPALL;
        end if;
    
    end process DecodeInstruction;
    
    
    UpdateCycleCount: process(clock)
    begin
        if rising_edge(clock) then
            CycleCount <= '0';
            if CycleCount = '0' and ( std_match(IR, OpMUL) or std_match(IR, OpADIW) or std_match(IR, OpSBIW) ) then
                CycleCount <= '1';
            end if;
        end if;
    end process UpdateCycleCount;
    
end DataFlow;