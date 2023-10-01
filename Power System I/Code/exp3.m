clc;  %Clears previous data from command window 
clear all; %Removes all variables from the current workspace
z = [0.1i 0.4i 0.2i inf;0.4i 0.8i 0.2i inf;0.2i 0.2i inf 0.08i;inf inf 0.08 inf] %Taking input impedance matrix
n = length(z) %Determine length of the matrix
Y = 1./z %Taking inverse impedance matrix
p = sum(Y,2) %Taking symmetric summation

%Apply looping condition to determine value of the matrix element
for i=1:n 
    for j=1:n
        if i~=j
            Y(i,j)= -Y(j,i);
        else
            
            Y(i,j)= p(i);
        end
    end
end
fprintf(' Y is \n') %Display the text
disp(Y) %Display the output
