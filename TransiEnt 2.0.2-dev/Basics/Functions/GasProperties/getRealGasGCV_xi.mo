﻿within TransiEnt.Basics.Functions.GasProperties;
function getRealGasGCV_xi "Adaptive function for gross calorific value calculation for real gases, input xi"




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

  extends TransiEnt.Basics.Icons.Function;

  // _____________________________________________
  //
  //             Variable Declarations
  // _____________________________________________

public
  input TILMedia.VLEFluidTypes.BaseVLEFluid realGasType "Real gas type" annotation(choicesAllMatching=true);
  input SI.MassFraction[:] xi_in "Mass fractions";
  input SI.SpecificEnthalpy GCVIn "Set this to a specific value for a constant GCV or to zero for GCV calculation";
  output SI.SpecificEnthalpy GCVOut "Returned GCV";

protected
  // _____________________________________________
  //
  //        Constants and Hidden Parameters
  // _____________________________________________
  parameter SI.SpecificEnthalpy[realGasType.nc] GCV_vec=getRealGasGCVVector(realGasType,realGasType.nc);
  SI.MassFraction[realGasType.nc] xi=cat(1,xi_in,{1-sum(xi_in)}) "Mass weighted composition of components per kg fuel";

algorithm
  // _____________________________________________
  //
  //           Characteristic equations
  // _____________________________________________

  //If GCVIn has a value except 0 (no variable GCV calculation) set GCVout = GCVin
  if GCVIn <> 0 then
    GCVOut:=GCVIn;
  else
    //Search for component in GCVComponentValues and add it to total GCV = sum(xi_i * GCV_i)
    GCVOut:=(xi*GCV_vec);
  end if;

  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>This model is used to calculate the gross calorific value (GCV), also known as higher heating value (HHV) of a fuel gas mixture based on the mass fractions and respective mass weighted calorific values from a record.</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>If there are components in the gas which don&apos;t have a corresponding entry in the GCV values record, they will just be ignored, giving a faulty calorific value. The function will throw a warning.</p>
<p>GCVIn was added to give the possibility to define a constant calorific value. If this value is set to 0, the GCV will be calculated by the composition of the defined medium.</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>Tested in check model &quot;TransiEnt.Basics.Functions.GasProperties.Check.TestGCVCalculation&quot;</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Created by Lisa Andresen (andresen@tuhh.de), Sep 2016</p>
</html>"));
end getRealGasGCV_xi;
