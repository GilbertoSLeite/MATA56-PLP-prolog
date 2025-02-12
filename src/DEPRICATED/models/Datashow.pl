% Fato pra representar um datashow
% datashow(Id, Modelo).


% Predicado p mostrar informações sobre um datashow
exibir_datashow(Id) :-
    datashow(Id, Modelo),
    format('Datashow ID: ~w~n', [Id]),
    format('Modelo: ~w~n', [Modelo]).
