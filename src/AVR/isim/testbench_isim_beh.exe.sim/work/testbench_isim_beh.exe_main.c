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

char *STD_STANDARD;
char *OPCODES_P_2431924499;
char *IEEE_P_3972351953;
char *IEEE_P_3499444699;
char *ALUCOMMANDS_P_1015570589;
char *IEEE_P_2592010699;
char *IEEE_P_1242562249;
char *IEEE_P_3620187407;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3972351953_init();
    opcodes_p_2431924499_init();
    alucommands_p_1015570589_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_0756711975_3990940387_init();
    work_a_3614265867_3990940387_init();
    work_a_0994163301_3990940387_init();
    work_a_1386427196_3990940387_init();
    work_a_4114217606_3990940387_init();
    work_a_0832606739_3990940387_init();
    work_a_0742008511_3990940387_init();
    work_a_1916396443_1181938964_init();
    work_a_1949178628_2494385415_init();


    xsi_register_tops("work_a_1949178628_2494385415");

    STD_STANDARD = xsi_get_engine_memory("std_standard");
    OPCODES_P_2431924499 = xsi_get_engine_memory("opcodes_p_2431924499");
    IEEE_P_3972351953 = xsi_get_engine_memory("ieee_p_3972351953");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    ALUCOMMANDS_P_1015570589 = xsi_get_engine_memory("alucommands_p_1015570589");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");

    return xsi_run_simulation(argc, argv);

}