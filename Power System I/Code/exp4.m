clc;  %Clears previous data from command window 
clear all; %Removes all variables from the current workspace
cd('F:\Study material\Lab\3-2\Power System I'); %change the file directory
A = xlsread('EXp02p02'); %Read the excel file
n = length(A); %Determine the length of the excel file

% Applying symmetric condition
for w=1:n 
    Z(A(w,1),A(w,2)) = A(w,3)+i*A(w,4); 
    Z(A(w,2),A(w,1)) = A(w,3)+i*A(w,4);
end

m = length(Z); %Determine the length of the new matrix
for j=1:m
    for k=1:m
        if Z(j,k) == 0
            Z(j,k) = inf;
        end
    end
end
fprintf(' Z matrix is \n') %Display the text
disp(Z) %Display the output
y = 1./Z %Taking inverse impedance matrix
p = sum(y,2) %Taking symmetric summation

%Apply looping condition to determine value of the matrix element
for u=1:m 
    for x=1:m
        if u~=x
            Y(u,x)= -y(u,x); %For diagonal element
        else
            Y(u,x)= p(x); %For non-diagonal element
        end
    end
end
fprintf(' Y- bus matrix is \n') %Display the text
disp(Y) %Display the output

d = length(Y);
f = input('Total no. of buses: ');
g = input('No. of reduction: ');
for h=1:g %No. of reduction
    F = zeros(d-1); %Define a new matrix
    for t=1:(d-1) %Access all Y matrix element
        for r=1:(d-1) %
        F(t,r) = Y(t,r)-((Y(t,d)*Y(d,r))/Y(d,d));
        end
    end
    Y = F;
   d = d-1;
end
fprintf(' Reduced Y- bus matrix is \n') %Display the text
disp(Y)
