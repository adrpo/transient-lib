﻿within TransiEnt.Components.Electrical.Grid;
model PiModelQS "PiModell using quasistationary interfaces"




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

  extends TransiEnt.Basics.Icons.Model;

  // _____________________________________________
  //
  //             Parameters
  // _____________________________________________

  parameter SI.Length l=100;

//   parameter Characteristics.PiModelParams                                 param=
//      Characteristics.PiModelParams() "Parameter for PI model" annotation (
//       choicesAllMatching=true, Placement(transformation(extent={{-96,80},{-76,100}})));
  parameter Electrical.Grid.Characteristics.LVCabletypes CableType=Electrical.Grid.Characteristics.LVCabletypes.K1 "type of low voltage cable"
                                annotation (
    Evaluate=true,
    HideResult=true,
    Dialog(group="cable properties"));

protected
  parameter TransiEnt.Basics.Units.SpecificResistance r=CableData[1];
  parameter TransiEnt.Basics.Units.SpecificReactance x=CableData[2];
  parameter TransiEnt.Basics.Units.SpecificCapacitance c=CableData[3];
  parameter Real CableData[4]=Base.getLVCableData(CableType) "saves the cabledata of the selected cable";
  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________
public
  Modelica.Electrical.QuasiStatic.SinglePhase.Basic.Resistor Resistor(R_ref=l*r) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-46,0})));
  Modelica.Electrical.QuasiStatic.SinglePhase.Basic.VariableInductor Inductor annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={48,0})));
  Modelica.Electrical.QuasiStatic.SinglePhase.Basic.Capacitor Capacitor1(C=0.5*l*c) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-56,-28})));
  Modelica.Electrical.QuasiStatic.SinglePhase.Basic.Capacitor Capacitor2(C=0.5*l*c) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={74,-28})));
  Modelica.Electrical.QuasiStatic.SinglePhase.Interfaces.PositivePin pin_p2 "end of line" annotation (Placement(transformation(rotation=0, extent={{92,-10},{112,10}})));
  Modelica.Electrical.QuasiStatic.SinglePhase.Interfaces.PositivePin pin_p1 "beginning of line" annotation (Placement(transformation(rotation=0, extent={{-110,-10},{-90,10}})));

  Modelica.Electrical.QuasiStatic.SinglePhase.Sensors.FrequencySensor frequencySensor annotation (Placement(transformation(extent={{-56,50},{-36,70}})));
  Modelica.Blocks.Math.Gain omega(k=2*Modelica.Constants.pi)
    annotation (Placement(transformation(extent={{-24,50},{-4,70}})));
  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{20,16},{40,36}})));
  Modelica.Blocks.Sources.Constant X(k=l*x)
    annotation (Placement(transformation(extent={{-46,22},{-26,42}})));
  Modelica.Electrical.QuasiStatic.SinglePhase.Basic.Ground ground annotation (Placement(transformation(extent={{-12,-100},{8,-80}})));
equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________
  connect(Resistor.pin_n,Inductor. pin_p)
    annotation (Line(points={{-36,0},{-36,0},{38,0}},color={85,170,255}));
  connect(Capacitor1.pin_p,Resistor. pin_p)
    annotation (Line(points={{-56,-18},{-56,-18},{-56,0}},
                                                         color={85,170,255}));
  connect(Capacitor1.pin_n,Capacitor2. pin_n)
    annotation (Line(points={{-56,-38},{-56,-38},{74,-38}},
                                                          color={85,170,255}));
  connect(pin_p2, Capacitor2.pin_p)
    annotation (Line(points={{102,0},{74,0},{74,-18}},   color={85,170,255}));
  connect(pin_p2, Inductor.pin_n) annotation (Line(points={{102,0},{74,0},{58,0}},
                      color={85,170,255}));
  connect(pin_p1, Resistor.pin_p) annotation (Line(points={{-100,0},{-64,0},{-56,0}},
                       color={85,170,255}));
  connect(frequencySensor.pin, pin_p1) annotation (Line(points={{-56,60},{-56,0},{-100,0}},
                      color={85,170,255}));
  connect(frequencySensor.f, omega.u)
    annotation (Line(points={{-35,60},{-26,60}}, color={0,0,127}));
  connect(division.y, Inductor.L)
    annotation (Line(points={{41,26},{48,26},{48,10.8}},color={0,0,127}));
  connect(X.y, division.u1)
    annotation (Line(points={{-25,32},{18,32}},           color={0,0,127}));
  connect(Capacitor1.pin_n, ground.pin) annotation (Line(points={{-56,-38},{-2,
          -38},{-2,-80}},     color={85,170,255}));
  connect(omega.y, division.u2)
    annotation (Line(points={{-3,60},{6,60},{6,20},{18,20}}, color={0,0,127}));
  annotation (Diagram(graphics,
                      coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
                                Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Transmission line Pi-Modell using parameters of PiModelParams</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(Purely technical component without physical modeling.)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(Purely technical component without physical modeling.)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p>Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin pin_p2 <span style=\"color: #006400;\">&quot;end of line&quot;</span></p>
<p>Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin pin_p1 <span style=\"color: #006400;\">&quot;beginning of line&quot;</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no elements)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no equations)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p>Tested in check model &quot;TransiEnt.Components.Electrical.Grid.Check.TestPiModelQS&quot;</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Rebekka Denninger (rebekka.denninger@tuhh.de) in February 2016</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model modified (dimensions) by Jan-Peter Heckel (jan.heckel@tuhh.de) in March 2018</span></p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={                                                                                                    Rectangle(extent={{22,8},{72,-6}},    lineColor = {0,0,0}, fillColor = {0,0,0},
            fillPattern =                                                                                                   FillPattern.Solid),
                                                                                                Line(points={{-98,0},{102,0}},    color = {0,0,0}, smooth = Smooth.None),Rectangle(extent={{-64,8},{-14,-6}},  lineColor={0,0,0},   fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
        Line(points={{-72,0},{-72,-24}}, color={0,0,0}),
        Line(points={{-82,-24},{-62,-24}}, color={0,0,0}),
        Line(points={{-82,-28},{-62,-28}}, color={0,0,0}),
        Line(points={{-72,-28},{-72,-48}}, color={0,0,0}),
        Line(points={{82,-28},{82,-48}}, color={0,0,0}),
        Line(points={{72,-28},{92,-28}}, color={0,0,0}),
        Line(points={{72,-24},{92,-24}}, color={0,0,0}),
        Line(points={{82,0},{82,-24}}, color={0,0,0})}));
end PiModelQS;
