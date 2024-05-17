% Newton Raphson Iterative Numeric Root Finder
% Author: Chris Reynolds
% Spring 2024
% 
% This code finds roots of a real-valued function
% using the Newton-Raphson numeric method. The NR method
% is a powerful iterative technique that yields results
% for most continuous and smooth functions with singular roots.
% Functions that have continuous first and second derivatives
% are ideal and will converge quickly (i.e. polynomials, 
% exponentials and trigonometric functions).
% 
clc;clear;                  % Clear workspace.

%% MAIN

% Gets user input.
[fx, dfx, ini, maxIteration, eaStop] = newtonRaphsonUserPrompt();

% Generates Matlab roots for comparison with estimated NR roots.
rootFzero = findRootFzero(fx, ini);

% Generates NR roots; returns roots, relative apprx. error and iteration count. 
[r, errorA, iterations] = newtonRaphson(fx, dfx, ini, maxIteration, eaStop);

% Calculates the true error of Matlab Roots and Newton Raphson estimates. 
[tError] = trueError(rootFzero, r);

% Displays the final results
displayResults(r, errorA, iterations, rootFzero, tError);


%% FUNCTIONS
%% User Prompt Function
function [fx, dfx, ini, maxIteration, eaStop] = newtonRaphsonUserPrompt()
    % Prompt the user to enter the function as a string
    funcStr = input('Enter the function f(x) as a string (e.g., ''exp(-x) - x''): ', 's');
    % Checks if empty, default case, Example 6.3
    if isempty(funcStr)
        funcStr = 'exp(-x) - x';
    end

    % Convert the function string to a function handle
    fx = str2func(['@(x) ' funcStr]);
    
    % Prompt the user to enter the derivative of the function as a string
    dFuncStr = input('Enter the derivative f''(x) as a string (e.g., ''-exp(-x) - 1''): ', 's');
    
    % Checks if empty, default case, Example 6.3
    if isempty(dFuncStr)
        dFuncStr = '-exp(-x) - 1';
    end

    % Convert the derivative function string to a function handle
    dfx = str2func(['@(x) ' dFuncStr]);
    
    % Prompt the user to enter the initial guess
    ini = input('Enter the initial guess (e.g., 0): ');
    
    % Prompt the user to enter the maximum number of iterations
    maxIteration = input('Enter the maximum number of iterations (e.g., 50): ');
    
    % Prompt the user to enter the stopping criterion for the approximate relative error
    eaStop = input('Enter the percent approximate relative error lower limit (e.g., 0.001): ');

    % Checks input, if empty, uses default case, Example 6.3
    if isempty(ini)
        ini = 0;
    end
    if isempty(maxIteration)
        maxIteration = 50;
    end
    if isempty(eaStop)
        eaStop = 0.001;
    end

end

%% Newton-Raphson Method Function
function [r, Ea, n_iter] = newtonRaphson(fx, dfx, ini, maxIteration, eaStop)
    % This function receives a real-valued function, the derivative of a function, 
    % an initial guess of the root, the maximum number of iterations, and a specified 
    % approximate relative error lower limit. The function returns roots (r),
    % the approximate error (Ea), and the number of iterations required (n_iter).

    % Initialize function variables
    r = ini;
    Ea = 100;       % Set initial approximate relative error to a large value
    n_iter = 0;     % Set iteration count to zero

    % Start iteration of NR method with conditions to break
    while Ea > eaStop && n_iter < maxIteration
            
        % Display iteration results
        fprintf('\nIteration: %d\n', n_iter);
        fprintf('Root: %.12f\n', r);

        % Increment the iteration counter
        n_iter = n_iter + 1;
        % Store the current root estimate
        rootOld = r;

        % Calculate the new approximation for the root using NR formula
        r = rootOld - fx(rootOld) / dfx(rootOld);
   
        % Calculate the approximate relative error 
        Ea = abs((r - rootOld) / r) * 100;
        fprintf('Approximate Relative Error: %.12f%%\n', Ea);

    end

    % Case: Max iterations reached before error limit criteria was met. 
    if n_iter >= maxIteration && Ea > eaStop
       fprintf('Stop criterion not reached after %d iterations. Exiting Program.\n\n', n_iter);
    end
end


%% True Error Calculation Function
function [tError] = trueError(rootFzero, r)
    % This function calculates the true error of two provided values. 

    % Calculate true error % between Matlab estimated roots and NR roots.
    tError = ((abs(rootFzero - r)) / rootFzero) * 100;
end

%% Display Results Function
function displayResults(r, errorA, iterations, rootFzero, tError)
    % This function displays the final results of the Newton-Raphson method and comparison with MATLAB root
    fprintf('\n\n--RESULTS--\nFinal Root Estimate: %.25f\n', r);
    fprintf('Approximate Relative Error: %.12f%%\n', errorA);
    fprintf('Number of Iterations: %d\n\n', iterations);
    fprintf('The MATLAB calculated root of the function: \n');
    fprintf('\n%.25f', rootFzero);
    fprintf('\n\nThe True Error of the Estimate: %.24f%%\n', tError);
end

%% Find Root using fzero Function
function rootFzero = findRootFzero(fx, ini)
    % This function finds the root using MATLAB's fzero function
    % with an initial guess provided by the user.

    % Find the root using fzero
    rootFzero = fzero(fx, ini);
end
