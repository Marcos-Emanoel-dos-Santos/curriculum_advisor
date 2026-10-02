:- use_module(curriculum).
:- use_module(elegibilidade).
:- use_module(trilhas).

% Configuração pro Prolog mostrar as listas completas
:- set_prolog_flag(answer_write_options, [quoted(true), portray(true), max_depth(0)]).

demo :-
    write('========================================='), nl,
    write('         DEMONSTRACAO DO SISTEMA         '), nl,
    write('========================================='), nl, nl,

    write('--- CAMADA 1 ----------------------------'), nl,
    
    write('Quais sao as disciplinas obrigatorias do 1o semestre?'), nl,
    findall(Nome, disciplina(Nome, obrigatoria, _, 1), Semestre1),
    write('   -> '), write(Semestre1), nl, nl,
    
    write('Qual e o pre-requisito direto de Programacao Orientada a Objetos?'), nl,
    prerequisito(programacao_orientada_a_objetos, PrePOO),
    write('   -> '), write(PrePOO), nl, nl,

    write('O aluno Marcos ja cursou Raciocinio Algoritmico?'), nl,
    (cursou(marcos, raciocinio_algoritmico) -> write('   -> Sim') ; write('   -> Nao')), nl, nl,


    write('--- CAMADA 2 -----------------------------'), nl,
    
    write('Quais disciplinas estao liberadas para a Bruna (aluna adiantada)?'), nl,
    disciplinas_liberadas(bruna, LibBruna),
    write('   -> '), write(LibBruna), nl, nl,

    write('Quais obrigatorias estao pendentes para o Pedro (aluno atrasado)?'), nl,
    disciplinas_pendentes(pedro, PendPedro),
    write('   -> '), write(PendPedro), nl, nl,

    write('Quantos creditos o Alisson ja cursou no total?'), nl,
    creditos_cursados(alisson, CredAlisson),
    write('   -> '), write(CredAlisson), write(' creditos'), nl, nl,


    write('--- CAMADA 3 ------------------------------'), nl,
    
    write('Pre-requisito transitivo: Inteligencia Artificial depende de Lógica Matemática?'), nl,
    (prerequisito_transitivo(inteligencia_artificial, resolucao_de_problemas_com_logica_matematica) 
        -> write('   -> Sim, indiretamente.') 
        ; write('   -> Nao.')), nl, nl,

    write('A base original possui algum ciclo de dependencia em IA?'), nl,
    (\+ existe_ciclo(inteligencia_artificial) 
        -> write('   -> Nao existem ciclos (Base limpa).') 
        ; write('   -> Ciclo encontrado!')), nl, nl,

    write('Trilha de formatura para o Alisson (Maximo de 20 creditos por semestre):'), nl,
    trilha_valida(alisson, 20, TrilhaAlisson),
    write('   -> Caminho: '), write(TrilhaAlisson), nl, nl,
    
    write('========================================='), nl,
    write('           FIM DA DEMONSTRACAO           '), nl,
    write('========================================='), nl.