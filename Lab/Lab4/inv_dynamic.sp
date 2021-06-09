######## dynamic characterstics of inverter ########
*model file defination
.LIB /project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib nom
.TEMP 27

.GLOBAL vdd gnd
.PARAM wn=0.6u
.PARAM wp=3*wn
*circuit defination
vin   in   gnd   pulse   0   2.5   10n   10p   10p   5n   10n
vsup  vdd  gnd   dc      2.5 
MP1   out  in    vdd     vdd   scmosp   w=wp   l=0.4u   m=1
MN1   out  in    gnd     gnd   scmosn   w=wn   l=0.4u m=1

*fanout gate
MP2 out1 out vdd vdd scmosp w=2.4u l=0.4u  m=1
MN2 out1 out gnd gnd scmosn w=2.4u l=0.4u  m =1

*transient analysis
.TRAN 5p  50n

.CONTROL
RUN
plot v(in)+3  v(out)
.ENDC

*Measure statement
.MEASURE tran tdiff  TRIG v(in) val=1.25 FALL=1 TARG v(out) val=1.25 RISE=1
.MEASURE tran tdiff  TRIG v(in) val=1.25 RISE=1 TARG v(out) val=1.25 FALL=1
.MEASURE tran tdiff  TRIG v(in) val=0.25 RISE=2 TARG v(out) val=2.25 RISE=2
.MEASURE tran tdiff  TRIG v(in) val=2.25 FALL=2 TARG v(out) val=0.25 FALL=2
.END





