:- module(trilhas, [
    prerequisito_transitivo/2,
    existe_ciclo/1,
    trilha_valida/3
]).

% Importa a camada 1 e 2
:- use_module(curriculum).
:- use_module(elegibilidade).

% ----------------------------------------------------------------------
% FECHO TRANSITIVO E CICLOS
% ----------------------------------------------------------------------

% prerequisito_transitivo(D1, D2): D1 depende (direta ou indiretamente) de D2.
prerequisito_transitivo(D1, D2) :-
    prerequisito(D1, D2).

prerequisito_transitivo(D1, D2) :-
    prerequisito(D1, X),
    prerequisito_transitivo(X, D2).

% existe_ciclo(Disciplina): verdadeiro se uma disciplina é pré-requisito dela mesma
existe_ciclo(Disciplina) :- 
    prerequisito_transitivo(Disciplina, Disciplina).


% ----------------------------------------------------------------------
% GERAÇÃO DE TRILHAS
% ----------------------------------------------------------------------

% Resgata o histórico atual do aluno e define o limite de 12 semestres.
trilha_valida(Aluno, MaxCreditos, TrilhaFinal) :-
    findall(D, cursou(Aluno, D), HistoricoInicial),
    simula_semestres(HistoricoInicial, MaxCreditos, 12, [], TrilhaInvertida),
    reverse(TrilhaInvertida, TrilhaFinal).



% --- REGRAS DE SIMULAÇÃO  ---

% Casos base
% O aluno terminou o curso (não tem mais obrigatórias pendentes).
simula_semestres(HistoricoAtual, _, _, TrilhaAcumulada, TrilhaAcumulada) :-
    todas_obrigatorias_cumpridas(HistoricoAtual).

% O limite de semestres chegou a 0 e ele não formou.
simula_semestres(HistoricoAtual, _, 0, _, _) :-
    \+ todas_obrigatorias_cumpridas(HistoricoAtual),
    !, fail. % Corta a busca para evitar loop infinito/explosão combinatória

% Caso recursivo
% Monta UM semestre e avança para o próximo.
simula_semestres(HistoricoAtual, MaxCreditos, SemestresRestantes, TrilhaAcumulada, TrilhaFinal) :-
    SemestresRestantes > 0,
    
    % Descobre o que pode cursar baseado apenas no histórico simulado
    liberadas_simulacao(HistoricoAtual, Liberadas),
    
    % Escolhe uma combinação válida de matérias que respeite os créditos
    escolhe_disciplinas(Liberadas, MaxCreditos, SemestreEscolhido),
    
    % Atualiza o histórico simulado com as matérias escolhidas neste semestre
    append(HistoricoAtual, SemestreEscolhido, NovoHistorico),
    
    % 4. Diminui o contador e vai para o próximo semestre
    NovosRestantes is SemestresRestantes - 1,
    simula_semestres(NovoHistorico, MaxCreditos, NovosRestantes, [SemestreEscolhido|TrilhaAcumulada], TrilhaFinal).



% --- PREDICADOS AUXILIARES PARA A SIMULAÇÃO ---

% Verifica se não existe nenhuma disciplina obrigatória que não esteja no histórico
todas_obrigatorias_cumpridas(Historico) :-
    \+ (disciplina(D, obrigatoria, _, _), \+ member(D, Historico)).

% Descobre o que está liberado usando a lista em memória
liberadas_simulacao(Historico, Liberadas) :-
    setof(D, pode_cursar_simulado(D, Historico), Liberadas), !.
liberadas_simulacao(_, []).

pode_cursar_simulado(D, Historico) :-
    disciplina(D, _, _, _),
    \+ member(D, Historico),
    forall(prerequisito(D, Pre), member(Pre, Historico)).

% Gera combinações de disciplinas que não ultrapassam o limite de créditos do semestre
% (Usa backtracking para gerar várias opções de semestres diferentes)
escolhe_disciplinas(Disponiveis, MaxCreditos, Escolhidas) :-
    subconjunto_valido(Disponiveis, MaxCreditos, _, Escolhidas),
    Escolhidas \= []. % Garante que o aluno pegue pelo menos uma matéria (não perca o semestre)

% Monta subconjuntos somando créditos
subconjunto_valido([], _, 0, []).
subconjunto_valido([D|Resto], MaxCreditos, TotalCreditos, [D|Escolhidas]) :-
    disciplina(D, _, CreditosD, _),
    MaxRestante is MaxCreditos - CreditosD,
    MaxRestante >= 0,
    subconjunto_valido(Resto, MaxRestante, TotalResto, Escolhidas),
    TotalCreditos is CreditosD + TotalResto.
subconjunto_valido([_|Resto], MaxCreditos, TotalCreditos, Escolhidas) :-
    subconjunto_valido(Resto, MaxCreditos, TotalCreditos, Escolhidas).

