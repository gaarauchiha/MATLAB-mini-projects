% Programmer:  Abdulmajeed Alqahtani
% Section:     001
% Project:  03 
% Date:        16 July 2024 
% Description: In the first problem, after determining matrix of
% coefficients, A, and matrix of b for Ax=b system analytically, we perform
% inverse matrix method to get x ,which is the matrix of currents here. 
% Inprobelm2, after analytically putting the system into the matrix form Ax=b, we use that result
% to enter the variables A and b into our program. Then, we solve this system using
% matlab's row reduced echelon form solver. Also, we use a loop to automate the process and print the values of
% the temperatures to the Command Window with labels and units
% In the third problem, using Newton's law of cooling  and given values of
% the problem itself, we first calculate the constant, K, for the probelm
% and then using the calculated proportionality constant,we  create an array of time values ranging from = 0 sec to = 18,000 sec in steps of 1 sec.
% Using a vectorized operation, we calculate an array of coffee temperatures that correspond to the given
% times.Then, we calculate an array of temperature values one at a time
% using a loop and we plot the temperature history vs. time. We
% calculate temperature using both vectorized method and loop method with
% different step sizes and comapre the 2 methods while saving the process
% speed in a txt file.
% In the last program, we write a program that has the computer generate a pseudorandom integer between -100 and +100 and
% ask the user to guess what the number is.
% Integrity Statement: I have completed this work with integrity. -- Abdulmajeed Alqahtani


% Problem 1

% Matrix of coefficients, A
A = [1, -1, -1, 0; 
     0, 1, 1, -1; 
     15, 0, 20, 0; 
     15, 5, 0, 0];

b = [0; 0; 100; 100]; % Vector b of constants(RHS)

x = inv(A) * b; % Solving the system by matrix inverse method

% Currents
i1 = x(1);
i2 = x(2);
i3 = x(3);
i4 = x(4);

fprintf('i1 = %.2f A\n', i1); % Printing current values with unit
fprintf('i2 = %.2f A\n', i2);
fprintf('i3 = %.2f A\n', i3);
fprintf('i4 = %.2f A\n', i4);

%% 

% Problem 2

% Matrix of coefficients, A
A = [-245, 200, 0, 0; 
     200, -201.6, 1.6, 0; 
     0, 1.6, -201.6, 200; 
     0, 0, 200, -212];

b = [-1800; 0; 0; -276]; % Vector b of constants(RHS)

x = rref([A b]); % RREF solver

% Wanted temperatures
T1 = x(1, end);
T2 = x(2, end);
T3 = x(3, end);
T4 = x(4, end);

temp_labels = {'T1', 'T2', 'T3', 'T4'};
temp_values = [T1, T2, T3, T4];

% using loop automation for printing with proper units
for i = 1:length(temp_labels)
    fprintf('%s = %.2f °C\n', temp_labels{i}, temp_values(i));
end


%% 

% Problem 3

T0 = 180; % Initial temperature in F
TA = 68;  % Ambient temperature in F
T_2min = 165; % Temperature after 2 minutes
t_2min = 120; % Time in seconds (2 minutes)

%  Proportionality constant, K
K = -log((T_2min - TA) / (T0 - TA)) / t_2min;
disp(['Proportionality constant K: ', num2str(K), ' sec^-1']); % Print with its suggested unit


time_values = 0:1:18000; % Array of time values from 0 to 18000 seconds

T_vectorized = TA + (T0 - TA) * exp(-K * time_values); % Calculating T(t) by vectorized operation

T_loop = zeros(size(time_values)); % Temperature array 

% Calculating temperatures by loop
for i = 1:length(time_values)
    T_loop(i) = TA + (T0 - TA) * exp(-K * time_values(i));
end


% Checking if both methods give the same result
if isequal(T_vectorized, T_loop)
    disp('Vectorized and loop-based give same results.');
else
    disp('Vectorized and loop-based DON''T give same results.');
end

figure;
plot(time_values, T_vectorized, 'c--s');
title('Temperature History vs. Time');
xlabel('t(seconds)');
ylabel('Temperature (degress Fahrenheit)');
grid on;

% Experimenting time step sizes
time_step_sizes = [0.5, 1, 2, 5, 10]; % Various time step sizes

% Loop for different time step sizes
for dt = time_step_sizes
    % Vectorized method
    tic;
    time_values_vec = 0:dt:18000;
    T_vec = TA + (T0 - TA) * exp(-K * time_values_vec);
    vectorized_time = toc;
    
    % Loop-based method
    tic;
    T_loop = zeros(size(time_values_vec));
    for i = 1:length(time_values_vec)
        T_loop(i) = TA + (T0 - TA) * exp(-K * time_values_vec(i));
    end
    loop_time = toc;
    
    fprintf('Time step: %.2f sec | Vectorized: %.4f sec | Loop: %.4f sec\n', dt, vectorized_time, loop_time);
end

% Save process speed results in a txt file named:
% "temperature_analysis_results.txt"
fileID = fopen('C:\Users\ASUS  N551JW\Desktop\ddlines\temperature_analysis_results.txt', 'w');

fprintf(fileID, 'Proportionality constant K: %.6f sec^-1\n', K);

% Writing the results for different time step sizes
fprintf(fileID, 'Time step size (sec) | Vectorized time (sec) | Loop time (sec)\n');
for dt = time_step_sizes
    % Vectorized approach
    tic;
    time_values_vec = 0:dt:18000;
    T_vec = TA + (T0 - TA) * exp(-K * time_values_vec);
    vectorized_time = toc;
    
    % Loop-based approach
    tic;
    T_loop = zeros(size(time_values_vec));
    for i = 1:length(time_values_vec)
        T_loop(i) = TA + (T0 - TA) * exp(-K * time_values_vec(i));
    end
    loop_time = toc;
    
    fprintf(fileID, '%.2f | %.4f | %.4f\n', dt, vectorized_time, loop_time);
end

fclose(fileID);

% From the results, Vectorized method is faster.
% The larger the dataset, the better the performance of vectorized in
% compared to loop approach.
% This is due to the fact that in vectorized method, the process doesn't
% need to start from the scratch to calculate the next response values and
% can use the outputs of the previously calculated results which will boost
% the time of processing in this approach.

%% 

% Problem 4

target_number = randi([-100, 100]); % Random number 

guess_count = 0;

while true
    user_guess = input('Enter your guess: ', 's'); % Asking user to enter the guess
    
    guess = str2double(user_guess);
    
    % Checking if user wants end process
    if isinf(guess)
        fprintf('You asked to terminate the program.\n');
        fprintf('The correct value was %d.\n', target_number);
        fprintf('The program iterated %d times.\n', guess_count);
        break;
    end
    
    % Checking the allowed range
    if guess < -100 || guess > 100
        fprintf('Please enter a number within the range -100 to 100.\n');
        continue; % Not a valid iteration
    end
    
    guess_count = guess_count + 1;
    
    if guess < target_number
        fprintf('Sorry, your guess was too low. Please try again.\n');
    elseif guess > target_number
        fprintf('Sorry, your guess was too high. Please try again.\n');
    else
        fprintf('You guessed the correct value!\n');
        fprintf('The correct value was %d.\n', target_number);
        fprintf('The program iterated %d times.\n', guess_count);
        break;
    end
end







