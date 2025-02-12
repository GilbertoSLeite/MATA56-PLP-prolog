:- use_module(connection).

:- module(aulaDB, [create_aula/1, read_aula_by_day/2, update_aula/1, delete_aula/1]).

# Criar uma nova aula
create_aula(Aula) :-
  db_connection(Connection),
  sqlite_query(Connection,
      "INSERT INTO aula (data, horario, professor, datashow) VALUES (?, ?, ?, ?)",
      [Aula.data, Aula.horario, Aula.professor, Aula.datashow]).

# Ler aulas por data
read_aula_by_day(Data, Result) :-
    db_connection(Connection),
    sqlite_query(Connection,
        "SELECT * FROM aula WHERE data = ?",
        [Data],
        Result).

# Atualizar uma aula existente
update_aula(Aula) :-
    db_connection(Connection),
    sqlite_query(Connection,
        "UPDATE aula SET data = ?, horario = ?, professor = ?, datashow = ? WHERE id = ?",
        [Aula.data, Aula.horario, Aula.professor, Aula.datashow, Aula.id]).

# Deletar uma aula por ID
delete_aula(Id) :-
    db_connection(Connection),
    sqlite_query(Connection, "DELETE FROM aula WHERE id = ?", [Id]).