% forall(Condicao, Acao) verifica se para toda Condicao encontrada, a Acao também é verdadeira.
% Se disciplina não tiver nenhum pré-requisito registrado, o forall é verdadeiro automaticamente (verdade por vacuidade).
prerequisitos_ok(Aluno, Disciplina) :-
    forall(prerequisito(Disciplina, Pre), cursou(Aluno, Pre)).

pode_cursar(Aluno, Disciplina) :-
    disciplina(Disciplina, _, _, _),
    \+ cursou(Aluno, Disciplina),
    prerequisitos_ok(Aluno, Disciplina).



% Encontra todas as disciplinas que o aluno pode_cursar e joga na Lista.
% setof/3 remove automaticamente duplicatas da lista.
% fallback evita que a regra falhe caso o aluno não tenha disciplinas liberadas
disciplinas_liberadas(Aluno, Lista) :-
    setof(D, pode_cursar(Aluno, D), Lista)
    ; Lista = [].


% Agrupa todas as disciplinas que sao obrigatorias e que o aluno ainda não fez
disciplinas_pendentes(Aluno, Lista) :-
    findall(Disc, disciplina(Disc, obrigatoria, _, _), \+ cursou(Aluno, Disc), Lista).


% Descobre quais disciplinas o aluno fez, pega o número de créditos de cada uma, 
% coloca tudo em uma lista de números e depois soma.
creditos_cursados(Aluno, Total) :-
    findall(Creditos, (cursou(Aluno, Disc), disciplina(Disc, _, Creditos, _)), ListaCreditos) ,
    soma_lista(ListaCreditos, Total).


% Predicado auxiliar de soma
soma_lista([], 0).
soma_lista([Cabeca|Cauda], Total) :-
    soma_lista(Cauda, Subtotal) ,
    Total is Cabeca + Subtotal.