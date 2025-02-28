﻿within TransiEnt.Consumer.Systems.FridgePoolControl.Check;
model TestPoolResponse



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
Modelica.Blocks.Sources.CombiTimeTable f_grid(
    tableName="default",
    fileName="D:/Uni/TUHH/MASTER/Projektarbeit/04 Simulation/Frequenzverlaeufe/f_Referenzstoerfall.txt",
    tableOnFile=false,
    startTime=0,
    table=[0,50; 7200,50; 7202.2,50; 7204.4,50; 7206.6,50; 7208.8,50; 7210,50; 7210,50; 7211,49.904; 7213.2,49.72; 7215.4,49.57; 7217.6,49.451; 7219.8,49.359; 7222,49.293; 7224.2,49.248; 7226.4,49.224; 7228.6,49.218; 7230.8,49.229; 7233,49.253; 7235.2,49.291; 7237.4,49.339; 7239.6,49.399; 7241.8,49.462; 7244,49.518; 7246.2,49.569; 7248.4,49.614; 7250.6,49.655; 7252.8,49.691; 7255,49.723; 7257.2,49.752; 7259.4,49.778; 7261.6,49.801; 7263.8,49.815; 7266,49.819; 7268.2,49.82; 7270.4,49.82; 7272.6,49.82; 7274.8,49.82; 7277,49.82; 7279.2,49.82; 7281.4,49.82; 7283.6,49.82; 7285.8,49.82; 7288,49.82; 7290.2,49.82; 7292.4,49.82; 7294.6,49.82; 7296.8,49.82; 7299,49.82; 7301.2,49.82; 7303.4,49.82; 7305.6,49.82; 7307.8,49.82; 7310,49.82; 7310,49.82]) annotation (Placement(transformation(extent={{2,40},{22,60}})));
  TransiEnt.Components.Boundaries.Electrical.ActivePower.Frequency electricGrid(useInputConnector=true) annotation (Placement(transformation(extent={{36,-10},{56,10}})));
  Pool.FridgePool fridgePool(
    dbf=0.4,
    poolSize=100,
    uniqueParams=[287.85,278.22,1.4426,278.03,3249,1970.6,0.60693,10.004,1.3412; 301.37,278.88,1.4263,278.98,3031.7,1901.2,0.51744,9.2955,1.6345; 297.64,278.9,1.0176,278.41,2850.7,1720.8,0.48789,10.54,1.4642; 294.35,278.94,1.8308,278.91,2660.9,2273.5,0.44365,9.9565,1.7742; 295.42,278.42,2.0691,277.79,2430.1,1772.8,0.54895,11.756,1.7246; 292.78,279.61,1.7927,279.36,3256.9,1931.8,0.47827,10.586,1.6803; 296.97,278.65,1.7441,278.42,2860.3,1634.8,0.47362,10.589,1.6151; 292.28,278.98,1.7355,279.05,3141.7,1755.3,0.50971,10.383,1.5513; 292.89,278.87,1.9283,279.38,3328.1,1668.1,0.49515,9.8699,1.5182; 293.63,279.81,1.2439,280.29,2477.6,1746.4,0.5058,10.292,1.65; 288.77,279.27,1.4367,278.59,2675.4,1643.5,0.49035,9.5852,1.554; 295.34,278.66,1.8795,278.83,2816.1,2122.5,0.5213,9.277,1.2874; 291.95,279.56,2.346,278.43,2697.3,2103.2,0.52011,10.93,1.4529; 291.66,279.52,1.2668,278.94,2550.6,1836.5,0.54708,11.171,1.5783; 296.09,278.4,1.8227,278.19,2921.5,2261.4,0.56619,10.403,1.4417; 297.45,278.81,
        1.8404,279.14,2756,1533.8,0.49245,9.5806,1.7738; 298.1,279.21,1.7498,279.24,2716.9,1908.8,0.43609,11.732,1.5717; 292.89,279.9,1.6618,280.63,2906.4,1947.3,0.5497,9.6962,1.789; 298.94,279.77,1.593,280.5,2982,2034.9,0.45584,9.7978,1.5431; 293.98,278.84,1.802,279.41,2640.1,1926.9,0.59386,10.771,1.6377; 295.35,279.74,1.7504,279.58,2857.9,1711.6,0.60178,10.866,1.6344; 290.71,278.94,1.8204,278.18,2640.8,1920.9,0.49524,11.197,1.7578; 301.86,278.4,1.4345,277.68,2830.1,2299.2,0.41904,9.9709,1.6319; 301.99,279.45,1.255,279.5,3023.5,1761.6,0.52438,10.924,1.8589; 292.5,279.48,1.3591,279.63,2864.4,1831.9,0.53581,9.1335,1.2222; 297.03,279.03,1.5092,279.58,2748.6,1612.5,0.52884,11.109,1.7682; 287.32,279.68,1.7285,279.43,2398.6,1849.6,0.50661,9.8073,2.0239; 295.28,278.53,1.4248,279.02,2920,2038.9,0.54072,8.394,1.7321; 297.5,278.97,1.6666,278.89,2772,2271.5,0.48336,10.553,1.6857; 294.87,279.73,2.007,280.24,2958,1625.7,0.50017,11.331,1.6548; 294.51,279.21,1.6121,279.75,3177.9,2032.1,0.51965,
        10.874,1.7894; 291.74,279.62,1.8403,279.6,2979.2,1991.7,0.47791,10.706,1.7143; 293.13,279.63,1.6419,279.74,2604.8,1918.1,0.51043,9.5703,1.8368; 293.06,278.02,2.0718,277.49,2631.4,1957.1,0.42865,8.3261,1.8874; 295.17,279.74,1.2597,280.27,2962.1,1956.3,0.43256,10.819,1.4344; 303.31,279.61,2.2747,279.54,2675.3,2023.3,0.51559,9.5582,1.7838; 291.17,278.67,1.7749,278.93,2914.9,1454.7,0.47205,10.607,1.5085; 288.88,278.62,1.5533,279.29,2618.8,1725.2,0.43685,9.7427,1.674; 296.98,278.82,1.47,278.6,3038,1777.1,0.45721,8.7509,1.6086; 294.25,279.48,1.6853,279.23,2758.9,2065.2,0.49664,10.791,1.738; 299.47,278.49,1.4226,278.86,2759,1645.8,0.5336,9.8763,2.0367; 296.6,278.68,1.8669,278,2281.7,1814.6,0.4724,9.1434,1.7339; 291.74,279.74,1.5444,279.83,2774.9,1857.4,0.44616,11.307,1.4829; 290.52,278.46,1.6904,278.25,2933.8,2365.9,0.45882,9.2126,1.6517; 296.82,277.47,1.4806,277.4,2870.4,2030.6,0.48419,11.157,1.4127; 297.6,277.94,1.7375,277.88,2969.9,1803.7,0.47978,9.2065,1.6016; 292.67,278.99,
        1.7733,278.42,3502.4,1776.9,0.48538,8.5374,1.556; 296.18,279.53,1.5994,279.29,2379,1829.6,0.52631,10.567,2.0374; 297.32,279.01,2.0278,279.69,2717.2,1693.1,0.47429,12.534,1.6083; 292.01,278.88,1.0782,278.36,3435.3,1955,0.52377,10.48,1.7479; 293.59,279.13,2.0161,279.44,3107.7,1968.8,0.47121,10.335,1.8612; 296.91,277.76,2.3372,278.89,3201.5,1762,0.419,9.8249,1.5345; 295.94,278.89,1.7185,278.49,3009.2,2111.2,0.51616,10.518,1.6148; 292.02,278.73,1.8211,279.03,3121.9,2095.2,0.40152,10.043,1.3499; 296.54,280.13,1.6971,279.45,2806,1806.7,0.52384,9.3721,1.4884; 297.52,279.43,1.3468,279.8,3177.7,1726.9,0.55668,9.705,1.7701; 297.06,279.35,1.8326,278.45,2414.5,2099.3,0.43932,9.0907,1.8046; 290.68,279.64,1.5607,279.81,3019.6,1821.8,0.47267,10.419,1.6143; 293.43,279.17,2.5258,278.61,3219.7,1826.5,0.61434,9.5878,1.5409; 294.49,279.29,1.3749,279.16,3062.3,2264.6,0.5409,10.456,1.7122; 296.77,279.58,1.8717,280.49,2973.6,1891.4,0.48262,9.4577,1.7083; 296.62,278.44,1.3613,278.94,3156.3,1895.1,
        0.50155,10.752,1.6471; 294.47,279.4,1.5081,280.06,2885.1,1679.6,0.44204,11.123,1.826; 294.76,279.43,1.7165,279.09,2802.6,1816.3,0.46331,11.134,1.5226; 295.26,278.59,1.5392,278.43,3220.9,1479,0.48745,12.49,1.6447; 296.15,279.56,1.2408,279.63,2258.9,1427.4,0.57532,11.873,1.698; 296.61,278.82,2.0169,278.06,2803.9,1710.2,0.41233,9.8161,2.1121; 290.12,279.51,1.9941,279.03,3215.1,1683.1,0.41922,8.713,1.9004; 290.74,278.95,1.5456,279.49,2736.6,1785.7,0.47485,9.8778,1.6798; 296.01,277.97,1.8466,277.38,2934.5,2075.4,0.5406,9.9566,1.6052; 294.73,279.43,1.6806,280.18,3209.9,1746.6,0.6125,9.8992,1.477; 299.39,279.48,1.7122,280.13,3180.2,2068.5,0.45302,9.1817,1.7385; 295.05,279.21,1.5376,279.52,2874.5,1734,0.55738,9.3244,1.5207; 291.66,279.31,1.5853,279.19,2120.3,2016.7,0.53956,9.6047,1.6459; 294.97,278.66,1.7174,278.87,2989,1515.7,0.60992,9.6852,1.1575; 292.86,279.17,1.7524,279.95,2905.4,1951.2,0.42995,9.2909,1.8152; 291.9,279.49,2.2472,279.37,2458.9,1765.1,0.42609,10.855,1.6631; 288.66,
        279.23,1.9431,280.18,3163.2,1760.4,0.49762,8.3817,1.7086; 295.93,279.22,1.9544,279.88,2682.1,1598.7,0.5105,11.974,1.6336; 295.04,278.09,1.295,278.07,3308.6,2171.2,0.45291,9.2208,1.9251; 295.17,278.5,2.3165,279.46,2673.8,1943.9,0.48648,9.9879,1.657; 292.01,280.31,1.387,279.89,3168.6,1967.8,0.54756,9.3101,1.7772; 294.31,278.27,1.6296,278.25,2584.9,2058.3,0.42401,10.242,1.7095; 291.85,278.41,1.5671,278.57,3263.5,1848.2,0.482,10.454,1.7195; 294.3,278.89,1.8409,279,2847.5,1681.7,0.4937,9.2499,1.7384; 297.55,279.58,2.0569,280.34,2908.5,2087.8,0.51898,8.5234,1.5606; 291.3,278.56,1.7616,278.99,2350.6,1855.6,0.48883,10.011,1.8843; 295.52,278.94,1.3899,278.7,3022.6,1868.9,0.51492,10.097,1.2787; 296.47,278.62,1.8398,277.78,3050.1,2155.4,0.39464,10.457,1.7347; 300.73,279.12,1.7305,278.87,2918.7,1707.9,0.48062,11.437,1.6269; 289.21,278.99,2.2049,279.57,2971.3,1854.2,0.47382,8.8963,1.7446; 298.71,278.44,1.8623,279.31,3215.3,1816.8,0.50307,8.9401,1.7042; 298.86,278.54,1.7165,279,3245.6,
        1581.6,0.53578,9.4783,1.6145; 292.48,280.04,1.6655,279.68,2960.7,2092.7,0.3911,12.228,1.3451; 299.52,279.19,2.0584,278.9,3508.5,1925.6,0.44156,9.3514,1.6147; 294.69,278.81,1.9318,279.27,2680.7,1793.9,0.53662,10.146,1.652; 291.78,278.93,1.7339,278.45,2872.4,1784.9,0.5816,8.9268,1.4304; 292.42,278.82,1.3049,279.35,3316.6,2004.9,0.54096,10.591,1.62; 294.21,279.19,1.3915,278.52,3005.9,2222.4,0.59411,11.122,1.6952; 301.59,279.06,1.6611,279.52,3002.9,1534.7,0.52491,11.176,1.8445],
    startStatus={false,true,false,false,false,false,false,false,true,false,true,false,true,false,true,true,true,false,false,true,true,false,false,true,false,false,false,false,false,false,true,false,false,false,false,false,false,false,false,false,false,true,false,true,false,false,true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false,false,false,false,false,false,true,false,false,false,true,false,false,false,false,false,false,false,false,true,false,false,true,false,true,false,false,false,false,true,false,false,true,false,true,false,false})                                                                                                                                                                                                         annotation (Placement(transformation(extent={{-50,-28},{14,28}})));

  inner SimCenter simCenter annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
equation
  connect(fridgePool.epp, electricGrid.epp) annotation (Line(
      points={{10.48,0},{24,0},{24,0},{36,0}},
      color={0,135,135},
      thickness=0.5));
  connect(f_grid.y[1], electricGrid.f_set) annotation (Line(points={{23,50},{40,50},{40,12},{40.6,12}}, color={0,0,127}));
public
function plotResult

  constant String resultFileName = "TestPoolResponse.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();
createPlot(id=1, position={475, 0, 458, 679}, y={"fridgePool.epp.P"}, range={0.0, 8000.0, 6000.0, 20000.0}, grid=true, colors={{28,108,200}},filename=resultFile);
createPlot(id=1, position={475, 0, 458, 337}, y={"electricGrid.epp.f"}, range={0.0, 8000.0, 44.0, 56.0}, grid=true, subPlot=2, colors={{28,108,200}},filename=resultFile);
  resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
  annotation (Diagram(graphics,
                      coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for the FridgePool model</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">4.Interfaces</span></h4>
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
end TestPoolResponse;
