﻿within TransiEnt.Components.Boundaries.Heat.Check;
model Test_Heatflow_L1 "Model for testing Heatflow_L1"




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






  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.Checkmodel;

  // _____________________________________________
  //
  //           Instances of other Classes
  // ____________________________________________

  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_phxi massFlowSink(
    m_flow_nom=100,
    p_const=1000000,
    Delta_p=100000,
    variable_p=false,
    h_const=400e3) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={56,12})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_hxim_flow massFlowSource(
    m_flow_nom=0,
    p_nom=1000,
    variable_m_flow=false,
    variable_h=false,
    h_const=400e3,
    m_flow_const=1)
                   annotation (Placement(transformation(extent={{-58,14},{-38,34}})));
  TransiEnt.Components.Boundaries.Heat.Heatflow_L1 constantHeatflow_L1_1(
    p_drop=0,
    use_Q_flow_in=true,
    change_sign=false) annotation (Placement(transformation(extent={{12,22},{32,42}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=-100e3) annotation (Placement(transformation(extent={{-16,40},{4,60}})));
  ClaRa.Visualisation.StatePoint_phTs statePoint_inlet annotation (Placement(transformation(extent={{-46,46},{-22,74}})));
  ClaRa.Visualisation.StatePoint_phTs statePoint_outlet annotation (Placement(transformation(extent={{74,50},{96,74}})));
equation

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(realExpression.y, constantHeatflow_L1_1.Q_flow_prescribed) annotation (Line(points={{5,50},{10,50},{10,40},{16,40}},     color={0,0,127}));
  connect(statePoint_inlet.port, massFlowSource.steam_a) annotation (Line(
      points={{-46,46},{-34,46},{-34,24},{-38,24}},
      color={0,131,169},
      thickness=0.5));
  connect(statePoint_outlet.port, massFlowSink.steam_a) annotation (Line(
      points={{74,50},{62,50},{62,22},{56,22}},
      color={0,131,169},
      thickness=0.5));
  connect(massFlowSource.steam_a, constantHeatflow_L1_1.fluidPortIn) annotation (Line(
      points={{-38,24},{-30,24},{-30,26},{16,26},{16,22}},
      color={0,131,169},
      thickness=0.5));
  connect(constantHeatflow_L1_1.fluidPortOut, massFlowSink.steam_a) annotation (Line(
      points={{28,22},{56,22},{56,22}},
      color={175,0,0},
      thickness=0.5));
  annotation (Diagram(graphics,
                      coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for Heatflow_L1. This model contains the necessary components and connections for simulating the heatflow model</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
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
end Test_Heatflow_L1;
