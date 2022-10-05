* LTSPICE model of LM3900 from National Semiconductor
* Made by Helmut Sennewald, 8/6/2004
* The LM3900 is a so called NORTON amplifier.
*
* Pin order:    in+ in- vcc vss out
.subckt LM3900  in+ in- vcc vss out
Q2 in- in+ vss 0 NPN1
Q3 N001 in- vss 0 NPN1
Q6 out N001 ve 0 PNP1
Q10 vcc ve out 0 NPN1 10
Q9 out N002 vss 0 NPN1 14
C1 N001 vss 6p
Q1 in+ in+ vss 0 NPN1
Q8 vb vb vss 0 NPN1
Q5 N003 N003 vcc 0 PNP1
B1 N003 vb I=limit(0, V(vcc,vss)/10k, 0.2m)
R1 vb N002 2k
Q4 ve N003 vcc 0 PNP1
Q11 vcc N004 in+ 0 NPN1
Q12 vcc N004 in- 0 NPN1
R6 N005 N004 1.6k
E1 N005 vss vb vss 0.5
Q7 vss N001 out 0 PNP1
.model npn1 NPN(Is=1e-14 BF=150 TF=1e-9 Cjc=1e-12 Cje=1e-12  VAF=150 Rb=100 Re=5 Ikf=0.002)
.model pnp1 PNP(Is=1e-14 BF=40 TF=1e-7 Cjc=1e-12 Cje=1e-12 VAF=150 Rb=100 Re=5)
.ends

