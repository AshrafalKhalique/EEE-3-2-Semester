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

cd('F:\Study material\Lab\3-2\Power System I'); %change the file directory
B = xlsread('Exp05'); %Read the excel file
j = 3;
V = B(:,2);
V0=B(:,2);
P=B(:,3)-B(:,5); %to get the value of real power 
Q=B(:,4)-B(:,6); %to get the value of reactive power
ang=B(:,7); %to get the angle
V1=V;
Pg=B(:,3);%to get the value of generator bus
for w=1:100    
    z=V;
    for k=2:j
        yv1=0;
        yv2=0;
        for h=1:j
            yv2=yv2+Y(k,h)*V(h); %to find the product of Y bus and voltages
            if h~=k
                yv1=yv1+Y(k,h)*V(h); %to find the product of Y bus and voltages
            end
        end
        if Pg(k)~=0
            g(k)=imag(V(k)*(conj(yv2))); %to get the imaginary value
            S(k)=P(k)+1i*g(k); %to calculate the apparent power
        else S(k)=P(k)+1i*Q(k);
        end
        V(k)=(1/Y(k,k))*((conj(S(k))/conj(V(k)))-yv1); %to get the value of node voltages
        ang1(k)=angle(V(k));    %to get the angles
        ang2(k)=rad2deg(ang1(k)); %to convert the radian values to degrees
        if Pg(k)~=0
            V(k)=V0(k)*exp(1i*ang1(k)); 
        end
    end
        V1=abs(V);
         ang2=rad2deg(ang1);
    E=abs((V-z)/V);       
    if E<=10e-4
        break;   %to break the for loop
    end
    Vlt_1(w)=V1(1);
    Vlt_2(w)=V1(2); 
    Vlt_3(w)=V1(3); 
    ang_1(w)=ang2(1); 
    ang_2(w)=ang2(2); 
    ang_3(w)=ang2(3);
end
Vlt_1=Vlt_1';   
ang_1=ang_1'; 
Vlt_2=Vlt_2';  % To show the value coloumn wise
ang_2=ang_2'; 
Vlt_3=Vlt_3'; 
ang_3=ang_3';
iteration=(1:w-1)';
table(iteration,Vlt_1,ang_1,Vlt_2,ang_2,Vlt_3,ang_3) %to show the values in a table

    
