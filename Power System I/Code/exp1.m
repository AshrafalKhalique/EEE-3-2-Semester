clc; %Clears previous data from command window 
clear all; %Removes all variables from the current workspace
cd('F:\Study material\Lab\3-2\Power System I'); %Changes file directory 
x = xlsread('Exp01') %Imports data from excel file 
fprintf('\n Roll No           \tCTI          CT2         CT3          CT4        CT5        CT6\n') %Display the text 
disp(x) %Display the data inside variable

n=length(x) ; %Determines the number of column

y = x(:,2:n) ; %Isolates the data to be averaged from the roll 
fprintf('Marks:\n') %Display the text 
disp(y) %Display the data inside variable 

w = sort(y,2,'descend'); %Rearranging the columns in descending order. 2 is for descending rawwise 
fprintf('\nSorting descending order rawwise: \n') %Display the text 
disp(w) %display the data inside variable 

z = w(:,1:3) %Takes the first three columns containing highest three marks 
fprintf('\nBest three marks: \n') %Display the text 
disp(z) %Display the data inside variable 

m = mean(z,2) %Calculates mean of the highest three marks. 2 is for doing the action rawwise 
fprintf('\nAverage marks: \n') %Display the text 
disp(m) %Display the data inside variable 

Output = round(m) %Round the calculated data 
fprintf('Rounding the average marks: \n') %Display the text
disp(Output) %display the value inside variable 

Roll=x(:,1) %Taking the column of Roll 
Y=[Roll Output] %Forming a matrix of column Roll and Attained data as marks 
fprintf(' Roll No Attained Marks \n') %Display the text 
disp(Y) %Display the marks inside variable 