% predicados: 
% datashowsDisponíveis(horarioInicio, horarioFim, data) === Alvaro
:- module(regras, [datashowsDisponiveis/4]).

% Base de dados de datashows
:- dynamic datashow/4.

datashowsDisponiveis(HorarioInicio, HorarioFim, Data, DatashowsDisponiveis) :-
    findall(DatashowID, 
            (datashow(DatashowID, HI, HF, Data), 
             \+ horariosOcupados(HI, HF, Data, _),
             HI >= HorarioInicio,
             HF =< HorarioFim), 
            DatashowsDisponiveis).
% horariosOcupados(horarioInicio, horarioFim, data, R) === Uana

horariosOcupados(HorarioInicio, HorarioFim, Data, R) :-
    findall((HI, HF), (datashowsDisponiveis(HI, HF, Data), 
                       HI < HorarioFim, 
                       HF > HorarioInicio), R).

