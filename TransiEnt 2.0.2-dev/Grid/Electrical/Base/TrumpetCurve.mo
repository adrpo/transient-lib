﻿within TransiEnt.Grid.Electrical.Base;
block TrumpetCurve



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






//source: European Network of Transmission System Operators for Electricity (ENTSO-E). (2015). Appendix 1: Load-Frequency Control and Performance. In Continental Europe Operation Handbook. ENTSO-E.page 21... Retrieved from https://www.entsoe.eu/publications/system-operations-reports/operation-handbook/Pages/default.aspx

  extends Modelica.Blocks.Interfaces.SO;
  extends Basics.Icons.Block;
  parameter Boolean is_loss = true;
  parameter Modelica.Units.SI.Frequency f_0=50;
  parameter Modelica.Units.SI.Frequency delta_f_2=0.8;
  parameter Modelica.Units.SI.Frequency d_margin=20e-3;
  parameter Modelica.Units.SI.Time t_dist=10 "time of disturbance";

  final parameter Real A = 1.2*delta_f_2;
  final parameter Real T = 900 / log(A/d_margin);

equation
  if is_loss then
    y=if time < t_dist then f_0 else f_0 - A * exp(-(time-t_dist)/T);
  else
    y=if time < t_dist then f_0 else f_0 + A * exp(-(time-t_dist)/T);
  end if;
  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>This model generates an output according to the trumpet curve defined by </p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
</html>"));
end TrumpetCurve;
