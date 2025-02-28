﻿within TransiEnt.Consumer.Systems.PVBatteryPoolControl.Base.Check;
model CheckLimitConditioning



//________________________________________________________________________________//
// Component of the TransiEnt Library, version: 2.0.2                             //
//                                                                                //
// Licensed by Hamburg University of Technology under the 3-BSD-clause.           //
// Copyright 2021, Hamburg University of Technology.                              //
//________________________________________________________________________________//
//                                                                                //
// TransiEnt.EE, ResiliEntEE, IntegraNet and IntegraNet II are research projects  //
// supported by the German Federal Ministry of Economics and Energy               //
// (FKZ 03ET4003, 03ET4048, 0324027 and 03EI1008).                                //
// The TransiEnt Library research team consists of the following project partners://
// Institute of Engineering Thermodynamics (Hamburg University of Technology),    //
// Institute of Energy Systems (Hamburg University of Technology),                //
// Institute of Electrical Power and Energy Technology                            //
// (Hamburg University of Technology)                                             //
// Fraunhofer Institute for Environmental, Safety, and Energy Technology UMSICHT, //
// Gas- und Wärme-Institut Essen						  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//





extends TransiEnt.Basics.Icons.Checkmodel;

inner PoolParameter param(P_el_PV_peak=2e3) annotation (Placement(transformation(extent={{-78,38},{-46,70}})));

  LimitConditioning P_set_limit annotation (Placement(transformation(extent={{-4,-1},{20,23}})));
  Modelica.Blocks.Continuous.Integrator SOC(
  initType=Modelica.Blocks.Types.Init.InitialOutput,
  k=1/param.E_max_bat,
  y_start=param.SOC_start)                  annotation (Placement(transformation(extent={{18,-46},{-2,-26}})));
  Modelica.Blocks.Sources.Cosine P_PV(
    amplitude=0.5*param.P_el_PV_peak*0.8,
    offset=0.5*param.P_el_PV_peak*0.8,
    f=1/86400,
    phase=3.1415926535898) annotation (Placement(transformation(extent={{-96,2},{-76,22}})));
  Modelica.Blocks.Sources.Constant P_load(k=1e3)
                                          annotation (Placement(transformation(extent={{-98,-30},{-78,-10}})));
  Modelica.Blocks.Math.Feedback P_set_ideal "Ideal battery setpoint"  annotation (Placement(transformation(extent={{-68,2},{-48,22}})));
  Modelica.Blocks.Nonlinear.Limiter P_set_base(uMax=param.P_el_max_bat, uMin=-param.P_el_max_bat) annotation (Placement(transformation(extent={{-42,2},{-22,22}})));
equation

  connect(P_PV.y, P_set_ideal.u1) annotation (Line(points={{-75,12},{-70.5,12},{-66,12}}, color={0,0,127}));
  connect(P_load.y, P_set_ideal.u2) annotation (Line(points={{-77,-20},{-58,-20},{-58,4}}, color={0,0,127}));
  connect(P_set_ideal.y, P_set_base.u) annotation (Line(points={{-49,12},{-46.5,12},{-44,12}}, color={0,0,127}));
  connect(P_set_limit.P_set_base, P_set_base.y) annotation (Line(points={{-4.72,11.96},{-21,11.96},{-21,12}}, color={0,0,127}));
  connect(P_set_limit.P_set_limit, SOC.u) annotation (Line(points={{21.2,11},{30,11},{30,-36},{20,-36}}, color={0,0,127}));
  connect(SOC.y, P_set_limit.SOC) annotation (Line(points={{-3,-36},{-6,-36},{-6,-34},{-6,-36},{-12,-36},{-12,6.2},{-4.72,6.2}}, color={0,0,127}));
public
function plotResult

  constant String resultFileName = "CheckLimitConditioning.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();

  createPlot(id=1, position={0, 0, 1616, 851}, y={"P_PV.y", "P_load.y"}, range={0.0, 90000.0, -500.0, 2000.0}, grid=true, colors={{28,108,200}, {238,46,47}},filename=resultFile);
  createPlot(id=1, position={0, 0, 1616, 209}, y={"P_set_base.y"}, range={0.0, 90000.0, -1500.0, 1000.0}, grid=true, subPlot=2, colors={{28,108,200}},filename=resultFile);
  createPlot(id=1, position={0, 0, 1616, 209}, y={"SOC.y"}, range={0.0, 90000.0, 0.0, 1.0}, grid=true, subPlot=3, colors={{28,108,200}},filename=resultFile);
  createPlot(id=1, position={0, 0, 1616, 209}, y={"P_set_limit.isConditioningOK.y"}, range={0.0, 90000.0, -0.5, 1.5}, grid=true, subPlot=4, colors={{28,108,200}},filename=resultFile);

  resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
annotation (Diagram(graphics,
                    coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
                                       Icon(graphics,
                                            coordinateSystem(extent={{-100,-100},{100,100}})),
  experiment(
    StopTime=86400,
    Interval=900,
    __Dymola_Algorithm="Lsodar"),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for LimitConditioning. See this model for further information: TransiEnt.Consumer.DemandSideManagement.PVBatteryPoolControl.Base.LimitConditioning</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">4.Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
</html>"));
end CheckLimitConditioning;
