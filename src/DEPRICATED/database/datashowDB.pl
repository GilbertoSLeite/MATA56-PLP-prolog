# :- use_module(connection).

:- module(datashowDB, [create_datashow/1, read_all_datashow/1, delete_datashow/1]).

# Criar um novo datashow
create_datashow(Id) :-
  db_connection(Connection),
  sqlite_query(Connection, "INSERT INTO datashow DEFAULT VALUES"),
  sqlite_last_insert_rowid(Connection, Id).

# Ler todos os datashows
read_all_datashow(Result) :-
  db_connection(Connection),
  sqlite_query(Connection, "SELECT * FROM datashow", [], Result).

# Deletar um datashow por ID
delete_datashow(Id) :-
  db_connection(Connection),
  sqlite_query(Connection, "DELETE FROM datashow WHERE id = ?", [Id]).