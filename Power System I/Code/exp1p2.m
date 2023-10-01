clc; %Clears previous data from command window 
clear all; %Removes all variables from the current workspace

cd('F:\Study material\Lab\3-2\Power System I'); %Changes file directory 
Matrix=xlsread('Exp01p02'); %Reads from excel file 
fprintf('Matrices'); %Prints the data 
disp(Matrix) %Shows the output 

n=length(Matrix); %Determines the number of elements 

%Ascending
for j=1:n %Campare first elements
    for k=j+1:n %Campare second elements 
        if Matrix(j)>=Matrix(k) %Compare greater or not 
            m=Matrix(j); %Store the greater number in a variable 
            Matrix(j)=Matrix(k); %Replace the greater number by the smaller one 
            Matrix(k)=m; %Replace the smaller number with greater number 
        end
    end
end
fprintf('Ascending: '); %Print the data in desired order

%Descending
disp(Matrix) %Show the output 
Output=xlsread('Exp01p02'); %Read from excel file 
n=length(Output); %Read the number of elements 
for j=1:n %Campare first elements 
    for k=j+1:n %Campare second elements  
        if Output(j)<=Output(k) %Compare samller or not 
            m=Output(j);%Store the smaller number in a variable 
            Output(j)=Output(k);%Replace the smaller number by the smaller one 
            Output(k)=m; %Replace the greater number with smaller number
        end
    end
end
fprintf('Descending: '); %Printing the data
disp(Output) %Show the output 