﻿within TransiEnt.Components.Statistics.Functions;
function cogenerationEmissionAllocationFactors "Function to calculate CO2 emissions (in kg/J) allocation factors - Inputs: Fuel type, Allocation Method, Heat flow fuel"




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






  //Function Icon
  extends TransiEnt.Basics.Icons.Function;

  // Inputs
  input TransiEnt.Basics.Types.TypeOfCO2AllocationMethod typeOfCO2Allocation;
  input SI.Efficiency eta_el "Electric efficiency";
  input SI.Efficiency eta_th "Themal efficiency";

  //Outputs
  output Real A_fuel_th "Fraction of emissions going to thermal side of balance";
  output Real A_fuel_el "Fraction of emissions going to electric side of balance";

protected
  // Parameters
  parameter SI.Efficiency eta_el_ref=0.525 "Reference efficiency for electric generation (used in PES method of allocation)";
  parameter SI.Efficiency eta_th_ref=0.820 "Reference efficiency for thermal generation (used in PES method of allocation)";

  // Constants
  constant Real smallNumber=1e-4 "Small number to prevent division by zero if plant is off";

  SI.Efficiency eta_total=eta_el+eta_th "Total efficiency";

  Real PES;

algorithm
  if typeOfCO2Allocation==1 then //IEA Method
    A_fuel_th:=eta_th / max(eta_total,smallNumber);
    A_fuel_el:=eta_el / max(eta_total,smallNumber);
  elseif typeOfCO2Allocation==2 then //if Efficiency Method
    A_fuel_th:=eta_el / max(eta_total,smallNumber);
    A_fuel_el:=eta_th / max(eta_total,smallNumber);
  elseif typeOfCO2Allocation==3 then //if PES Method
    PES:=1-1/(eta_th/eta_th_ref + eta_el/eta_el_ref);
    A_fuel_th:=(1-PES)*eta_th/eta_th_ref;
    A_fuel_el:=(1-PES)*eta_el/eta_el_ref;
  end if;

end cogenerationEmissionAllocationFactors;
