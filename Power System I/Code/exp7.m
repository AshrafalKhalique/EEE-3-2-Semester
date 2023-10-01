clc; %Clears previous data from command window 
clear all; %Removes all variables from the current workspace

% magnitude and phase of unbalaced voltage V1
M1 = input('Enter magnitude of V1:');
P1 = input('Enter phase of V1:');
V1 = M1.*exp(j*deg2rad(P1))
% magnitude and phase of unbalaced voltage V2
M2 = input('Enter magnitude of V2:');
P2 = input('Enter phase of V2:');
V2 = M2.*exp(j*deg2rad(P2))
% magnitude and phase of unbalaced voltage V3
M3 = input('Enter magnitude of V3:');
P3 = input('Enter phase of V3:');
V3 = M3.*exp(j*deg2rad(P3))

% calculate a
a = 1.*exp(j*2*pi/3);
anew = a.*a;

% finding zero sequnece
Va0 = (1/3)*(V1+V2+V3);
Vb0 = Va0;
Vc0 = Va0;
% finding positive sequnece
Va1 = (1/3)*(V1+a*V2+anew*V3);
Vb1 = anew*Va1;
Vc1 = a*Va1;
% finding negative sequnece
Va2 = (1/3)*(V1+anew*V2+a*V3);
Vb2 = a*Va2;
Vc2 = anew*Va2;
% finding original sequence
Va = (Va0+Va1+Va2);
Vb = (Vb0+Vb1+Vb2);
Vc = (Vc0+Vc1+Vc2);

% plotting unbalanced sequnece
subplot(2,3,1);
compass([V1,V2,V3]);
title('Unbalanced Sequence');
% plotting zero sequnece
subplot(2,3,2);
compass([Va0,Vb0,Vc0]);
title('Zero Sequence');
% finding positive sequnece
subplot(2,3,3);
compass([Va1,Vb1,Vc1]);
title('Positive Sequence');
% finding negative sequnece
subplot(2,3,4);
compass([Va2,Vb2,Vc2]);
title('Negative Sequence');
% finding original sequnece
subplot(2,3,6);
compass([Va,Vb,Vc]);
title('Original Sequence');
