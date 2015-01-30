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
static const char *ng0 = "C:/Users/Albert/Documents/GitHub/AVR-Processor/src/AVR/ALUStatus.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );
char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1837678034_503743352(char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );
char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);


static void work_a_4114217606_3990940387_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(48, ng0);

LAB3:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = (8U - 1);
    t4 = (t3 - 7);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t1 = (t2 + t7);
    t8 = *((unsigned char *)t1);
    t9 = (t0 + 5040);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t8;
    xsi_driver_first_trans_fast(t9);

LAB2:    t14 = (t0 + 4928);
    *((int *)t14) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_4114217606_3990940387_p_1(char *t0)
{
    char t23[16];
    char t26[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned char t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned char t16;
    unsigned char t17;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t24;
    char *t25;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    unsigned int t32;

LAB0:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 5104);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t8 = *((unsigned char *)t2);
    t9 = (t8 == (unsigned char)2);
    if (t9 == 1)
        goto LAB5;

LAB6:    t7 = (unsigned char)0;

LAB7:    if (t7 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t7 = *((unsigned char *)t2);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB35;

LAB36:    xsi_set_current_line(102, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t7 = *((unsigned char *)t2);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB56;

LAB58:    xsi_set_current_line(105, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 8040U);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t3 = (t0 + 7992U);
    t5 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t26, t4, t3);
    t6 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t23, t2, t1, t5, t26);
    t19 = (t23 + 12U);
    t13 = *((unsigned int *)t19);
    t14 = (1U * t13);
    t7 = (8U != t14);
    if (t7 == 1)
        goto LAB61;

LAB62:    t20 = (t0 + 5168);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t25 = (t22 + 56U);
    t27 = *((char **)t25);
    memcpy(t27, t6, 8U);
    xsi_driver_first_trans_fast(t20);

LAB57:
LAB3:    t1 = (t0 + 4944);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 1352U);
    t4 = *((char **)t1);
    t12 = (0 - 7);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t1 = (t4 + t15);
    t16 = *((unsigned char *)t1);
    t17 = (t16 == (unsigned char)3);
    if (t17 != 0)
        goto LAB8;

LAB10:
LAB9:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t12 = (1 - 7);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t1 = (t2 + t15);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB11;

LAB13:
LAB12:    xsi_set_current_line(69, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t12 = (2 - 7);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t1 = (t2 + t15);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB23;

LAB25:
LAB24:    xsi_set_current_line(74, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t12 = (3 - 7);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t1 = (t2 + t15);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB26;

LAB28:
LAB27:    xsi_set_current_line(79, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t12 = (4 - 7);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t1 = (t2 + t15);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB29;

LAB31:
LAB30:    xsi_set_current_line(84, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t12 = (5 - 7);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t1 = (t2 + t15);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB32;

LAB34:
LAB33:    goto LAB3;

LAB5:    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t10 = *((unsigned char *)t3);
    t11 = (t10 == (unsigned char)2);
    t7 = t11;
    goto LAB7;

LAB8:    xsi_set_current_line(56, ng0);
    t5 = (t0 + 1832U);
    t6 = *((char **)t5);
    t18 = *((unsigned char *)t6);
    t5 = (t0 + 5168);
    t19 = (t5 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    *((unsigned char *)t22) = t18;
    xsi_driver_first_trans_delta(t5, 7U, 1, 0LL);
    goto LAB9;

LAB11:    xsi_set_current_line(61, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t3 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t23, 0, 8);
    t9 = 1;
    if (8U == 8U)
        goto LAB17;

LAB18:    t9 = 0;

LAB19:    if (t9 != 0)
        goto LAB14;

LAB16:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 5168);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 6U, 1, 0LL);

LAB15:    goto LAB12;

LAB14:    xsi_set_current_line(62, ng0);
    t19 = (t0 + 5168);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t25 = *((char **)t22);
    *((unsigned char *)t25) = (unsigned char)3;
    xsi_driver_first_trans_delta(t19, 6U, 1, 0LL);
    goto LAB15;

LAB17:    t24 = 0;

LAB20:    if (t24 < 8U)
        goto LAB21;
    else
        goto LAB19;

LAB21:    t5 = (t4 + t24);
    t6 = (t3 + t24);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB18;

LAB22:    t24 = (t24 + 1);
    goto LAB20;

LAB23:    xsi_set_current_line(70, ng0);
    t3 = (t0 + 2952U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t3 = (t0 + 5168);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t19 = (t6 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = t9;
    xsi_driver_first_trans_delta(t3, 5U, 1, 0LL);
    goto LAB24;

LAB26:    xsi_set_current_line(75, ng0);
    t3 = (t0 + 1672U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t3 = (t0 + 5168);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t19 = (t6 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = t9;
    xsi_driver_first_trans_delta(t3, 4U, 1, 0LL);
    goto LAB27;

LAB29:    xsi_set_current_line(80, ng0);
    t3 = (t0 + 2952U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t3 = (t0 + 1672U);
    t5 = *((char **)t3);
    t10 = *((unsigned char *)t5);
    t11 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t9, t10);
    t3 = (t0 + 5168);
    t6 = (t3 + 56U);
    t19 = *((char **)t6);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    *((unsigned char *)t21) = t11;
    xsi_driver_first_trans_delta(t3, 3U, 1, 0LL);
    goto LAB30;

LAB32:    xsi_set_current_line(85, ng0);
    t3 = (t0 + 1512U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t3 = (t0 + 5168);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t19 = (t6 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = t9;
    xsi_driver_first_trans_delta(t3, 2U, 1, 0LL);
    goto LAB33;

LAB35:    xsi_set_current_line(88, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t9 = *((unsigned char *)t3);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB37;

LAB39:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t12 = (6 - 7);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t1 = (t2 + t15);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB49;

LAB51:    xsi_set_current_line(98, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 7976U);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t3 = (t0 + 7992U);
    t5 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t26, t4, t3);
    t6 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t23, t2, t1, t5, t26);
    t19 = (t23 + 12U);
    t13 = *((unsigned int *)t19);
    t14 = (1U * t13);
    t7 = (8U != t14);
    if (t7 == 1)
        goto LAB54;

LAB55:    t20 = (t0 + 5104);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t25 = (t22 + 56U);
    t27 = *((char **)t25);
    memcpy(t27, t6, 8U);
    xsi_driver_first_trans_fast_port(t20);

LAB50:
LAB38:    goto LAB3;

LAB37:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 1192U);
    t4 = *((char **)t1);
    t1 = (t0 + 7976U);
    t5 = (t0 + 1352U);
    t6 = *((char **)t5);
    t5 = (t0 + 7992U);
    t19 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t23, t4, t1, t6, t5);
    t20 = (t23 + 12U);
    t13 = *((unsigned int *)t20);
    t14 = (1U * t13);
    t21 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t26, 0, 8);
    t11 = 1;
    if (t14 == 8U)
        goto LAB43;

LAB44:    t11 = 0;

LAB45:    if (t11 != 0)
        goto LAB40;

LAB42:    xsi_set_current_line(92, ng0);
    t1 = (t0 + 5168);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 1U, 1, 0LL);

LAB41:    goto LAB38;

LAB40:    xsi_set_current_line(90, ng0);
    t27 = (t0 + 5168);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    *((unsigned char *)t31) = (unsigned char)2;
    xsi_driver_first_trans_delta(t27, 1U, 1, 0LL);
    goto LAB41;

LAB43:    t15 = 0;

LAB46:    if (t15 < t14)
        goto LAB47;
    else
        goto LAB45;

LAB47:    t22 = (t19 + t15);
    t25 = (t21 + t15);
    if (*((unsigned char *)t22) != *((unsigned char *)t25))
        goto LAB44;

LAB48:    t15 = (t15 + 1);
    goto LAB46;

LAB49:    xsi_set_current_line(96, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t3 = (t0 + 7976U);
    t5 = (t0 + 1352U);
    t6 = *((char **)t5);
    t5 = (t0 + 7992U);
    t19 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t23, t4, t3, t6, t5);
    t20 = (t23 + 12U);
    t24 = *((unsigned int *)t20);
    t32 = (1U * t24);
    t9 = (8U != t32);
    if (t9 == 1)
        goto LAB52;

LAB53:    t21 = (t0 + 5104);
    t22 = (t21 + 56U);
    t25 = *((char **)t22);
    t27 = (t25 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t19, 8U);
    xsi_driver_first_trans_fast_port(t21);
    goto LAB50;

LAB52:    xsi_size_not_matching(8U, t32, 0);
    goto LAB53;

LAB54:    xsi_size_not_matching(8U, t14, 0);
    goto LAB55;

LAB56:    xsi_set_current_line(103, ng0);
    t1 = (t0 + 2792U);
    t3 = *((char **)t1);
    t1 = (t0 + 8040U);
    t4 = (t0 + 1352U);
    t5 = *((char **)t4);
    t4 = (t0 + 7992U);
    t6 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t23, t3, t1, t5, t4);
    t19 = (t23 + 12U);
    t13 = *((unsigned int *)t19);
    t14 = (1U * t13);
    t9 = (8U != t14);
    if (t9 == 1)
        goto LAB59;

LAB60:    t20 = (t0 + 5168);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t25 = (t22 + 56U);
    t27 = *((char **)t25);
    memcpy(t27, t6, 8U);
    xsi_driver_first_trans_fast(t20);
    goto LAB57;

LAB59:    xsi_size_not_matching(8U, t14, 0);
    goto LAB60;

LAB61:    xsi_size_not_matching(8U, t14, 0);
    goto LAB62;

}

static void work_a_4114217606_3990940387_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(110, ng0);

LAB3:    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 5232);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4960);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_4114217606_3990940387_init()
{
	static char *pe[] = {(void *)work_a_4114217606_3990940387_p_0,(void *)work_a_4114217606_3990940387_p_1,(void *)work_a_4114217606_3990940387_p_2};
	xsi_register_didat("work_a_4114217606_3990940387", "isim/testbench_isim_beh.exe.sim/work/a_4114217606_3990940387.didat");
	xsi_register_executes(pe);
}
