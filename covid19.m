%!/usr/bin/octave
% Conoravirus SARS-CoV-2 statistics
% Author: Jorgeluis Guerra.

clear

% Daily Deaths
Br = [3, 4, 7, 7, 9, 12, 13, 18, 15, 22, 22, 27, 38, 41, 82, 39, 82, 41, 78, 122, 134, 134, 114, 72, 83, 105, 204, 225, 190];
EUA = [5, 3, 2, 1, 3, 4, 3, 4, 4, 8, 3, 7, 9, 12, 18, 23, 40, 56, 49, 46, 113, 142, 225, 247, 268, 401, 525, 370, 558, 914, 1050, 974, 1051, 1330, 1167, ...
       1259, 1973, 1943, 1901, 2035, 1830, 1528, 1535, 6185, 2618, 2174];
Sp = [5, 2, 7, 13, 6, 19, 31, 47, 63, 98, 48, 191, 105, 193, 262, 288, 391, 539, 680, 656, 718, 773, 844, 821, 913, 748, 923, 961, 850, 749, 694, 700, 704, ...
      747, 655, 634, 525, 603, 547, 499, 557, 503];

% Daily Deaths vectors for 7-day mean calculi
Br_4mean = [0, 0, 0, 0, 1, 3, 3, 4, 7, 7, 9, 12, 13, 18, 15, 22, 22, 27, 38, 41, 82, 39, 82, 41, 78, 122, 134, 134, 114, 72, 83, 105, 204, 225, 190];
EUA_4mean = [0, 0, 0, 0, 1, 0, 5, 3, 2, 1, 3, 4, 3, 4, 4, 8, 3, 7, 9, 12, 18, 23, 40, 56, 49, 46, 113, 142, 225, 247, 268, 401, 525, 370, 558, 914, 1050, ...
             974, 1051, 1330, 1167, 1259, 1973, 1943, 1901, 2035, 1830, 1528, 1535, 6185, 2618, 2174];
Sp_4mean = [0, 0, 0, 1, 1, 1, 5, 2, 7, 13, 6, 19, 31, 47, 63, 98, 48, 191, 105, 193, 262, 288, 391, 539, 680, 656, 718, 773, 844, 821, 913, 748, 923, 961, ...
            850, 749, 694, 700, 704, 747, 655, 634, 525, 603, 547, 499, 557, 503];

% Date of total deaths equal to 5
Br_first_5death_day = [19, 03, 2020];
EUA_first_5death_day = [02, 03, 2020];
Sp_first_5death_day = [06, 03, 2020];

% Populations
Br_pop_M = 212.6;
EUA_pop_M = 331.0;
Sp_pop_M = 46.8;

% Daily Deaths per million habitants
Br_per_M = Br / Br_pop_M;
EUA_per_M = EUA / EUA_pop_M;
Sp_per_M = Sp / Sp_pop_M;

% Days from the day of total 5 deaths until now
xBr = 1:29;
xEUA = 1:46;
xSp = 1:42;

% Vectors to store 7-day mean data
Br_7day = zeros (1, xBr(end));
EUA_7day = zeros (1, xEUA(end));
Sp_7day = zeros (1, xSp(end));

% 7-day mean data calculi
for i = xBr
   Br_7day(i) = Br_4mean(i+6) + Br_4mean(i+5) + Br_4mean(i+4) + Br_4mean(i+3) + Br_4mean(i+2) + Br_4mean(i+1) + Br_4mean(i);
endfor
for i = xEUA
   EUA_7day(i) = EUA_4mean(i+6) + EUA_4mean(i+5) + EUA_4mean(i+4) + EUA_4mean(i+3) + EUA_4mean(i+2) + EUA_4mean(i+1) + EUA_4mean(i);
endfor
for i = xSp
   Sp_7day(i) = Sp_4mean(i+6) + Sp_4mean(i+5) + Sp_4mean(i+4) + Sp_4mean(i+3) + Sp_4mean(i+2) + Sp_4mean(i+1) + Sp_4mean(i);
endfor

Br_7day = Br_7day / 7;
EUA_7day = EUA_7day / 7;
Sp_7day = Sp_7day / 7;

% Removes days before the first day when the mean reach 5 deaths
Br_7day = Br_7day(6:end);
xBr7d = 1:24;
EUA_7day = EUA_7day(13:end);
xEUA7d = 1:34;
Sp_7day = Sp_7day(5:end);
xSp7d = 1:38;

Br_7day_per_M = Br_7day / Br_pop_M;
EUA_7day_per_M = EUA_7day / EUA_pop_M;
Sp_7day_per_M = Sp_7day / Sp_pop_M;

%% Daily Deaths bars graph
%pause(0.3);
%figure;
%bar (xBr, Br);
%pause(0.3);
%figure;
%bar (xEUA, EUA);
%pause(0.3);
%figure;
%bar (xSp, Sp);
%
%% Daily Deaths 7-day mean bars graph
%pause(0.3);
%figure;
%bar (xBr, Br_7day);
%pause(0.3);
%figure;
%bar (xEUA, EUA_7day);
%pause(0.3);
%figure;
%bar (xSp, Sp_7day);

% Daily Deaths function graph
pause(0.3);
figure;
set(gca, 'DefaultLineLineWidth', 2.5);
plot (xBr, Br, xEUA, EUA, xSp, Sp);
title('Mortes diarias');
legend('Br','EUA', 'Sp');

% Daily Deaths per million function graph
pause(0.3);
figure;
set(gca, 'DefaultLineLineWidth', 2.5);
plot (xBr, Br_per_M, xEUA, EUA_per_M, xSp, Sp_per_M);
title('Mortes diarias por milhao de habitantes');
legend('Br','EUA', 'Sp');

% Daily Deaths 7-day mean function graph
pause(0.3);
figure;
set(gca, 'DefaultLineLineWidth', 2.5);
plot (xBr7d, Br_7day, xEUA7d, EUA_7day, xSp7d, Sp_7day);
title('Mortes diarias (7-day mean)');
legend('Brasil','EUA', 'Espanha');

% Daily Deaths 7-day mean per million function graph
pause(0.3);
figure;
set(gca, 'DefaultLineLineWidth', 2.5);
plot (xBr7d, Br_7day_per_M, xEUA7d, EUA_7day_per_M, xSp7d, Sp_7day_per_M);
title('Mortes diarias por milhao de habitantes (7-day mean)');
legend('Brasil','EUA', 'Espanha');
