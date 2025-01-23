
% Define os datashows disponíveis
datashow(1).
datashow(2).
datashow(3).

% Define as alocações já realizadas
% alocacao(IDdatashow, Dia, HoraInicio, HoraFim, Sala)
alocacao(1, segunda, 10, 12, 'Sala A'). % Datashow 1 está reservado na segunda das 10h às 12h na Sala A
alocacao(2, segunda, 14, 16, 'Sala B'). % Datashow 2 está reservado na segunda das 14h às 16h na Sala B

% Verifica a disponibilidade de um datashow
verificar_disponibilidade(IDdatashow, Dia, HoraInicio, HoraFim) :-
    ( disponivel(IDdatashow, Dia, HoraInicio, HoraFim) ->
        write('O datashow está disponível e está na coordenação do PAF1.'), nl
    ; 
        alocacao(IDdatashow, Dia, HI, HF, Sala),
        write('O datashow não está disponível.'), nl,
        write('Ele está reservado na sala '), write(Sala),
        write(' com ID '), write(IDdatashow),
        write(' no dia '), write(Dia),
        write(' das '), write(HI), write(' às '), write(HF), write('.'), nl
    ).

% Disponibilidade do datashow
% Disponível se não houver alocação no intervalo solicitado
disponivel(IDdatashow, Dia, HoraInicio, HoraFim) :-
    datashow(IDdatashow),
    \+ (alocacao(IDdatashow, Dia, HI, HF, _),
        HoraInicio < HF, HoraFim > HI).
