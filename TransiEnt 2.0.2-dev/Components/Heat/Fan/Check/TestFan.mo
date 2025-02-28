﻿within TransiEnt.Components.Heat.Fan.Check;
model TestFan



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
  // _____________________________________________

  inner TransiEnt.SimCenter
                        simCenter
    annotation (Placement(transformation(extent={{60,80},{80,100}})));
  TransiEnt.Components.Boundaries.Electrical.ActivePower.Frequency ElectricGrid annotation (Placement(transformation(extent={{22,-62},{42,-42}})));
  Fan_L1                         fan annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Blocks.Sources.Pulse    pulse(
    amplitude=10,
    width=50,
    period=1200,
    nperiod=1,
    offset=0,
    startTime=60)                                  annotation (Placement(transformation(extent={{-80,10},{-60,30}})));
  ClaRa.Components.BoundaryConditions.BoundaryGas_pTxi      boundaryGas_pTxi1(
    medium=simCenter.airModel,
    xi_const=simCenter.airModel.xi_default,
    T_const=573.15) annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  ClaRa.Components.BoundaryConditions.BoundaryGas_pTxi boundaryGas_pTxi(medium=simCenter.airModel, p_const=simCenter.p_amb_start + 13.8e3) annotation (Placement(transformation(extent={{60,-10},{40,10}})));
equation
  connect(fan.epp, ElectricGrid.epp) annotation (Line(
      points={{20,-9.8},{20,-52},{22,-52}},
      color={0,135,135},
      thickness=0.5));
  connect(pulse.y, fan.m_flow_set) annotation (Line(points={{-59,20},{20,20},{20,10.6}}, color={0,0,127}));
  connect(boundaryGas_pTxi1.gas_a, fan.inlet) annotation (Line(
      points={{0,0},{10,0}},
      color={118,106,98},
      thickness=0.5));
  connect(fan.outlet, boundaryGas_pTxi.gas_a) annotation (Line(
      points={{30,0},{40,0}},
      color={118,106,98},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{-100,100},{-10,52}},
          textColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="Check the outlet air temperature, mass flow
and electric power demand")}),
    experiment(
      StopTime=1200,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Check fan model.</p>
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
<p>(none)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Michael von der Heyde (heyde@tuhh.de), Apr 2021</p>
</html>"));
end TestFan;
