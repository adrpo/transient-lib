﻿within TransiEnt.Basics.Media;
model IdealGasNCV_xi_Block "Model for net calorific value calculation for ideal gases, input xi"




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

  extends TransiEnt.Basics.Icons.Block;
  outer TransiEnt.SimCenter simCenter;

  // _____________________________________________
  //
  //               Visible Parameters
  // _____________________________________________

  replaceable parameter TILMedia.GasTypes.BaseGas idealGasType
   constrainedby TILMedia.GasTypes.BaseGas "Ideal gas type" annotation(choicesAllMatching=true);
  parameter SI.SpecificEnthalpy NCVIn=0.0 "Set this to a specific value for a constant NCV or to zero for NCV calculation";
  final parameter SI.SpecificEnthalpy[idealGasType.nc] NCV_vec=Functions.GasProperties.getIdealGasNCVVector(                 idealGasType, idealGasType.nc);

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.General.MassFractionIn xi_in[idealGasType.nc-1] "Mass fraction" annotation (Placement(transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-120,-20},{-80,20}})));
  TransiEnt.Basics.Interfaces.General.SpecificEnthalpyOut NCV "Net calorific value" annotation (Placement(transformation(extent={{100,-10},{120,10}})));

  // _____________________________________________
  //
  //             Variable Declarations
  // _____________________________________________

protected
  SI.MassFraction[idealGasType.nc] xi=cat(1,xi_in,{1-sum(xi_in)}) "Mass weighted composition of components per kg fuel";

equation
  // _____________________________________________
  //
  //           Characteristic equations
  // _____________________________________________

  //If NCVIn has a value except 0 (no variable NCV calculation) set NCV = NCVin
  if NCVIn <> 0.0 then
    NCV= NCVIn;
  else
    //Search for component in NCVComponentValues and add it to total NCV = sum(xi_i * NCV_i) and from (MJ/kg) to (J/kg) NCV
    NCV=(xi*NCV_vec);
  end if;

  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>This model is used to calculate the mass specific net calorific value (NCV), also known as lower heating value (LHV) of a fuel gas mixture based on mass fractions and repective mass weighted calorific values from a record.</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>xi_in is the mass fraction</p>
<p>NCV is the net calorific value</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>If there are components in the gas which don&apos;t have a corresponding entry in the NCV values record, they will just be ignored, giving a faulty calorific value. The function will throw a warning.</p>
<p>NCVIn was added to give the possibility to define a constant calorific value. If this value is set to 0, the NCV will be calculated by the composition of the medium.</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Created by Jan Westphal (j.westphal@tuhh.de), June 2019, based on a model of Lisa Andresen</p>
</html>"), Icon(graphics={Text(
          extent={{-40,50},{44,-48}},
          lineColor={0,0,0},
          textString="Hi")}));
end IdealGasNCV_xi_Block;
