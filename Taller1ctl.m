% Daniel Felipe Sarmiento Pilonieta 2202797
% Monica Cristina Peña Rincon 2205125
% Fabian Andres Amador Ballesteros 2204215
%% ============================================================
%  SINTONÍA P, PI y PID
%  Métodos:
%  - Ziegler-Nichols
%  - CHR 0%
%  - CHR 20%
%  - Cohen-Coon
%
%  Planta:
%  G(s) = 1.5 / ((8s+1)(3s+1)(s+1)) e^{-1.5s}
%% ============================================================

clc
clear
close all

%% ============================================================
%% DEFINICIÓN DE LA PLANTA

G = tf([1.5],conv(conv([8 1],[3 1]),[1 1]));
G.iodelay = 1.5;
[num,den] = tfdata(G,'v');
l= G.iodelay;

figure
step(G)
title('Respuesta al Escalón - Planta Real')
grid on

k = dcgain(G);
fprintf('Ganancia estática K = %.3f\n',k)

%% ============================================================
%% CURVA DE REACCIÓN - MODELO FOPDT

dt = 0.01;
t = 0:dt:80;
u = ones(size(t));

y = lsim(G,u,t);

% Cálculo de t1 y t2
y_t1 = k*0.283;
y_t2 = k*0.632;

[~,idx1] = min(abs(y - y_t1));
[~,idx2] = min(abs(y - y_t2));

t1 = t(idx1);
t2 = t(idx2);

T = 1.5*(t2 - t1);
L = t2 - T;

tau = T;
theta = L;

fprintf('tau = %.3f\n',tau)
fprintf('theta = %.3f\n',theta)

%% ============================================================
%% DISEÑO DE CONTROLADORES

R = theta/tau;

%% =========================
%% ZIEGLER-NICHOLS

% P
Kp_ZN_P = tau/(k*theta);
T_ZN_P = feedback(pid(Kp_ZN_P)*G,1);

% PI
Kp_ZN_PI = 0.9*tau/(k*theta);
Ti_ZN_PI = 3*theta;
Ki_ZN_PI = Kp_ZN_PI/Ti_ZN_PI;
T_ZN_PI = feedback(pid(Kp_ZN_PI,Ki_ZN_PI)*G,1);

% PID
Kp_ZN_PID = 1.2*tau/(k*theta);
Ti_ZN_PID = 2*theta;
Td_ZN_PID = 0.5*theta;
Ki_ZN_PID = Kp_ZN_PID/Ti_ZN_PID;
Kd_ZN_PID = Kp_ZN_PID*Td_ZN_PID;
T_ZN_PID = feedback(pid(Kp_ZN_PID,Ki_ZN_PID,Kd_ZN_PID)*G,1);

%% =========================
%%  CHR 0%

% P
Kp_CHR0_P = 0.3*tau/(k*theta);
T_CHR0_P = feedback(pid(Kp_CHR0_P)*G,1);

% PI
Kp_CHR0_PI = 0.6*tau/(k*theta);
Ti_CHR0_PI = 4*theta;
Ki_CHR0_PI = Kp_CHR0_PI/Ti_CHR0_PI;
T_CHR0_PI = feedback(pid(Kp_CHR0_PI,Ki_CHR0_PI)*G,1);

% PID
Kp_CHR0_PID = 0.6*tau/(k*theta);
Ti_CHR0_PID = tau;
Td_CHR0_PID = theta/2;
Ki_CHR0_PID = Kp_CHR0_PID/Ti_CHR0_PID;
Kd_CHR0_PID = Kp_CHR0_PID*Td_CHR0_PID;
T_CHR0_PID = feedback(pid(Kp_CHR0_PID,Ki_CHR0_PID,Kd_CHR0_PID)*G,1);

%% =========================
%%  CHR 20%

% P
Kp_CHR20_P = 0.7*tau/(k*theta);
T_CHR20_P = feedback(pid(Kp_CHR20_P)*G,1);

% PI
Kp_CHR20_PI = 0.95*tau/(k*theta);
Ti_CHR20_PI = 2.4*theta;
Ki_CHR20_PI = Kp_CHR20_PI/Ti_CHR20_PI;
T_CHR20_PI = feedback(pid(Kp_CHR20_PI,Ki_CHR20_PI)*G,1);

% PID
Kp_CHR20_PID = 0.95*tau/(k*theta);
Ti_CHR20_PID = 1.357*tau;
Td_CHR20_PID = 0.473*theta;
Ki_CHR20_PID = Kp_CHR20_PID/Ti_CHR20_PID;
Kd_CHR20_PID = Kp_CHR20_PID*Td_CHR20_PID;
T_CHR20_PID = feedback(pid(Kp_CHR20_PID,Ki_CHR20_PID,Kd_CHR20_PID)*G,1);

%% =========================
%%  COHEN-COON

% P
Kp_CC_P = (tau/(k*theta))*(1 + R/3);
T_CC_P = feedback(pid(Kp_CC_P)*G,1);

% PI
Kp_CC_PI = (tau/(k*theta))*(0.9 + R/12);
Ti_CC_PI = theta*(30 + 3*R)/(9 + 20*R);
Ki_CC_PI = Kp_CC_PI/Ti_CC_PI;
T_CC_PI = feedback(pid(Kp_CC_PI,Ki_CC_PI)*G,1);

% PID
Kp_CC_PID = (1.35 + 0.25*R)*tau/(k*theta);
Ti_CC_PID = theta*(1.35 + 0.25*R)/(0.54 + 0.33*R);
Td_CC_PID = (0.5*theta)/(1.35 + 0.25*R);
Ki_CC_PID = Kp_CC_PID/Ti_CC_PID;
Kd_CC_PID = Kp_CC_PID*Td_CC_PID;
T_CC_PID = feedback(pid(Kp_CC_PID,Ki_CC_PID,Kd_CC_PID)*G,1);

%% ============================================================
%% GRÁFICAS COMPARATIVAS

% ========================
% CONTROLADORES P
figure
step(T_ZN_P,'r',T_CHR0_P,'b',T_CHR20_P,'g',T_CC_P,'k',80)
title('Comparación Métodos - Controlador P')
legend('ZN','CHR 0%','CHR 20%','Cohen-Coon')
grid on

% ========================
% CONTROLADORES PI
figure
step(T_ZN_PI,'r',T_CHR0_PI,'b',T_CHR20_PI,'g',T_CC_PI,'k',80)
title('Comparación Métodos - Controlador PI')
legend('ZN','CHR 0%','CHR 20%','Cohen-Coon')
grid on

% ========================
%  CONTROLADORES PID
figure
step(T_ZN_PID,'r',T_CHR0_PID,'b',T_CHR20_PID,'g',T_CC_PID,'k',80)
title('Comparación Métodos - Controlador PID')
legend('ZN','CHR 0%','CHR 20%','Cohen-Coon')
grid on
%% ============================================================
%% CÁLCULO DE MÉTRICAS Y TABLA COMPARATIVA

% Lista de sistemas
Sistemas = { ...
    T_ZN_P, T_CHR0_P, T_CHR20_P, T_CC_P, ...
    T_ZN_PI, T_CHR0_PI, T_CHR20_PI, T_CC_PI, ...
    T_ZN_PID, T_CHR0_PID, T_CHR20_PID, T_CC_PID};

Nombres = { ...
    'ZN_P','CHR0_P','CHR20_P','CC_P', ...
    'ZN_PI','CHR0_PI','CHR20_PI','CC_PI', ...
    'ZN_PID','CHR0_PID','CHR20_PID','CC_PID'};

Overshoot = zeros(length(Sistemas),1);
Ts = zeros(length(Sistemas),1);
IAE = zeros(length(Sistemas),1);
ISE = zeros(length(Sistemas),1);

for i = 1:length(Sistemas)
    
    % Información temporal
    info = stepinfo(Sistemas{i});
    Overshoot(i) = info.Overshoot;
    Ts(i) = info.SettlingTime;
    
    % Señal respuesta
    [y,t_resp] = step(Sistemas{i},80);
    e = 1 - y;
    
    % Cálculo integrales
    IAE(i) = trapz(t_resp,abs(e));
    ISE(i) = trapz(t_resp,e.^2);
    
end

% Construcción tabla
Tabla = table(Overshoot,Ts,IAE,ISE,'RowNames',Nombres);

disp('============================================================')
disp('TABLA COMPARATIVA DE DESEMPEÑO')
disp('============================================================')
disp(Tabla)