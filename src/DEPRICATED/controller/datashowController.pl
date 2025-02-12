% src/controllers/DatashowController.pl
:- use_module('../database/datashowDB').

% Criar um novo datashow
new_datashow(Id) :-
    create_datashow(Id).

% Apagar um datashow por ID
erase_datashow(Id) :-
    delete_datashow(Id).