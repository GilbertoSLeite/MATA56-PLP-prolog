:- use_module(connection).

# Criar um novo professor
create_professor(Matricula, Nome) :-
    db_connection(Connection),
    sqlite_query(Connection, "INSERT INTO professor (matricula, nome) VALUES (?, ?)", [Matricula, Nome]).

# Ler um professor por matrícula
read_professor_by_matricula(Matricula, Result) :-
    db_connection(Connection),
    sqlite_query(Connection, "SELECT * FROM professor WHERE matricula = ?", [Matricula], Result).

# Ler professor por nome
read_professor_by_name(Nome, Result) :-
    db_connection(Connection),
    sqlite_query(Connection, "SELECT * FROM professor WHERE nome = ?", [Nome], Result).

# Deletar um professor por matrícula
delete_professor(Matricula) :-
    db_connection(Connection),
    sqlite_query(Connection, "DELETE FROM professor WHERE matricula = ?", [Matricula]).