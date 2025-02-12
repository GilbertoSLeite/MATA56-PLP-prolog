:- consult('chatbot.pl').
:- consult('db.pl').
:- consult('regras.pl').

% Menu interativo para o usuário
main :-
    write('=== Sistema de Gerenciamento de Projetores ==='), nl,
    write('1. Listar horários disponíveis'), nl,
    write('2. Listar datashows disponíveis'), nl,
    write('3. Listar horários ocupados'), nl,
    write('4. Listar datashows ocupados'), nl,
    write('5. Sair'), nl,
    write('Escolha uma opção: '),
    read(Opcao),
    executar(Opcao),
    main.

% Executa a opção escolhida pelo usuário
executar(1) :-
    write('Digite a data (YYYY-MM-DD): '), read(Data),
    horariosDisponiveisParaAgendamento(Data, Horarios),
    write('Horários disponíveis: '), write(Horarios), nl.

executar(2) :-
    write('Digite a data (YYYY-MM-DD): '), read(Data),
    datashowsDisponiveisParaAgendamento(Data, Datashows),
    write('Datashows disponíveis: '), write(Datashows), nl.

executar(3) :-
    write('Digite a data (YYYY-MM-DD): '), read(Data),
    horariosOcupadosParaAgendamento(Data, Horarios),
    write('Horários ocupados: '), write(Horarios), nl.

executar(4) :-
    write('Digite a data (YYYY-MM-DD): '), read(Data),
    datashowsOcupadosParaAgendamento(Data, Datashows),
    write('Datashows ocupados: '), write(Datashows), nl.

executar(5) :-
    write('Encerrando o sistema.'), nl, halt.

executar(_) :-
    write('Opção inválida. Tente novamente.'), nl.
