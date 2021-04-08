:- [testKB].

% determines if the input is a valid command
check_input(['add'|_]) :- write("add\n"), !.
check_input(['remove'|_]) :- write("remove\n"), !.
check_input(['check', 'nutrients', X|_]) :- flush_output(current_output), write("which nutrition fact would you like to check? (calories, carbohydrates, protein, or fat)\n"), readln(Y), get_macronutrient_info(X, Y, R), write(R), write("g\n").
check_input(['commands'|_]) :- commands, !.
check_input(_) :- write("invalid command\n"), !.

% get the specific macronutrient info of a type of food
get_macronutrient_info(X, [calories | _], R) :- prop(X, calories_per_meal, R).
get_macronutrient_info(X, [carbohydrates|_], R) :- prop(X, carbohydrates_per_meal, R).
get_macronutrient_info(X, [protein|_], R) :- prop(X, protein_per_meal, R).
get_macronutrient_info(X, [fat|_], R) :- prop(X, fat_per_meal, R).

% checks if the user wants to quit
check_exit(['quit' | _ ]) :- !.
check_exit(X) :- check_input(X),  main.

% commands
commands :- write("type 'add' to add a meal\n"),
            write("type 'remove' to remove a meal\n"),
            write("type 'check nutrients <food>' to check specific nutrients of a certain food\n").

% main input loop
main :- write("type 'commands' to get a list of commands or 'quit' to exit\n"), flush_output(current_output), readln(X), check_exit(X).


