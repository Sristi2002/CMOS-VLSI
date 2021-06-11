tesstbench ffor inverter sub circuuuuuit
.GLOBAL vdd gnd
.PARAM vsupply=5.0
**Library       model file
.LIB "/project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib" nom
**Include the invertor netlist
.INCLUDE Lab12_inv.sp
**instantiate invertttttttor
Xinv1  in out Lab12_inv
**Surces
Vsup vdd 0  DC vsupply
Vin  in  0  PULSE(0 vsupply  5n  10p 10p 20n)
Cload out 0 50f
*Analyse
.TRAN 10p 20n SWEEP PARAM vsupply 1 2 1
.MEASURE TRAN TPLH TRIG v(in) val='0.5*vsupply' FALL=1 TARG v(out) VAL='0.5*vsupply'  RISE=1
.MEASURE TRAN TPHL TRIG v(in) val='0.5*vsupply' RISE=1 TARG v(out) VAL='0.5*vsupply'  FALL=1

.CONTROL
RUN
PLOT v(in)  v(out)
.ENDC
.END
