﻿within TransiEnt.Producer.Electrical.Others;
model IdealContinuousBiomassPlant "Ideal transient behaviour, no states, no heat offer, no controller basically just the icon.."




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
  extends Base.IdealInverterPlant(
    final typeOfResource=TransiEnt.Basics.Types.TypeOfResource.Renewable,
    final typeOfPrimaryEnergyCarrier=TransiEnt.Basics.Types.TypeOfPrimaryEnergyCarrier.Biomass,
    redeclare model ProducerCosts = TransiEnt.Components.Statistics.ConfigurationData.PowerProducerCostSpecs.Biomass);

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-40,-72},{58,-64}},
          lineColor={149,99,49},
          fillColor={149,99,49},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-28,-64},{58,-56}},
          lineColor={149,99,49},
          fillColor={149,99,49},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-10,-56},{58,-48}},
          lineColor={149,99,49},
          fillColor={149,99,49},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-4,-48},{58,-40}},
          lineColor={149,99,49},
          fillColor={149,99,49},
          fillPattern=FillPattern.HorizontalCylinder),
        Ellipse(
          extent={{-8,-40},{-2,-48}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={240,160,79}),
        Ellipse(
          extent={{-14,-48},{-8,-56}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={240,160,79}),
        Ellipse(
          extent={{-30,-56},{-24,-64}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={240,160,79}),
        Ellipse(
          extent={{-42,-64},{-36,-72}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={240,160,79})}),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p>Biomass plant with ideal transient behaviour, no states, no heat offer, no controller basically just the icon.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">L1E Models are based on characteristic lines, gains or efficiencies</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Generation as steady-state boundary</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">use it for small power plants and inverter-based power plants to model adequately</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">P_el_set: input for electric power in [W] (setpoint for electric power)</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">epp: electric power port</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Testend in check model &quot;TransiEnt.Producer.Electrical.Others.Check.TestIdealContinuousBiomassPlant&quot;</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Pascal Dubucq (dubucq@tuhh.de) on 01.10.2014</span></p>
</html>"));
end IdealContinuousBiomassPlant;
