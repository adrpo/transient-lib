﻿within TransiEnt.Basics.Tables.Ambient;
model Temperature_Hamburg_900s_2012 "Hamburg 2012, 15 min resolution"



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

extends GenericDataTable(
relativepath="/ambient/Temperature_Hamburg-Billwerder_900s_01012012_31122012.txt",
datasource=DataPrivacy.isPublic);
extends TransiEnt.Components.Boundaries.Ambient.Base.PartialTemperature;

  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

equation
 connect(y1, value);
 connect(y[1], value);
  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Ambient temperature in Hamburg in the year 2012 with 15 minutes time resolution.</p>
<p>This profile was created by creating 15 minute averages from the 1 minute values provided by [1]. Missing values were substituted by interpolated values between the values at the extremes of the missing intervals.</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Description)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Description)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>Modelica RealOutput: y[MSL_combiTimeTable.nout]</p>
<p>Modelica RealOutput: y1</p>
<p>Modelica RealOutput: temperature in degree Celsius</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(none)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>[1] Lange, Ingo. KlimaCampus - Wettermast Hamburg. Universität Hamburg - Meteorologisches Institut http://wettermast-hamburg.zmaw.de</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Ricardo Peniche (peniche@tuhh.de), Mar 2014</p>
<p><br><img src=\"modelica://TransiEnt/Images/TemperatureHH_900s_2012.png\"/></p>
</html>"));
end Temperature_Hamburg_900s_2012;
