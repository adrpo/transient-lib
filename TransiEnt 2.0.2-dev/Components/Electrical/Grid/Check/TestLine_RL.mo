﻿within TransiEnt.Components.Electrical.Grid.Check;
model TestLine_RL "Model for testing Line_RL"



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





  extends TransiEnt.Basics.Icons.Checkmodel;

  Boundaries.Electrical.ApparentPower.ApparentPower Load(
    useInputConnectorP=false,
    useInputConnectorQ=false,
    cosphi_boundary=0.7,
    P_el_set_const=100e3)
    annotation (Placement(transformation(extent={{44,10},{64,-10}})));
  Boundaries.Electrical.ApparentPower.FrequencyVoltage Grid(
    Use_input_connector_f=false,
    f_boundary=50,
    Use_input_connector_v=false,
    v_boundary=400)
    annotation (Placement(transformation(extent={{-36,10},{-56,-10}})));
public
  function plotResult

    constant String resultFileName="TestPiModel.mat";

    output String resultFile;

  algorithm
    clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR)),
      "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
    resultFile := TransiEnt.Basics.Functions.fullPathName(
      Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR)
       + "/" + resultFileName);
    removePlots();

    createPlot(
        id=1,
        position={809,0,791,733},
        y={"Cable.epp_p.P","Cable.epp_n.P"},
        range={0.0,1.0,-120000.0,120000.0},
        grid=true,
        colors={{28,108,200},{238,46,47}},
        filename=resultFileName);
    createPlot(
        id=1,
        position={809,0,791,364},
        y={"Cable.epp_p.f","Cable.epp_n.f"},
        range={0.0,1.0,44.0,56.0},
        grid=true,
        subPlot=2,
        colors={{28,108,200},{238,46,47}},
        filename=resultFileName);

    resultFile := "Successfully plotted results for file: " + resultFile;

  end plotResult;
  Line_RL Cable(simpleModel=false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  inner SimCenter simCenter(v_n=400)
    annotation (Placement(transformation(extent={{-64,68},{-44,88}})));
equation
  connect(Grid.epp, Cable.epp_p) annotation (Line(
      points={{-36,0},{-10,0.2}},
      color={0,127,0},
      thickness=0.5));
  connect(Cable.epp_n, Load.epp) annotation (Line(
      points={{10,0.2},{44,0}},
      color={0,127,0},
      thickness=0.5));
  annotation (
    Icon(graphics, coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for Line_RL using a source with a constant frequency and voltage together with a load</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
</html>"));
end TestLine_RL;
