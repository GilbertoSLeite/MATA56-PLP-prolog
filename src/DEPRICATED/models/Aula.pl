% Fato para representar uma aula
% aula(Id, Data, HorarioInicio, HorarioFim, CodDatashow, CodProfessor).


% Predicado para exibir informações de uma aula
exibir_aula(Id) :-
    aula(Id, Data, HorarioInicio, HorarioFim, CodDatashow, CodProfessor),
    format('Aula ID: ~w~n', [Id]),
    format('Data: ~w~n', [Data]),
    format('Horário de Início: ~w~n', [HorarioInicio]),
    format('Horário de Fim: ~w~n', [HorarioFim]),
    format('Código do Datashow: ~w~n', [CodDatashow]),
    format('Código do Professor: ~w~n', [CodProfessor]).
