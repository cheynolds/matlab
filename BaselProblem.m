%% The purpose of this script is to provide evidence for the validity of 
% Euler's Basel Problem Proof, specifically, [(pi^2)/6] = SUM[1/(x^2)]. 
% More information can be found here: https://en.wikipedia.org/wiki/Basel_problem
% The summation of the exponentional denomenator approaches the defined
% value of [(pi^2)/6] = 1.644934066848
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
        fprintf("%.12f TERM %d\n",round(calcValue,n+4),i);
        fprintf("%.12f PI^2/6\n",piValue);
            if round(calcValue,n) >= round(piValue,n)
                break
            else
                i = i + 1;
            end
        end

     fprintf("To verify the Basel problem to %d digits requires %d terms.\n", n, i)
     fprintf("Compare %.12f [(pi^2)/6)] to %.12f [SUM 1/(x^2)]",piValue,round(calcValue,n)  )


%% SAMPLE OUTPUT 
%
% To verify the Basel problem to 7 digits requires 59622476 terms.
% Compare 1.644934050000 [SUM 1/(x^2)] to 1.644934066848 [(pi^2)/6)].
