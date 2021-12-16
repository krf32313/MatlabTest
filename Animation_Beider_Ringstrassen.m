% Animation beider Ringstraßen

clc; clear; close all;

% Initialisierungswerte
dichte1 = 0.15;
dichte2 = 0.10;
laenge1 = 200;
laenge2 = 200;
iter = 100;
v_max1 = 5;
v_max2 = 6;
p_troedel1 = 0.2;
p_troedel2 = 0.25;
ampel1 = 100; % Das ist die Position der Ampel bei Ringstraße 1
ampel2 = 80; % Das ist die Position der Ampel bei Ringstraße 2
t_gruen_Ampel1 = 30;
t_gruen_Ampel2 = 20;
t_rot_Ampel1 = t_gruen_Ampel2;
t_rot_Ampel2 = t_gruen_Ampel1;

% Nagel Schreckenberg beider Ringstraßen berechnen
% Neue Parameter: dichte,laenge,iter,v_max,p_troedel, ampel, t_gruen, t_rot
[ind1,val1] = Ampel_Nagel_Schreck(dichte1, laenge1, iter, v_max1, p_troedel1, ampel1, t_gruen_Ampel1, t_rot_Ampel1);
[ind2,val2] = Starte_rote_Ampel_Nagel_Schreck(dichte2, laenge2, iter, v_max2, p_troedel2, ampel2, t_gruen_Ampel2, t_rot_Ampel2);

% Bewegungsdaten festlegen
x1 = ind1; % Position der Autos auf Ringstraße 1
x2 = ind2; % Position der Autos auf Ringstraße 2

% Initialisierungsbild malen
% Figure Größe ganzer Bildschirm
%figure('units','normalized','outerposition',[0 0 1 1])
% Zwei Linien für die jeweiligen Straßen plotten
s1 = [0:0.1:laenge1]; % x Werte für Straße 1
s2 = [0:0.1:laenge2]; % y Werte für Straße 2
m1 = size(s1,2);
m2 = size(s2,2);
% Plot der 1. Ringstraße
ys1o = ones(m1,1).*(ampel2+5); % y Wert obere Straßenlinie Ringstraße 1
ys1u = ones(m1,1).*(ampel2-5); % y Wert untere Straßenlinie Ringstraße 1
plot(s1,ys1o, 'k')
hold on
plot(s1,ys1u, 'k')
hold on
% Plot der 2. Ringstraße
xs2l = ones(m2,1).*(ampel1+5); % x Wert linke Straßenlinie Ringstraße 2
xs2r = ones(m2,1).*(ampel1-5); % x Wert rechte Straßenlinie Ringstraße 2
plot(xs2l,s2, 'k')
hold on
plot(xs2r,s2, 'k')
hold on
% Ampel plotten
plot(ampel1,ampel2, '+', 'MarkerSize' ,22, 'MarkerFaceColor', 'r','LineWidth',4)

% Startpositionen der Autos plotten
% Ringstraße 1
NumberCars1 = size(x1,1);
yWerte = ones(NumberCars1,1)*(ampel2);
h1 = plot(x1(:,1), yWerte, 'o', 'MarkerSize' ,10, 'MarkerFaceColor', 'c');
% Ringstraße 2
NumberCars2 = size(x2,1);
xWerte = ones(NumberCars2,1)*(ampel1);
h2 = plot(xWerte, x2(:,1), 'o', 'MarkerSize' ,10, 'MarkerFaceColor', 'g');

% Achsen festlegen
%axis off
xlim([0, laenge1])
ylim([0, laenge2]);

% Animationsschleife, die pro Iteration die neuen Positionen der Autos
% beider Ringstraßen plottet
for i = 1:iter
        set(h1, 'XData', x1(:,i));
        set(h2, 'YData', x2(:,i));
        drawnow;
        pause(0.1);
end



