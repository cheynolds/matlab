%% The purpose of this script is to provide evidence for the validity of 
% Euler's Basel Problem Proof, specifically, [(pi^2)/6] = SUM[1/(x^2)]. 
% The summation of the exponentional denomenator approaches the defined
% value of [(pi^2)/6] = 1.644934050000
%%
% Author: CHEYNOLDS 

clc;clear;

calcValue = 0;
piValue = ((pi)^2)/6;
i=1;


disp("Basel Problem, Solved by Euler")

n = input("How many decimal places of the Basel problem to find (caution 6+): \n")


      while 1
            
        calcValue = calcValue + (1/i^2);
        
            if round(calcValue,n) == round(piValue,n)
                break
            else
                i = i + 1;
            end
        end

     fprintf("To verify the Basel problem to %d digits requires %d terms.\n", n, i)
     fprintf("Compare %.12f [(pi^2)/6)] to %.12f [SUM 1/(x^2)]",piValue,calcValue  )

%% SAMPLE OUTPUT 
%
% To verify the Basel problem to 7 digits requires 59622476 terms.
% Compare 1.644934066848 [(pi^2)/6)] to 1.644934050000 [SUM 1/(x^2)]
