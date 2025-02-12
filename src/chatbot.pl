% Predicado para listar os horários disponíveis para agendamento em uma determinada data
horariosDisponiveisParaAgendamento(Data, HorariosDisponiveis) :-
    findall((HI, HF), 
            (datashowsDisponiveis(HI, HF, Data), 
             \+ horariosOcupados(HI, HF, Data, _)), 
            HorariosDisponiveis).
% Lista os datashows disponíveis para agendamento em uma determinada data.
datashowsDisponiveisParaAgendamento(Data, DatashowsDisponiveis) :-
    findall(_, 
            (datashowsDisponiveis(_, _, Data)), 
            DatashowsDisponiveis).

% Predicado para listar os horários ocupados em uma determinada data
horariosOcupadosParaAgendamento(Data, HorariosOcupados) :-
    findall((HI, HF, Datashow), horariosOcupados(HI, HF, Data, Datashow), HorariosOcupados).

% Predicado para listar os datashows ocupados em uma determinada data
datashowsOcupadosParaAgendamento(Data, DatashowsOcupados) :-
    findall(Datashow, horariosOcupados(_, _, Data, Datashow), DatashowsOcupados).

% Predicado para listar os datashows ocupados em uma determinada data
datashowsOcupadosParaAgendamento(Data, DatashowsOcupados) :-
    findall(Datashow, horariosOcupados(_, _, Data, Datashow), DatashowsOcupados).

% Hello World output
hello_world :-
    write('Hello, World!').

% Run hello_world when the script is executed
:- initialization(hello_world).

