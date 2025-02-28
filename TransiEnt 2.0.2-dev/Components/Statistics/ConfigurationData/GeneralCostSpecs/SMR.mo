﻿within TransiEnt.Components.Statistics.ConfigurationData.GeneralCostSpecs;
model SMR "Cost model for a steam methane reformer"



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





  extends PartialCostSpecs(
    size1=1e6 "H_flow_n_H2: Nominal hydrogen enthalpy flow rate",
    C_inv_size=(3.127*exp(-9.883e-7*size1)+0.6645*exp(-1.387e-7*size1)+0.1089)*size1 "curve fitting of curve from figure 5.13 from Krieg 2012: Konzept und Kosten eines Pipelinesystems zur Versorgung des deutschen Straenverkehrs mit Wasserstoff (values for high enthalpy flow rates are a bit too high)",
    factor_OM=0.05 "5%, Krieg 2012: Konzept und Kosten eines Pipelinesystems zur Versorgung des deutschen Straenverkehrs mit Wasserstoff",
    lifeTime=15 "Wietschel 2010 Vergleich von Strom und Wasserstoff als CO2-freie Endenergietrger: Endbericht");
  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Cost model for a steam methane reformer</p>
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
<p>[1] D. Krieg, &quot;Konzept und Kosten eines Pipelinesystems zur Versorgung des deutschen Straenverkehrs mit Wasserstoff&quot;,2012</p>
<p>[2] M. Wietschel, U. Buenger, &quot;Vergleich von Strom und Wasserstoff als CO2-freie Endenergietrger: Endbericht&quot;,2010 </p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
</html>"));
end SMR;
