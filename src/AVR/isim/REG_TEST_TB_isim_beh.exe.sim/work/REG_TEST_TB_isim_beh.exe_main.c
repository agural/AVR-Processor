/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *OPCODES_P_2431924499;
char *IEEE_P_1242562249;
char *IEEE_P_2592010699;
char *STD_STANDARD;
char *ALUCOMMANDS_P_1015570589;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    opcodes_p_2431924499_init();
    alucommands_p_1015570589_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_0227929785_3990940387_init();
    work_a_0742008511_3990940387_init();
    work_a_1282967129_1115916627_init();
    work_a_2476457035_2494385415_init();


    xsi_register_tops("work_a_2476457035_2494385415");

    OPCODES_P_2431924499 = xsi_get_engine_memory("opcodes_p_2431924499");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    ALUCOMMANDS_P_1015570589 = xsi_get_engine_memory("alucommands_p_1015570589");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");

    return xsi_run_simulation(argc, argv);

}
