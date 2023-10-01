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
LFS = xlsread('Exp05'); %Read the excel file
busnum=LFS(:,1);
bustype=LFS(:,1);
nbus=length(busnum);
voltage=LFS(:,2);
Angle=LFS(:,7);
Pg=LFS(:,3);
Pl=LFS(:,5);
Qg=LFS(:,4);
Ql=LFS(:,6);
P=LFS(:,3)-LFS(:,5);
Q=LFS(:,3)-LFS(:,5);
Psp=P;
Qsp=P;
for j=1:nbus
    v(j)=voltage(j)*exp(1i*Angle(j));
end
for i=1:nbus
    bustype(1)=busnum(1);
    if Pg(i)~=0&&Qg(i)==0&&v(i)~=1
        bustype(i)=2;
    else if P(i)~=0&&Q(i)~=0&&v(i)==1
            bustype(i)=3;
        end
    end
end
w=real(v);
u=imag(v);
[del V]=cart2pol(w,u);
vnew=V;
w=real(Y);
u=imag(Y);
[theta Y]=cart2pol(w,u);
pv=find(bustype==2);
pq=find(bustype==3);
npv=length(pv);
npq=length(pq);
delv=1;
count=0;
tol=0.1
v1=0;
v2=0;
v3=0;

V=vnew;
P=zeros(nbus,1);
Q=zeros(nbus,1);
for i=1:nbus
        for k=1:nbus
            P(i)=P(i)+(V(i)*Y(i,k)*V(k)*cos(theta(i,k)-del(i)+del(k)));
            Q(i)=Q(i)-(V(i)*Y(i,k)*V(k)*sin(theta(i,k)-del(i)+del(k)));
        end
    end
    dPp=Psp-P;
    dQp=Qsp-Q;
    k=1;
    dQ=zeros(npq,1);
    for i=1:npq
        if bustype(i)==2
            dQ(k)=dQp(i);
        end
    end
    dP=dPp(2:nbus);
    M=[dP;dQ];
    J1=zeros(nbus-1,nbus-1);
    for i=1:nbus-1
        m=i+1;
        for k=1:nbus-1
            n=k+1;
            if m==n
                for n=1:nbus
                    J1(i,k)=J1(i,k)+(V(m)*Y(m,n)*V(n)*sin(theta(m,n)-del(m)+del(n)));
                end
                J1(i,k)=J1(i,k)-(V(m)*Y(m,n)*V(m)*sin(theta(m,m)));  %hh
            else
            J1(i,k)=-(V(m)*Y(m,n)*V(n)*sin(theta(m,n)-del(m)+del(n)));
            end
        end
    end
    J2=zeros(nbus-1,npq);
    for i=1:nbus-1
        m=i+1;
         for k=1:npq
            n=pq(k);
            if m==n
                for n=1:nbus
                    J2(i,k)=J2(i,k)+(V(m)*Y(m,n)*V(n)*cos(theta(m,n)-del(m)+del(n)));
                end
                J2(i,k)=J2(i,k)+(2*V(m)*Y(m,n)*cos(theta(m,m)));
            else
            J2(i,k)=(V(m)*Y(m,n)*sin(theta(m,n)-del(m)+del(n)));
            end
        end
    end
         J3=zeros(npq,nbus-1);
     for i=1:npq
        m=pq(i);
         for k=1:nbus-1
            n=k+1;
            if m==n
                for n=1:nbus
                    J3(i,k)=J3(i,k)+(V(m)*Y(m,n)*V(n)*cos(theta(m,n)-del(m)+del(n)));
                end
                J3(i,k)=J3(i,k)-(V(m)*Y(m,m)*V(m)*cos(theta(m,m)));  %h
            else
            J3(i,k)=-(V(m)*Y(m,n)*V(n)*cos(theta(m,n)-del(m)+del(n)));
            end
        end
     end
          J4=zeros(npq,npq);
     for i=1:npq
        m=pq(i);
         for k=1:npq
            n=pq(k);
            if m==n
                for n=1:nbus
                    J4(i,k)=J4(i,k)-(V(n)*Y(m,n)*sin(theta(m,n)-del(m)+del(n)));
                end
                J4(i,k)=J4(i,k)-(2*V(m)*Y(m,m)*sin(theta(m,m)));  %h
            else
            J4(i,k)=-(V(m)*Y(m,n)*sin(theta(m,n)-del(m)+del(n)));
            end
        end
     end
J=[J1 J2;J3 J4]
X=inv(J)*M;
dth=X(1:nbus-npq);
dV=X(npv+1:nbus);
for i=2:nbus
    del(i)=del(i)+dth(i-1);
end
for i=1:nbus
    k=1;
    if(bustype(i)==3)
        vnew(i)=V(i)+dV(k);
    end
    k=k+1;
end
for i=1:nbus
   I=[vnew(i) del(i)];
end
%disp
count=count+1;
delv=abs(vnew-V);
I=[count vnew del delv];
disp('Iteration Magnitude Angle Error');
disp(I);
Bus=busnum;
Magnitude=vnew';
ang=radtodeg(del);
Angle=ang';
T=table(Bus,Magnitude,Angle);
disp(T);
