:- module(trilhas, [
    depende_de/2,
    cadeia_dependencia/3,
    materia_libera/2,
    disciplinas_liberadas_futuras/2,
    trilha_para_disciplina/3,
    proximo_semestre_sugerido/3
]).

% Importa a camada 1 e 2 caso executado isoladamente
:- use_module(curriculum).
:- use_module(elegibilidade).

% depende_de(D1, D2): D1 depende (direta ou indiretamente) de D2.
% Caso Base: D1 tem D2 como pré-requisito direto.
depende_de(D1, D2) :-
    prerequisito(D1, D2).

depende_de(D1, D2) :-
    prerequisito(D1, X),
    depende_de(X, D2).

% materia_libera(D1, D2): O inverso de depende_de/2.
% D1 é pré-requisito (direto ou indireto) de D2.
materia_libera(D1, D2) :-
    depende_de(D2, D1).

% cadeia_dependencia(Origem, Destino, Caminho)
% Retorna a lista ORDENADA de disciplinas no caminho de dependência.
cadeia_dependencia(Origem, Destino, Caminho) :-
    caminho_rec(Origem, Destino, [Origem], CaminhoInvertido),
    reverse(CaminhoInvertido, Caminho).

caminho_rec(Origem, Destino, Visitados, [Destino|Visitados]) :-
    prerequisito(Destino, Origem).

caminho_rec(Origem, Destino, Visitados, Caminho) :-
    prerequisito(X, Origem),
    \+ member(X, Visitados),
    caminho_rec(X, Destino, [X|Visitados], Caminho).

% disciplinas_liberadas_futuras(Disciplina, ListaFuturas)
% Identifica todas as disciplinas do curso que seriam destravadas (direta ou
% indiretamente) após concluir 'Disciplina'.
disciplinas_liberadas_futuras(Disciplina, ListaFuturas) :-
    findall(D, materia_libera(Disciplina, D), ListaBruta),
    sort(ListaBruta, ListaFuturas).

% trilha_para_disciplina(Aluno, Alvo, Trilha)
% Gera uma sequência (passos/semestres) de disciplinas que o aluno precisa cursar
% até conseguir liberar e cursar a disciplina Alvo.
trilha_para_disciplina(Aluno, Alvo, Trilha) :-
    \+ cursou(Aluno, Alvo),
    resolve_trilha(Aluno, Alvo, [], Trilha).

% Caso Base: Se a disciplina já pode ser cursada agora, a trilha é só ela.
resolve_trilha(Aluno, Alvo, _, [Alvo]) :-
    pode_cursar(Aluno, Alvo).

% Caso Recursivo: Se faltam pré-requisitos, descobre qual precisa fazer primeiro.
resolve_trilha(Aluno, Alvo, Visitados, [Prox | RestoTrilha]) :-
    \+ pode_cursar(Aluno, Alvo),
    prerequisito(Alvo, Pre),
    \+ cursou(Aluno, Pre),
    \+ member(Pre, Visitados),
    resolve_trilha(Aluno, Pre, [Pre|Visitados], SubTrilha),
    last(SubTrilha, Prox),
    resolve_trilha(Aluno, Alvo, [Prox|Visitados], RestoTrilha).

% proximo_semestre_sugerido(Aluno, MaxCreditos, DisciplinasSugeridas)
% Seleciona um subconjunto de disciplinas liberadas sem ultrapassar MaxCreditos.
proximo_semestre_sugerido(Aluno, MaxCreditos, DisciplinasSugeridas) :-
    disciplinas_liberadas(Aluno, Liberadas),
    seleciona_disciplinas(Liberadas, MaxCreditos, 0, [], DisciplinasSugeridas).

seleciona_disciplinas([], _, _, Acc, Acc).
seleciona_disciplinas([D|Resto], MaxCreditos, CreditosAtuais, Acc, Resultado) :-
    disciplina(D, _, CreditosD, _),
    NovoTotal is CreditosAtuais + CreditosD,
    NovoTotal =< MaxCreditos,
    seleciona_disciplinas(Resto, MaxCreditos, NovoTotal, [D|Acc], Resultado).
seleciona_disciplinas([_|Resto], MaxCreditos, CreditosAtuais, Acc, Resultado) :-
    seleciona_disciplinas(Resto, MaxCreditos, CreditosAtuais, Acc, Resultado).