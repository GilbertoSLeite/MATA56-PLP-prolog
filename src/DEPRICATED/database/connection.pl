:- use_module(library(prosqlite)).

:- module(connection, [connect/1, close/0, get_connection/1]).

# Conectar ao banco SQLite e criar tabelas
connect(File) :-
  sqlite_connect(File, Connection, ext(db), [create(once)]),
    assertz(db_connection(Connection)),
    sqlite_query(Connection, "CREATE TABLE IF NOT EXISTS professor (
                  matricula TEXT PRIMARY KEY,
                  nome TEXT);
                  CREATE TABLE IF NOT EXISTS datashow (
                  id INTEGER PRIMARY KEY AUTOINCREMENT);
                  CREATE TABLE IF NOT EXISTS aula (
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  data TEXT,
                  horario TEXT,
                  professor TEXT,
                  datashow INTEGER,
                  FOREIGN KEY (professor) REFERENCES professor(matricula),
                  FOREIGN KEY (datashow) REFERENCES datashow(id));").


close :-
  db_connection(Connection)
  sqlite_disconnect(Connection),
  retract(db_connection(Connection)).

get_connection(Connection) :-
  db_connection(Connection).