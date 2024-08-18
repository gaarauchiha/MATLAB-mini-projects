% Programmer:  Abdulmajeed Alqahtani
% Section:     001
% Project:  02 
% Date:        16 June 2024 
% Description: This project starts by asking a retaurant customer for
% orders and follow up questions based on his/her entree choices,
% finally printing his/her orders at the end.
% In the next part, the user is asked to enter values for days, hours,
% minutes and seconds and after checking if the entered values are valid or
% not, the program prints out both the user inserted values as well as the
% corrected form of them if needed.
% Last part is a small touch on problem 2 which only checks if the entered
% values are plural or singular and adds 's' accordingly if needed.

% Integrity Statement: I have completed this work with integrity. -- Abdulmajeed Alqahtani


% Problem 1

entree_options = {'Chicken prosciutto', 'Sole'}; % Initial entree
starch_options_chicken = {'french fries', 'smashed potatoes'}; % Starch options if customer chooses Chicken prosciutto
starch_options_sole = {'baked potato', 'mashed potatoes'}; % Starch options if customer chooses Sole
dessert_options = {'Penn State Creamery Alumni Swirl Ice Cream', 'Shoofly pie', 'Raspberry cobbler', 'no dessert'}; % Deserts which are constant

entree_choice = menu('Please select an entree:', entree_options); % Asking customer to choose an entree

fprintf('The customer''s meal is:\n');

switch entree_choice
    case 1  % If customer chooses Chicken prosciutto as entree, he will have the following options as starch options
        starch_choice = menu('Please select a starch:', starch_options_chicken);
        fprintf('%s, ', entree_options{entree_choice});
        fprintf('%s, ', starch_options_chicken{starch_choice});
    case 2  % If customer chooses Sole as entree, he will have the following options as starch options
        starch_choice = menu('Please select a starch:', starch_options_sole);
        fprintf('%s, ', entree_options{entree_choice});
        fprintf('%s, ', starch_options_sole{starch_choice});
end

fprintf('asparagus, '); % Asparagus is served and it is constant

dessert_choice = menu('Please select a dessert:', dessert_options); % Choosing desert from desert menu
fprintf('and %s.\n', dessert_options{dessert_choice});


%% 

% Problem 2

% Asking user to insert # of days, hours, minutes and seconds
days = input('Enter the number of days: ');
hours = input('Enter the number of hours: ');
minutes = input('Enter the number of minutes: ');
seconds = input('Enter the number of seconds: ');

fprintf('The user entered %g days, %g hours, %g minutes, and %g seconds.\n', days, hours, minutes, seconds);

% In order to detect any abnormal entry, we will set a flag named:
% "correction"
% If every entry is correct, correct remains false and otherwise it will
% switch to true state which shows an illegal entry by user
correction = false;

% If statement to check if the seconds entry is valid
if seconds >= 60
    minutes = minutes + floor(seconds / 60);
    seconds = mod(seconds, 60);
    correction = true; % if seconds >= 60, set correction flag to true to show an invalid entryw hich needs correction
end

% If statement to check if the minutes entry is valid
if minutes >= 60
    hours = hours + floor(minutes / 60);
    minutes = mod(minutes, 60);
    correction = true;
end

% If statement to check if the hours entry is valid
if hours >= 24
    days = days + floor(hours / 24);
    hours = mod(hours, 24);
    correction = true;
end

% Check if any correction was made
if correction
    fprintf('The user-entered values required correction.\n');
    fprintf('The new values are: %g days, %g hours, %g minutes, and %g seconds.\n', days, hours, minutes, seconds);
else
    fprintf('The user-entered values required no correction.\n');
end


%% 

% Problem 2 Extra Credit

days = input('Enter the number of days: ');
hours = input('Enter the number of hours: ');
minutes = input('Enter the number of minutes: ');
seconds = input('Enter the number of seconds: ');

% Flag for detecting reqirement of any corrections
correction = false;

if seconds >= 60
    minutes = minutes + floor(seconds / 60);
    seconds = mod(seconds, 60);
    correction = true;
end


if minutes >= 60
    hours = hours + floor(minutes / 60);
    minutes = mod(minutes, 60);
    correction = true;
end

if hours >= 24
    days = days + floor(hours / 24);
    hours = mod(hours, 24);
    correction = true;
end

% Printing Process for the Original Prompt
fprintf('The user entered %g day(s), %g hour(s), %g minute(s), and %g second(s).\n', days, hours, minutes, seconds);

if correction
    fprintf('The user-entered values required correction.\n');
else
    fprintf('The user-entered values required no correction.\n');
end

% Printing Process for the Extra Credit Prompt
fprintf('The customer''s meal is:\n');
fprintf('%g %s, %g %s, %g %s, and %g %s.\n', days, pluralize('day', days), hours, pluralize('hour', hours), minutes, pluralize('minute', minutes), seconds, pluralize('second', seconds));

% "pluralize" function is used to handle pluralization problem in Extra
% Credit part
function word = pluralize(word, count)
    if count ~= 1 % If the count is not 1, we have more than one item and we add 's' to end of the word
        word = [word 's'];
    end
end



