:- dynamic alocada/4.  % Agora aloca a sala, o datashow, o horário de início e fim
:- dynamic disponivel/1.

% Definindo os datashows e salas = constantes nomeadas
datashow(d1).
datashow(d2).
datashow(d3).

sala(s1).
sala(s2).
sala(s3).

% Estado inicial de disponibilidade dos datashows
disponivel(d1).
disponivel(d2).
disponivel(d3).

% Regras para alocar datashow com horários
alocar_datashow(Sala, Datashow, Inicio, Fim) :-
   

% Verifica se há conflito de horários com o datashow em qualquer sala
conflito(Datashow, Inicio, Fim) :-
  

% Regras para liberar datashow
desalocar_datashow(Sala, Datashow) :-
   