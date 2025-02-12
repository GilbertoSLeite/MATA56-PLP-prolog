% src/controllers/AulaController.pl
:- use_module('../database/aulaDB').
:- use_module('../database/datashowDB').

% Criar uma nova aula
new_aula(MatriculaProfessor, Data, HorarioInicio, HorarioFim) :-
    create_aula(aula{data: Data, horario: HorarioInicio-HorarioFim, professor: MatriculaProfessor, datashow: null}).

% Obter datashows disponíveis para uma aula
get_available_datashow_for_aula(Aula, AvailableDatashows) :-
    read_all_datashow(AllDatashows),
    get_busy_datashows(Aula.data, Aula.horario, BusyDatashows),
    subtract(AllDatashows, BusyDatashows, AvailableDatashows).

% Atribuir um datashow a uma aula
put_datashow_in_aula(DatashowId, AulaId) :-
    update_aula_datashow(DatashowId, AulaId).
