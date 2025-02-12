% Fatos e regras para os controladores (simulando operações com banco de dados).
:- dynamic professor/2, datashow/2, aula/5.
:- module(view, [show_professor/1, show_datashow/1, show_aula/1, log/1, show_menu/0, handle_input/0]).
% show_professor/1
show_professor(professor(Nome, Matricula)) :-
    writeln("=== Detalhes do Professor ==="),
    format("Nome: ~w~n", [Nome]),
    format("Matrícula: ~w~n", [Matricula]),
    writeln("=============================").

% show_datashow/1
show_datashow(datashow(ID, Disponivel)) :-
    writeln("=== Detalhes do Datashow ==="),
    format("ID: ~w~n", [ID]),
    format("Disponível: ~w~n", [Disponivel]),
    writeln("=============================").

% show_aula/1
show_aula(aula(ID, Professor, Data, Inicio, Fim)) :-
    writeln("=== Detalhes da Aula ==="),
    format("ID: ~w~n", [ID]),
    format("Professor: ~w~n", [Professor]),
    format("Data: ~w~n", [Data]),
    format("Horário de Início: ~w~n", [Inicio]),
    format("Horário de Fim: ~w~n", [Fim]),
    writeln("========================").

% log/1
log(Message) :- writeln(Message).

% show_menu/0
show_menu :-
    writeln("=== Menu Principal ==="),
    writeln("1. Adicionar Professor"),
    writeln("2. Remover Professor"),
    writeln("3. Listar Professores"),
    writeln("4. Adicionar Datashow"),
    writeln("5. Remover Datashow"),
    writeln("6. Listar Datashows"),
    writeln("7. Criar Aula"),
    writeln("8. Listar Aulas"),
    writeln("9. Atualizar Aula"),
    writeln("10. Remover Aula"),
    writeln("11. Sair"),
    writeln("Escolha uma opção:").

% handle_input/1
handle_input("1") :-
    log("Digite o nome do professor:"),
    read_line_to_string(user_input, Nome),
    log("Digite a matrícula:"),
    read_line_to_string(user_input, Matricula),
    assertz(professor(Nome, Matricula)),
    log("Professor adicionado!").
handle_input("2") :-
    log("Digite a matrícula do professor para remover:"),
    read_line_to_string(user_input, Matricula),
    retract(professor(_, Matricula)),
    log("Professor removido!").
handle_input("3") :-
    log("Lista de Professores:"),
    forall(professor(Nome, Matricula), show_professor(professor(Nome, Matricula))).
handle_input("4") :-
    log("Adicionando Datashow."),
    assertz(datashow(1, true)), % Exemplo: Adiciona datashow com ID 1.
    log("Datashow adicionado!").
handle_input("5") :-
    log("Digite o ID do datashow para remover:"),
    read_line_to_string(user_input, IDStr),
    atom_number(IDStr, ID),
    retract(datashow(ID, _)),
    log("Datashow removido!").
handle_input("6") :-
    log("Lista de Datashows:"),
    forall(datashow(ID, Disponivel), show_datashow(datashow(ID, Disponivel))).
handle_input("7") :-
    log("Digite a matrícula do professor:"),
    read_line_to_string(user_input, Matricula),
    log("Digite a data da aula:"),
    read_line_to_string(user_input, Data),
    log("Digite o horário de início:"),
    read_line_to_string(user_input, Inicio),
    log("Digite o horário de término:"),
    read_line_to_string(user_input, Fim),
    assertz(aula(1, Matricula, Data, Inicio, Fim)), % Exemplo: ID fixo como 1.
    log("Aula criada!").
handle_input("8") :-
    log("Lista de Aulas:"),
    forall(aula(ID, Professor, Data, Inicio, Fim), show_aula(aula(ID, Professor, Data, Inicio, Fim))).
handle_input("9") :- log("Função de atualizar aulas não implementada ainda.").
handle_input("10") :- log("Função de remover aulas não implementada ainda.").
handle_input("11") :- log("Saindo do programa."), halt.
handle_input(_) :- log("Opção inválida.").

% main_loop/0
main_loop :-
    repeat,
    show_menu,
    read_line_to_string(user_input, Choice),
    handle_input(Choice),
... (1 linha)