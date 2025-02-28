﻿within TransiEnt.Producer.Electrical.Controllers.Base;
partial model PartialPrimaryBalancingController "Base primary balancing power (used for replaceable class option)"




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

  import TransiEnt;
  extends TransiEnt.Basics.Icons.Controller;
  // _____________________________________________
  //
  //                 Outer Models
  // _____________________________________________

  outer TransiEnt.SimCenter simCenter;
  // _____________________________________________
  //
  //                   Parameters
  // _____________________________________________

  parameter SI.Power P_n=simCenter.P_n_low;
   parameter Boolean use_SlewRateLimiter=true "True if Gradient of Primary Balancing Power shall be limited";

  // _____________________________________________
  //
  //               Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.General.FrequencyIn delta_f "Connector of Real input signal" annotation (Placement(transformation(extent={{-130,-20},{-90,20}})));
  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerOut P_PBP_set "Primary balancing setpoint"      annotation (Placement(transformation(extent={{96,-10},{116,10}})));

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  annotation (defaultComponentName="PrimaryBalancingController",
  Diagram(graphics,
          coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
                                   Icon(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-38,26},{38,-30}},
          lineColor={0,0,0},
          textString="Prim")}),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Primary balancing controller modeled according to ENTSO-E requirements with</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">- maximum value (typically 20&percnt; of nominal power plants nominal power)</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">- maximum power gradient (30 seconds time for 20&percnt; of nominal power)</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">- without frequency deadband</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no elements)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no equations)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Pascal Dubucq (dubucq@tuhh.de) on 01.10.2014</span></p>
</html>"));
end PartialPrimaryBalancingController;
