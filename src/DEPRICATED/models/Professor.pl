% Fato para representar um professor
% professor(Nome, Matricula).



% Predicado para exibir informações sobre um professor
exibir_professor(Nome) :-
    professor(Nome, Matricula),
    format('Professor: ~w~n', [Nome]),
    format('Matrícula: ~w~n', [Matricula]).