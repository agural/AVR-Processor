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
static const char *ng0 = "C:/Users/Albert/Documents/GitHub/AVR-Processor/src/AVR/ALUShiftBlock.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );


static void work_a_3614265867_3990940387_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(39, ng0);

LAB3:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 4344);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4216);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3614265867_3990940387_p_1(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned char t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(41, ng0);

LAB3:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = (0 - 7);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 1992U);
    t9 = *((char **)t8);
    t10 = (8U - 1);
    t11 = (t10 - 7);
    t12 = (t11 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t8 = (t9 + t14);
    t15 = *((unsigned char *)t8);
    t16 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t7, t15);
    t17 = (t0 + 4408);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    *((unsigned char *)t21) = t16;
    xsi_driver_first_trans_fast_port(t17);

LAB2:    t22 = (t0 + 4232);
    *((int *)t22) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3614265867_3990940387_p_2(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(42, ng0);

LAB3:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = (0 - 7);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 4472);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t7;
    xsi_driver_first_trans_fast_port(t8);

LAB2:    t13 = (t0 + 4248);
    *((int *)t13) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3614265867_3990940387_p_3(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    char *t22;
    char *t23;
    int t24;
    int t25;
    int t26;
    int t27;
    int t28;
    int t29;

LAB0:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = (2 - 2);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = (2 - 1);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t9 = (t0 + 6960);
    t7 = 1;
    if (2U == 2U)
        goto LAB8;

LAB9:    t7 = 0;

LAB10:    if (t7 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = (2 - 1);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t9 = (t0 + 6962);
    t7 = 1;
    if (2U == 2U)
        goto LAB16;

LAB17:    t7 = 0;

LAB18:    if (t7 != 0)
        goto LAB14;

LAB15:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t7 = *((unsigned char *)t2);
    t1 = (t0 + 4536);
    t9 = (t1 + 56U);
    t10 = *((char **)t9);
    t14 = (t10 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = t7;
    xsi_driver_first_trans_delta(t1, 0U, 1, 0LL);

LAB6:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 6964);
    *((int *)t1) = 0;
    t2 = (t0 + 6968);
    *((int *)t2) = 6;
    t3 = 0;
    t24 = 6;

LAB22:    if (t3 <= t24)
        goto LAB23;

LAB25:
LAB3:    t1 = (t0 + 4264);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(47, ng0);
    t9 = (t0 + 1192U);
    t10 = *((char **)t9);
    t11 = (7 - 3);
    t12 = (t11 * 1U);
    t13 = (0 + t12);
    t9 = (t10 + t13);
    t14 = (t0 + 4536);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t9, 4U);
    xsi_driver_first_trans_delta(t14, 0U, 4U, 0LL);
    xsi_set_current_line(48, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t4 = (7 - 7);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t9 = (t0 + 4536);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t1, 4U);
    xsi_driver_first_trans_delta(t9, 4U, 4U, 0LL);
    goto LAB3;

LAB5:    xsi_set_current_line(51, ng0);
    t16 = (t0 + 4536);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = (unsigned char)2;
    xsi_driver_first_trans_delta(t16, 0U, 1, 0LL);
    goto LAB6;

LAB8:    t11 = 0;

LAB11:    if (t11 < 2U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t14 = (t1 + t11);
    t15 = (t9 + t11);
    if (*((unsigned char *)t14) != *((unsigned char *)t15))
        goto LAB9;

LAB13:    t11 = (t11 + 1);
    goto LAB11;

LAB14:    xsi_set_current_line(53, ng0);
    t16 = (t0 + 1192U);
    t17 = *((char **)t16);
    t3 = (7 - 7);
    t12 = (t3 * -1);
    t13 = (1U * t12);
    t21 = (0 + t13);
    t16 = (t17 + t21);
    t8 = *((unsigned char *)t16);
    t18 = (t0 + 4536);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t22 = (t20 + 56U);
    t23 = *((char **)t22);
    *((unsigned char *)t23) = t8;
    xsi_driver_first_trans_delta(t18, 0U, 1, 0LL);
    goto LAB6;

LAB16:    t11 = 0;

LAB19:    if (t11 < 2U)
        goto LAB20;
    else
        goto LAB18;

LAB20:    t14 = (t1 + t11);
    t15 = (t9 + t11);
    if (*((unsigned char *)t14) != *((unsigned char *)t15))
        goto LAB17;

LAB21:    t11 = (t11 + 1);
    goto LAB19;

LAB23:    xsi_set_current_line(58, ng0);
    t9 = (t0 + 1192U);
    t10 = *((char **)t9);
    t9 = (t0 + 6964);
    t25 = *((int *)t9);
    t26 = (t25 + 1);
    t27 = (t26 - 7);
    t4 = (t27 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t26);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t14 = (t10 + t6);
    t7 = *((unsigned char *)t14);
    t15 = (t0 + 6964);
    t28 = *((int *)t15);
    t29 = (t28 - 7);
    t11 = (t29 * -1);
    t12 = (1 * t11);
    t13 = (0U + t12);
    t16 = (t0 + 4536);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = t7;
    xsi_driver_first_trans_delta(t16, t13, 1, 0LL);

LAB24:    t1 = (t0 + 6964);
    t3 = *((int *)t1);
    t2 = (t0 + 6968);
    t24 = *((int *)t2);
    if (t3 == t24)
        goto LAB25;

LAB26:    t25 = (t3 + 1);
    t3 = t25;
    t9 = (t0 + 6964);
    *((int *)t9) = t3;
    goto LAB22;

}


extern void work_a_3614265867_3990940387_init()
{
	static char *pe[] = {(void *)work_a_3614265867_3990940387_p_0,(void *)work_a_3614265867_3990940387_p_1,(void *)work_a_3614265867_3990940387_p_2,(void *)work_a_3614265867_3990940387_p_3};
	xsi_register_didat("work_a_3614265867_3990940387", "isim/testbench_isim_beh.exe.sim/work/a_3614265867_3990940387.didat");
	xsi_register_executes(pe);
}
