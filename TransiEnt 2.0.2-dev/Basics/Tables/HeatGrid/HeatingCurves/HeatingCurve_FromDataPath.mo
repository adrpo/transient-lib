﻿within TransiEnt.Basics.Tables.HeatGrid.HeatingCurves;
model HeatingCurve_FromDataPath "Variable Heating Curve depending on datapath"



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
  parameter String datapath="heat/HeatingCurve_60_40.txt";
  extends TransiEnt.Basics.Tables.HeatGrid.HeatingCurves.PartialHeatingCurve(final T_supply_const=0, final T_return_const=0);
  TransiEnt.Basics.Tables.GenericCombiTable1Ds heatingCurve(
    relativepath=datapath,
    datasource=datasource,
    columns={2,3});
  extends TransiEnt.Basics.Icons.Model;
  parameter TransiEnt.Basics.Tables.DataPrivacy datasource=TransiEnt.Basics.Tables.DataPrivacy.isPublic;
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  Modelica.Blocks.Interfaces.RealOutput T_Supply annotation (Placement(transformation(extent={{98,26},{118,46}})));
  Modelica.Blocks.Interfaces.RealOutput T_Return annotation (Placement(transformation(extent={{98,-30},{118,-10}})));

equation
  T_supply=heatingCurve.y[1]+273.15;
  T_return=heatingCurve.y[2]+273.15;
  T_supply=T_Supply;
  T_return=T_Return;

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(simCenter.T_amb_var,heatingCurve.u);

  annotation (Icon(graphics={
        Rectangle(
          extent={{-50,60},{0,-60}},
          lineColor={255,255,255},
          fillColor={0,134,134},
          fillPattern=FillPattern.Solid),
        Line(points={{-50,-60},{-50,60},{50,60},{50,-60},{-50,-60},{-50,-30},{
              50,-30},{50,0},{-50,0},{-50,30},{50,30},{50,60},{0,60},{0,-61}},
            color={0,0,0}),
        Line(
          points={{-70,0},{0,0}},
          color={255,0,0},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{0,0},{40,60},{56,60},{68,60}},
          color={255,0,0},
          thickness=0.5,
          smooth=Smooth.Bezier),
        Line(
          points={{-70,-30},{-2,-30},{28,-30},{70,-30}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.Bezier),
        Polygon(
          points={{-70,90},{-78,68},{-62,68},{-70,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-70,68},{-70,-80}}, color={192,192,192}),
        Line(points={{-80,-70},{92,-70}}, color={192,192,192}),
        Polygon(
          points={{100,-70},{78,-62},{78,-78},{100,-70}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{46,74},{66,62}},
          lineColor={255,0,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="SW"),
        Text(
          extent={{54,-14},{74,-26}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="RW")}), Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Target values for T_supply and T_return as function of the T_amb for area heater taken from experimental setup at TUHH.</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Description)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Description)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(none)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(none)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>Source:</p>
<p>Panten, Thilo: Erstellung eines Gebaeude- und Fussbodenwaermeuebertragermodells mit Eignung zur Co-Simulation, Master thesis, p. 70.</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>(no remarks)</p>
</html>"));
end HeatingCurve_FromDataPath;
