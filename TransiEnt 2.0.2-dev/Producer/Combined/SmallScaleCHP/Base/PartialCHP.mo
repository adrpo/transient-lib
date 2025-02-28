﻿within TransiEnt.Producer.Combined.SmallScaleCHP.Base;
partial model PartialCHP "Model consisting of replaceable engine and generator and control interface"




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
  extends TransiEnt.Basics.Icons.CHP;
  outer TransiEnt.SimCenter simCenter;
  outer TransiEnt.ModelStatistics modelStatistics;

  // _____________________________________________
  //
  //          Constants and Parameters
  // _____________________________________________

  //Media models
  parameter TILMedia.VLEFluidTypes.BaseVLEFluid WaterMedium=simCenter.fluid1 "Medium in coolant and heating grid cycles" annotation (Dialog(tab="General", group="Fundamental"), choices(choicesAllMatching));
  parameter TILMedia.GasTypes.BaseGas FuelMedium=simCenter.gasModel2 "Fuel medium" annotation (Dialog(tab="General", group="Fundamental"), choices(choicesAllMatching));
  parameter TILMedia.GasTypes.BaseGas ExhaustMedium=simCenter.exhaustGasModel "Exhaust medium" annotation (Dialog(tab="General", group="Fundamental"), choices(choicesAllMatching));

  //Specification

  replaceable TransiEnt.Producer.Combined.SmallScaleCHP.Specifications.Dachs_HKA_G_5_5kW Specification constrainedby TransiEnt.Producer.Combined.SmallScaleCHP.Base.BaseCHPSpecification "Record containing technical data of CHP" annotation (Dialog(tab="General", group="Specification"), choicesAllMatching=true);

  replaceable TransiEnt.Basics.Interfaces.Electrical.ActivePowerPort epp constrainedby TransiEnt.Basics.Interfaces.Electrical.PartialPowerPort "Choice of power port" annotation (
    Dialog(tab="General", group="Replaceable Components"),
    choicesAllMatching=true,
    Placement(transformation(extent={{87,-19},{113,7}}), iconTransformation(extent={{90,-50},{110,-30}})));

  replaceable TransiEnt.Components.Electrical.Machines.ActivePowerGenerator generator constrainedby TransiEnt.Components.Electrical.Machines.Base.PartialActivePowerGenerator "Choice of generator model. The generator model must match the power port." annotation (
    Dialog(tab="General", group="Replaceable Components"),
    choicesAllMatching=true,
    Placement(transformation(extent={{50,-18},{76,7}})));
  replaceable TransiEnt.Components.Electrical.Machines.ExcitationSystemsVoltageController.DummyExcitationSystem Exciter constrainedby TransiEnt.Components.Electrical.Machines.ExcitationSystemsVoltageController.PartialExcitationSystem "Choice of excitation system model with voltage control" annotation (
    Dialog(tab="General", group="Replaceable Components"),
    choicesAllMatching=true,
    Placement(transformation(
        extent={{-10,-10.5},{10,10.5}},
        rotation=-90,
        origin={62.5,30})));

  replaceable model Motorblock = TransiEnt.Components.Gas.Engines.Engine_idealGas constrainedby TransiEnt.Components.Gas.Engines.Base.PartialEngine_idealGas "Engine model containing mechanic, thermal, and combustion model" annotation (Dialog(tab="General", group="Replaceable Components"), choicesAllMatching=true);
  //replaceable function EfficiencyFunction = TransiEnt.Basics.Functions.efficiency_linear constrainedby TransiEnt.Basics.Functions.efficiency_base "Efficiency function" annotation (Dialog(tab="General", group="Fundamental"), choices(choicesAllMatching=true));

  parameter SI.Temperature T_site=290 "Average ambient temperature at plant site" annotation (Dialog(tab="General", group="Specification"));
  parameter SI.PressureDifference Delta_p_nom=1e5 "Nominal pressure drop in heat flow model" annotation (Dialog(tab="General", group="Specification"));
  parameter SI.MassFlowRate m_flow_nom=motorblock.heatFlowModel.simCenter.m_flow_nom "Nominal mass flow rate in heat flow model" annotation (Dialog(tab="General", group="Specification"));

  //Combustion
  parameter SI.SpecificEnthalpy NCV_const=40e6 "Constant value for net calorific value (set to 0 for medium dependent NCV calculation)" annotation (Dialog(tab="General", group="Combustion"));
  parameter Real lambda=Specification.lambda "Constant combustion air ratio" annotation (Dialog(tab="General", group="Combustion"));

  //Statistics
  final parameter TransiEnt.Basics.Types.TypeOfResource TypeOfResource=TransiEnt.Basics.Types.TypeOfResource.Cogeneration "Type of resource" annotation (Dialog(tab="General", group="Statistics"));
  parameter TransiEnt.Basics.Types.TypeOfPrimaryEnergyCarrier TypeOfEnergyCarrierElectricity=TransiEnt.Basics.Types.TypeOfPrimaryEnergyCarrier.NaturalGas "Type of energy carrier" annotation (Dialog(tab="General", group="Statistics"));
  parameter TransiEnt.Basics.Types.TypeOfPrimaryEnergyCarrierHeat TypeOfEnergyCarrierHeat=TransiEnt.Basics.Types.TypeOfPrimaryEnergyCarrierHeat.NaturalGas "Type of energy carrier" annotation (Dialog(tab="General", group="Statistics"));
  replaceable function AllocationMethod = TransiEnt.Components.Statistics.Functions.CO2Allocation.AllocationMethod_Efficiencies constrainedby TransiEnt.Components.Statistics.Functions.CO2Allocation.Basics.BasicAllocationMethod "Allocation method for CO2 emissions" annotation (Dialog(tab="General", group="Statistics"), choicesAllMatching=true);
  replaceable model CostRecordCHP = TransiEnt.Components.Statistics.ConfigurationData.GeneralCostSpecs.CHP_532kW constrainedby TransiEnt.Components.Statistics.ConfigurationData.GeneralCostSpecs.PartialCostSpecs "Cost specification" annotation (Dialog(tab="General", group="Statistics"), choicesAllMatching=true);
  parameter TransiEnt.Basics.Units.MonetaryUnitPerEnergy Cspec_demAndRev_gas_fuel=simCenter.Cfue_GasBoiler "Specific demand-related cost per gas energy" annotation (Dialog(tab="General", group="Statistics"));

  //Initialization
  parameter Modelica.Units.SI.Temperature T_init=293.15 "Initial temperature of medium in heat exchangers" annotation (Dialog(tab="Initialization"));
  parameter Modelica.Units.SI.Pressure p_init=6e5 "Initial pressure of medium in heat exchangers" annotation (Dialog(tab="Initialization"));

//parameter TransiEnt.Producer.Combined.SmallScaleCHP.Base.PartloadEfficiency.PartloadEfficiencyCharacteristic EfficiencyCharLine=TransiEnt.Producer.Combined.SmallScaleCHP.Base.PartloadEfficiency.ConstantEfficiency() "choose characteristic efficiency line" annotation(Dialog(tab="General", group="Specification"), choicesAllMatching=true);

  // _____________________________________________
  //
  //                    Variables
  // _____________________________________________
protected
  Modelica.Units.SI.Frequency f=epp.f "Actual grid frequency";

public
  SI.Efficiency eta_el=motorblock.mechanicModel.eta_el "Electric efficiency";
  SI.Efficiency eta_th=motorblock.mechanicModel.eta_h - motorblock.mechanicModel.eta_el "Thermal efficiency";

  SI.Power P_el_out=epp.P "Total generated electric power";
  SI.Power P_el_set_intern=-P_el_set_intern "Set electric power";
  SI.HeatFlowRate Q_flow_out "Total generated thermal power";
  SI.HeatFlowRate Q_flow_fuel=motorblock.Q_flow_fuel "Consumed fuel thermal power (NCV)";
  SI.HeatFlowRate Q_flow_loss=motorblock.heatFlowModel.Q_flow_loss "Total loss heat flow (radiant and exhaust)";
  SI.MassFlowRate m_flow_fuel=gasPortIn.m_flow "Fuel mass flow rate";
  SI.MassFlowRate m_flow_CDE=gasPortOut.xi_outflow[2]*gasPortOut.m_flow "CDE mass flow rate";

  TransiEnt.Basics.Units.MassOfCDEperEnergy[2] m_CDE "Mass of CO2 equivalents per J fuel input [electrical, thermal]";
  TransiEnt.Basics.Units.MassOfCDEperEnergy m_spec_CDE "Total mass of CO2 equivalents per J fuel input";

  SI.Temperature T_supply_intern=supplyTemperatureSensor.T "Supply temperature";
  SI.Temperature T_return_intern=returnTemperatureSensor.T "Supply temperature";

  // _____________________________________________
  //
  //                Interfaces
  // _____________________________________________
  //For controlBus
protected
  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerIn P_el_set "Set electric power" annotation (Placement(transformation(extent={{-84,17},{-64,37}})));
  TransiEnt.Basics.Interfaces.General.TemperatureOut T_return "Return temperature" annotation (Placement(transformation(extent={{-64,-58},{-84,-38}})));
  TransiEnt.Basics.Interfaces.General.TemperatureOut T_supply "Supply temperature" annotation (Placement(transformation(extent={{-64,-43},{-84,-23}})));
  Modelica.Blocks.Interfaces.BooleanInput switch annotation (Placement(transformation(extent={{-84,-5},{-64,16}})));
  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerIn P_el_pump_set annotation (Placement(transformation(extent={{-84,-74},{-64,-54}})));

public
  TransiEnt.Producer.Combined.SmallScaleCHP.Base.ControlBus controlBus annotation (Placement(transformation(extent={{-110,-10},{-90,10}}), iconTransformation(extent={{-112,8},{-88,32}})));

  TransiEnt.Basics.Interfaces.Gas.IdealGasEnthPortIn gasPortIn(Medium=FuelMedium) annotation (Placement(transformation(extent={{-109,36},{-91,53}}), iconTransformation(extent={{-111,33},{-91,53}})));
  TransiEnt.Basics.Interfaces.Gas.IdealGasEnthPortOut gasPortOut(Medium=ExhaustMedium) annotation (Placement(transformation(extent={{-109,75},{-91,93}}), iconTransformation(extent={{-110,70},{-90,90}})));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut waterPortOut(Medium=WaterMedium) annotation (Placement(transformation(extent={{90,-60},{110,-40}}), iconTransformation(extent={{90,85},{110,105}})));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn waterPortIn(Medium=WaterMedium) annotation (Placement(transformation(extent={{90,-100},{110,-80}}), iconTransformation(extent={{90,59},{110,79}})));

  // Model Statistics
  TransiEnt.Components.Statistics.Collectors.LocalCollectors.CollectGwpEmissionsElectric collectGwpEmissionsElectrical(typeOfEnergyCarrier=TypeOfEnergyCarrierElectricity) annotation (Placement(transformation(extent={{-60,-100},{-40,-80}})));
  TransiEnt.Components.Statistics.Collectors.LocalCollectors.CollectGwpEmissionsHeat collectGwpEmissionsHeat(typeOfEnergyCarrierHeat=TypeOfEnergyCarrierHeat) annotation (Placement(transformation(extent={{-40,-100},{-20,-80}})));
  TransiEnt.Components.Statistics.Collectors.LocalCollectors.CollectElectricPower collectElectricPower(typeOfResource=TypeOfResource) annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  TransiEnt.Components.Statistics.Collectors.LocalCollectors.CollectHeatingPower collectHeatingPower(typeOfResource=TypeOfResource) annotation (Placement(transformation(extent={{-80,-100},{-60,-80}})));
  TransiEnt.Components.Statistics.Collectors.LocalCollectors.CollectCostsGeneral collectCosts(
    redeclare model CostRecordGeneral = CostRecordCHP,
    der_E_n=Specification.P_el_max,
    P_el=P_el_out,
    Q_flow=Q_flow_out,
    H_flow=Q_flow_fuel,
    m_flow_CDE=-m_flow_CDE,
    E_n=0,
    Cspec_demAndRev_gas_fuel=Cspec_demAndRev_gas_fuel,
    consumes_P_el=false,
    consumes_Q_flow=false,
    produces_H_flow=false,
    produces_other_flow=false,
    consumes_other_flow=false,
    consumes_m_flow_CDE=false) annotation (Placement(transformation(extent={{-20,-100},{0,-80}})));

  // _____________________________________________
  //
  //          Instances of other Classes
  // _____________________________________________
  Motorblock motorblock(
    final Specification=Specification,
    final T_site=T_site,
    final NCV_const=NCV_const,
    final lambda=lambda,
    Delta_p_nom=Delta_p_nom,
    m_flow_nom=m_flow_nom,
    T_init=T_init,
    p_init=p_init)                         annotation (Placement(transformation(extent={{-46,-16},{38,70}})));

protected
  ClaRa.Components.Sensors.SensorVLE_L1_T returnTemperatureSensor(medium=WaterMedium) annotation (Placement(transformation(extent={{-6,-55},{-21,-40}})));
  ClaRa.Components.Sensors.SensorVLE_L1_T supplyTemperatureSensor(medium=WaterMedium) annotation (Placement(transformation(extent={{29,-40},{15,-26}})));

equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  Q_flow_out = waterPortOut.m_flow*(actualStream(waterPortOut.h_outflow) - actualStream(waterPortIn.h_outflow));

  // Statistics
  // Allocation of CO2-Emissions
  m_spec_CDE = m_flow_CDE/(max((gasPortIn.m_flow), 0.0000001)*motorblock.NCV)*1e6;
  m_CDE = AllocationMethod(
    m_flow_spec=m_spec_CDE,
    eta_el=eta_el,
    eta_th=eta_th);

  //write CDE emissions to collectors
  collectGwpEmissionsElectrical.gwpCollector.m_flow_cde = m_CDE[1]*gasPortIn.m_flow*motorblock.NCV/1e6;
  collectGwpEmissionsHeat.gwpCollector.m_flow_cde = m_CDE[2]*gasPortIn.m_flow*motorblock.NCV/1e6;

  //write energy flow rates
  collectHeatingPower.heatFlowCollector.Q_flow = Q_flow_out;
  collectElectricPower.powerCollector.P = P_el_out;

  // _____________________________________________
  //
  //                Control
  // ____________________________________________

  controlBus.P_el_set = P_el_set;
  controlBus.T_return = T_return;
  controlBus.T_supply = T_supply;
  controlBus.switch = switch;
  controlBus.P_el_meas = P_el_out;
  controlBus.Q_flow_meas = Q_flow_out;
  controlBus.P_el_pump_set = P_el_pump_set;
  controlBus.f_grid = epp.f;

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  // Model statistics
  connect(modelStatistics.heatFlowCollector[TypeOfResource], collectHeatingPower.heatFlowCollector);
  connect(modelStatistics.powerCollector[TypeOfResource], collectElectricPower.powerCollector);
  connect(modelStatistics.gwpCollector[TypeOfEnergyCarrierElectricity], collectGwpEmissionsElectrical.gwpCollector);
  connect(modelStatistics.gwpCollectorHeat[TypeOfEnergyCarrierHeat], collectGwpEmissionsHeat.gwpCollector);
  connect(modelStatistics.costsCollector, collectCosts.costsCollector);

  // Physical connections
  connect(gasPortOut, gasPortOut) annotation (Line(
      points={{-100,84},{-100,84}},
      color={255,255,0},
      thickness=0.75,
      smooth=Smooth.None));
  connect(P_el_set, motorblock.P_el_set) annotation (Line(points={{-74,27},{-61,27},{-45.16,27}}, color={0,0,127}));
  connect(switch, motorblock.switch) annotation (Line(points={{-74,5.5},{-60,5.5},{-45.16,5.5}}, color={255,0,255}));
  connect(gasPortIn, motorblock.gasPortIn) annotation (Line(
      points={{-100,44.5},{-74,44.5},{-74,44.2},{-46,44.2}},
      color={255,213,170},
      thickness=1.25));
  connect(gasPortOut, motorblock.gasPortOut) annotation (Line(
      points={{-100,84},{-74,84},{-46,84},{-46,65.7}},
      color={255,213,170},
      thickness=1.25));
  connect(motorblock.mpp, generator.mpp) annotation (Line(points={{38,-6.11},{44,-6.11},{44,-5.5},{50,-5.5}}, color={95,95,95}));
  connect(generator.epp, epp) annotation (Line(
      points={{76.13,-5.625},{83.065,-5.625},{83.065,-6},{100,-6}},
      color={0,135,135},
      thickness=0.5));
  connect(supplyTemperatureSensor.T, T_supply) annotation (Line(
      points={{14.3,-33},{-74,-33}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(returnTemperatureSensor.T, T_return) annotation (Line(
      points={{-21.75,-47.5},{-68,-47.5},{-68,-48},{-74,-48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(returnTemperatureSensor.port, waterPortIn) annotation (Line(
      points={{-13.5,-55},{0,-55},{0,-90},{100,-90}},
      color={0,131,169},
      thickness=0.5,
      smooth=Smooth.None));
  connect(supplyTemperatureSensor.port, waterPortOut) annotation (Line(
      points={{22,-40},{34,-40},{34,-50},{100,-50}},
      color={0,131,169},
      thickness=0.5,
      smooth=Smooth.None));
  connect(Exciter.y, generator.E_input) annotation (Line(points={{62.5,19.4},{62.5,17.7},{62.61,17.7},{62.61,6.875}}, color={0,0,127}));
  connect(Exciter.epp1, epp) annotation (Line(
      points={{62.5,40},{62,40},{62,52},{100,52},{100,-6}},
      color={0,135,135},
      thickness=0.5));
  annotation (
    Dialog(group="Characteristics"),
    Diagram(graphics, coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Partial model of a configureable CHP with internal combustion engine.</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p><span style=\"font-family: MS Shell Dlg 2;\">P_el_set - Electric Power setpoint</span></p>
<p>T_return - Heating Water Return temperature </p>
<p>T_supply - Heating Water Supply temperature</p>
<p>switch</p>
<p>P_el_pump_set - Electric Pump Power setpoint</p>
<p>epp - Electric Power Port, type can be chosen</p>
<p>gasPortIn - Fuel Gas Input Port</p>
<p>gasPortOut - Fuel Gas Output Port</p>
<p>waterPortOut - Heating Water Output</p>
<p>waterPortIn - Heating Water Input</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Created by Arne Koeppen (arne.koeppen@tuhh.de), Jun 2013</p>
<p>Revised by Lisa Andresen (andresen@tuhh.de), Aug 2013</p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model generalized for different electrical power ports by Jan-Peter Heckel (jan.heckel@tuhh.de) in July 2018 </span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Edited by Anne Senkel (anne.senkel@tuhh.de), Feb 2019</span></p>
</html>"));
end PartialCHP;
