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
static const char *ng0 = "C:/Users/Albert/Documents/GitHub/AVR-Processor/src/AVR/ALUFBlock.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );


static void work_a_0756711975_3990940387_p_0(char *t0)
{
    char t7[16];
    char t18[16];
    char t30[16];
    char *t1;
    char *t2;
    int t3;
    int t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned char t16;
    char *t17;
    char *t19;
    char *t20;
    char *t21;
    int t22;
    int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    unsigned char t28;
    char *t29;
    char *t31;
    int t32;
    int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;
    unsigned char t38;
    char *t39;
    int t40;
    int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;

LAB0:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 4948);
    *((int *)t1) = 0;
    t2 = (t0 + 4952);
    *((int *)t2) = 7;
    t3 = 0;
    t4 = 7;

LAB2:    if (t3 <= t4)
        goto LAB3;

LAB5:    t1 = (t0 + 2992);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(41, ng0);
    t5 = (t0 + 1032U);
    t6 = *((char **)t5);
    t5 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t7, 0, 0);
    t8 = (t0 + 1192U);
    t9 = *((char **)t8);
    t8 = (t0 + 4948);
    t10 = *((int *)t8);
    t11 = (t10 - 7);
    t12 = (t11 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t8));
    t13 = (1U * t12);
    t14 = (0 + t13);
    t15 = (t9 + t14);
    t16 = *((unsigned char *)t15);
    t19 = ((IEEE_P_2592010699) + 4024);
    t17 = xsi_base_array_concat(t17, t18, t19, (char)97, t5, t7, (char)99, t16, (char)101);
    t20 = (t0 + 1352U);
    t21 = *((char **)t20);
    t20 = (t0 + 4948);
    t22 = *((int *)t20);
    t23 = (t22 - 7);
    t24 = (t23 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t20));
    t25 = (1U * t24);
    t26 = (0 + t25);
    t27 = (t21 + t26);
    t28 = *((unsigned char *)t27);
    t31 = ((IEEE_P_2592010699) + 4024);
    t29 = xsi_base_array_concat(t29, t30, t31, (char)97, t17, t18, (char)99, t28, (char)101);
    t32 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t29, t30);
    t33 = (t32 - 3);
    t34 = (t33 * -1);
    xsi_vhdl_check_range_of_index(3, 0, -1, t32);
    t35 = (1U * t34);
    t36 = (0 + t35);
    t37 = (t6 + t36);
    t38 = *((unsigned char *)t37);
    t39 = (t0 + 4948);
    t40 = *((int *)t39);
    t41 = (t40 - 7);
    t42 = (t41 * -1);
    t43 = (1 * t42);
    t44 = (0U + t43);
    t45 = (t0 + 3072);
    t46 = (t45 + 56U);
    t47 = *((char **)t46);
    t48 = (t47 + 56U);
    t49 = *((char **)t48);
    *((unsigned char *)t49) = t38;
    xsi_driver_first_trans_delta(t45, t44, 1, 0LL);

LAB4:    t1 = (t0 + 4948);
    t3 = *((int *)t1);
    t2 = (t0 + 4952);
    t4 = *((int *)t2);
    if (t3 == t4)
        goto LAB5;

LAB6:    t10 = (t3 + 1);
    t3 = t10;
    t5 = (t0 + 4948);
    *((int *)t5) = t3;
    goto LAB2;

}


extern void work_a_0756711975_3990940387_init()
{
	static char *pe[] = {(void *)work_a_0756711975_3990940387_p_0};
	xsi_register_didat("work_a_0756711975_3990940387", "isim/testbench_isim_beh.exe.sim/work/a_0756711975_3990940387.didat");
	xsi_register_executes(pe);
}
