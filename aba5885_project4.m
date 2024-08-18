% Programmer:  Abdulmajeed Alqahtani
% Section:     001
% Project:  04 
% Date:        05 August 2024 
% Description: In the first problem, we solved symbollically a system of
% simultaneous ordinary differential equations and edited the output with
% Simplify and pretty commands.
% In the next problem, we plotted the Oscar's butterfly in polar
% coordinates with fplot command.
% Then , we implemented a while loop that will ask for degrees in Farenheit
% keep running until a certain number has entered (-1). Then, it will do
% some calculations in Kelvin and Celsius degrees with entered inputs.
% Lastly, we modelled a growth system and solved it analytically and
% numerically (ode45) and then compared the results via their plots.
% Integrity Statement: I have completed this work with integrity. -- Abdulmajeed Alqahtani


% Problem 1

syms x(t) y(t)

ode1 = diff(x, t) == -x + 6*y;
ode2 = diff(y, t) == x - 2*y;

% IC of the system
cond1 = x(0) == -1;
cond2 = y(0) == 1;

[xSol(t), ySol(t)] = dsolve([ode1, ode2], [cond1, cond2]);

% Simplifying
xSol = simplify(xSol);
ySol = simplify(ySol);

% Using pretty as instructed
disp('x(t) is:');
pretty(xSol)

disp('y(t) is:');
pretty(ySol)

%% 

% Problem 2

f = @(theta) cos(5*theta).^2 + sin(3*theta) + 0.3;

theta = linspace(0, 6*pi, 1000);

r = f(theta);

figure;

% Using polarplot to plot in polar coordinates
polarplot(theta, r);

title("Oscar's Butterfly");


%% 

% Problem 3

celsiusTemps = [];
kelvinTemps = [];

continueLoop = true;

while continueLoop
    % User needs to enter a temperature in Fahrenheit
    T_F = input('Please enter a temperature (in Fahrenheit): ');

    % Farenheit to Celcius
    T_C = (5/9) * (T_F - 32);
    
    % Farenheit to Kelvin
    T_K = T_C + 273.15;
    
    celsiusTemps = [celsiusTemps, T_C];
    kelvinTemps = [kelvinTemps, T_K];
    
    % Looping cndition
    userChoice = input('Type -1 to run again, entering any other number terminates the loop: ');
    
    if userChoice ~= -1
        continueLoop = false;
    end
end

numTemps = length(celsiusTemps);

if numTemps < 6
    % If number of inputs less than 6, calculate the median of all Celsius temperatures
    medianCelsius = median(celsiusTemps);
    disp(['Median of the Celsius temperatures =  ', num2str(medianCelsius), ' C']);
else
    % If number of inputs more than 6, calculate the average of the first six Celsius temperatures
    avgCelsius = mean(celsiusTemps(1:6));
    disp(['Average of the first six Celsius temperatures = ', num2str(avgCelsius), ' C']);
end

% Min Kelvin input
minKelvin = min(kelvinTemps);
disp(['Minimum Kelvin temperature = ', num2str(minKelvin), ' K']);


%% 

% Problem 4

k = 0.1; 
t0 = 0; 
tf = 50;
p0 = 10; 
dt = 2;

t_euler = t0:dt:tf;
num_steps = length(t_euler);

P_euler = zeros(1, num_steps);
P_euler(1) = p0;

% System
dPdt = @(P) k * P;

% Forward Euler as instructed in class
for i = 1:num_steps-1
    P_euler(i+1) = P_euler(i) + dt * dPdt(P_euler(i));
end



odeFunc = @(t, P) k * P;

[t_ode45, P_ode45] = ode45(odeFunc, [t0 tf], p0);



% Analytical solution
t_analytical = linspace(t0, tf, 1000);
P_analytical = 10 * exp(k * t_analytical);

figure;
hold on;
plot(t_analytical, P_analytical, 'r*-', 'LineWidth', 2, 'DisplayName', 'Analytical');
plot(t_euler, P_euler, 'bo-', 'LineWidth', 2, 'DisplayName', 'Forward Euler');
plot(t_ode45, P_ode45, 'g*-', 'LineWidth', 2, 'DisplayName', 'ode45');
hold off;

title('Population Growth');
xlabel('Time in years');
ylabel('Population');

legend('Location', 'best');

grid on;























