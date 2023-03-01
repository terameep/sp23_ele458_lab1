H=60;
G=pi/2000;
T=0.001;
Kf=17.75;
K=0.2025;
alpha=25;
alpha1=35.5;
beta=2334;

% Begin plotting data

load("lab1data.mat");
Time = seconds(intersect(u(:,1),y(:,1)));
MotorInputVoltage = u(:,2);
EncoderAngularPosition = y(:,2);

data = timetable(Time,MotorInputVoltage,EncoderAngularPosition);

figs(1) = figure;
plotMotorInputVoltage = plot(data,"MotorInputVoltage");
title('Time Plot of Motor Voltage u');
ylabel('Motor Input Voltage [V]');
exportgraphics(figs(1),'motorFig.pdf','ContentType','vector');

figs(2) = figure;
plotEncoderAngularPosition = plot(data,"EncoderAngularPosition");
title('Time Plot of Encoder Angular Position y');
ylabel('Encoder Angular Position [rad]');
exportgraphics(figs(2),'positionFig.pdf','ContentType','vector');

figs(3) = figure;
plotData = plot(data,["MotorInputVoltage","EncoderAngularPosition"]);
title('Time Plot of Motor Voltage u and Encoder Angular Position y');
legend;
exportgraphics(figs(3),'bothFig.pdf','ContentType','vector');

figs(4) = figure;
ax1 = nexttile;
plotMotorInputVoltage = plot(ax1,data,"MotorInputVoltage");
title(ax1,'Time Plot of Motor Voltage u');
ylabel(ax1,'Motor Input Voltage [V]');

ax2 = nexttile;
plotEncoderAngularPosition = plot(ax2,data,"EncoderAngularPosition");
title(ax2,'Time Plot of Encoder Angular Position y');
ylabel(ax2,'Encoder Angular Position [rad]');
exportgraphics(figs(4),'tiledFig.pdf','ContentType','vector');

savefig(figs,'Data.fig','compact');
close(figs);

%open all figs
figs = openfig('Data.fig');
