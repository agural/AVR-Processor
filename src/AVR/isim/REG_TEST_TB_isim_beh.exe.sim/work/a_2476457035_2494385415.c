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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Albert/Documents/GitHub/AVR-Processor/src/AVR/REG_TEST_TB.vhd";



static void work_a_2476457035_2494385415_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int64 t9;
    unsigned char t10;
    unsigned int t11;

LAB0:    t1 = (t0 + 2992U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 6254);
    t4 = (t0 + 3624);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(58, ng0);
    t9 = (10 * 1000LL);
    t2 = (t0 + 2800);
    xsi_process_wait(t2, t9);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 6270);
    t10 = 1;
    if (8U == 8U)
        goto LAB10;

LAB11:    t10 = 0;

LAB12:    if (t10 == 0)
        goto LAB8;

LAB9:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 6298);
    t10 = 1;
    if (8U == 8U)
        goto LAB18;

LAB19:    t10 = 0;

LAB20:    if (t10 == 0)
        goto LAB16;

LAB17:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 6326);
    t4 = (t0 + 3688);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(62, ng0);
    t9 = (10 * 1000LL);
    t2 = (t0 + 2800);
    xsi_process_wait(t2, t9);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    t7 = (t0 + 6278);
    xsi_report(t7, 19U, 2);
    goto LAB9;

LAB10:    t11 = 0;

LAB13:    if (t11 < 8U)
        goto LAB14;
    else
        goto LAB12;

LAB14:    t5 = (t3 + t11);
    t6 = (t2 + t11);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB11;

LAB15:    t11 = (t11 + 1);
    goto LAB13;

LAB16:    t7 = (t0 + 6306);
    xsi_report(t7, 19U, 2);
    goto LAB17;

LAB18:    t11 = 0;

LAB21:    if (t11 < 8U)
        goto LAB22;
    else
        goto LAB20;

LAB22:    t5 = (t3 + t11);
    t6 = (t2 + t11);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB19;

LAB23:    t11 = (t11 + 1);
    goto LAB21;

LAB24:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 6334);
    t4 = (t0 + 3624);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(67, ng0);
    t9 = (10 * 1000LL);
    t2 = (t0 + 2800);
    xsi_process_wait(t2, t9);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB28:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 6350);
    t10 = 1;
    if (8U == 8U)
        goto LAB34;

LAB35:    t10 = 0;

LAB36:    if (t10 == 0)
        goto LAB32;

LAB33:    xsi_set_current_line(69, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 6378);
    t10 = 1;
    if (8U == 8U)
        goto LAB42;

LAB43:    t10 = 0;

LAB44:    if (t10 == 0)
        goto LAB40;

LAB41:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 6406);
    t4 = (t0 + 3688);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(71, ng0);
    t9 = (10 * 1000LL);
    t2 = (t0 + 2800);
    xsi_process_wait(t2, t9);

LAB50:    *((char **)t1) = &&LAB51;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    t7 = (t0 + 6358);
    xsi_report(t7, 19U, 2);
    goto LAB33;

LAB34:    t11 = 0;

LAB37:    if (t11 < 8U)
        goto LAB38;
    else
        goto LAB36;

LAB38:    t5 = (t3 + t11);
    t6 = (t2 + t11);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB35;

LAB39:    t11 = (t11 + 1);
    goto LAB37;

LAB40:    t7 = (t0 + 6386);
    xsi_report(t7, 19U, 2);
    goto LAB41;

LAB42:    t11 = 0;

LAB45:    if (t11 < 8U)
        goto LAB46;
    else
        goto LAB44;

LAB46:    t5 = (t3 + t11);
    t6 = (t2 + t11);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB43;

LAB47:    t11 = (t11 + 1);
    goto LAB45;

LAB48:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 3752);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(74, ng0);

LAB54:    *((char **)t1) = &&LAB55;
    goto LAB1;

LAB49:    goto LAB48;

LAB51:    goto LAB49;

LAB52:    goto LAB2;

LAB53:    goto LAB52;

LAB55:    goto LAB53;

}

static void work_a_2476457035_2494385415_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    int64 t10;

LAB0:    t1 = (t0 + 3240U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)0);
    if (t5 != 0)
        goto LAB4;

LAB6:    xsi_set_current_line(86, ng0);

LAB13:    *((char **)t1) = &&LAB14;

LAB1:    return;
LAB4:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 3816);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(84, ng0);
    t10 = (10 * 1000LL);
    t2 = (t0 + 3048);
    xsi_process_wait(t2, t10);

LAB9:    *((char **)t1) = &&LAB10;
    goto LAB1;

LAB5:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)0);
    if (t5 != 0)
        goto LAB15;

LAB17:    xsi_set_current_line(93, ng0);

LAB24:    *((char **)t1) = &&LAB25;
    goto LAB1;

LAB7:    goto LAB5;

LAB8:    goto LAB7;

LAB10:    goto LAB8;

LAB11:    goto LAB5;

LAB12:    goto LAB11;

LAB14:    goto LAB12;

LAB15:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 3816);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(91, ng0);
    t10 = (10 * 1000LL);
    t2 = (t0 + 3048);
    xsi_process_wait(t2, t10);

LAB20:    *((char **)t1) = &&LAB21;
    goto LAB1;

LAB16:    goto LAB2;

LAB18:    goto LAB16;

LAB19:    goto LAB18;

LAB21:    goto LAB19;

LAB22:    goto LAB16;

LAB23:    goto LAB22;

LAB25:    goto LAB23;

}


extern void work_a_2476457035_2494385415_init()
{
	static char *pe[] = {(void *)work_a_2476457035_2494385415_p_0,(void *)work_a_2476457035_2494385415_p_1};
	xsi_register_didat("work_a_2476457035_2494385415", "isim/REG_TEST_TB_isim_beh.exe.sim/work/a_2476457035_2494385415.didat");
	xsi_register_executes(pe);
}
