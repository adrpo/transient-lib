﻿within TransiEnt.Producer.Heat.SolarThermal.Check;
model TestSolarThermal_L0 "Tester for a solar collector using fluid boundaries"




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






  extends Basics.Icons.Checkmodel;
  SolarThermal.SolarThermal_L0 solarThermal annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
  inner SimCenter simCenter(redeclare TransiEnt.Basics.Tables.HeatGrid.HeatingCurves.HeatingCurveEONHanse heatingCurve) annotation (Placement(transformation(extent={{-90,80},{-70,100}})));

  inner ModelStatistics           modelStatistics
     annotation (Placement(transformation(extent={{-70,80},{-50,100}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_hxim_flow massFlowSource(
    m_flow_const=0.1,
    m_flow_nom=0,
    p_nom=1000,
    variable_m_flow=false,
    variable_h=false,
    h_const=400e3) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_phxi massFlowSink(
    m_flow_nom=100,
    p_const=1000000,
    Delta_p=100000,
    variable_p=false,
    h_const=400e3) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={52,0})));
equation
  connect(solarThermal.waterPortOut, massFlowSource.steam_a) annotation (Line(
      points={{-12,0},{-40,0}},
      color={175,0,0},
      smooth=Smooth.None));
  connect(solarThermal.waterPortIn, massFlowSink.steam_a) annotation (Line(
      points={{8,0},{42,0}},
      color={175,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-26,90},{86,70}},
          textColor={28,108,200},
          fontSize=8,
          horizontalAlignment=TextAlignment.Left,
          textString="Look at:
- solarThermal.heatFlowRateOut")}),                                                                           Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for SolarThermal_L0</p>
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
</html>"),
    experiment(
      StopTime=31621500,
      Interval=311040000,
      __Dymola_fixedstepsize=1000,
      __Dymola_Algorithm="Rkfix2"));
end TestSolarThermal_L0;
