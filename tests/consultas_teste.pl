% ==============================================================================
% BATERIA DE TESTES
% Copie as instruções que estão à frente de "?-" e cole no terminal
% ==============================================================================


% ------------------------------------------------------------------------------
% CAMADA 1
% ------------------------------------------------------------------------------

% Teste 1: Listar todas as disciplinas de um semestre sugerido específico (ex: 2º semestre)
% Esperado: Uma lista com resolucao_de_problemas_de_natureza_discreta, arquitetura_de_banco_de_dados, etc.
% ?- findall(Nome, disciplina(Nome, _, _, 2), Disciplinas2Semestre).



% ------------------------------------------------------------------------------
% CAMADA 2
% ------------------------------------------------------------------------------

% Teste 2.1: disciplinas_liberadas e disciplinas_pendentes para a Bruna (aluna adiantada)
% Esperado: A Bruna tem poucas pendentes e as liberadas devem ser disciplinas avançadas.
% ?- disciplinas_liberadas(bruna, LiberadasBruna).
% ?- disciplinas_pendentes(bruna, PendentesBruna).

% Teste 2.2: disciplinas_liberadas e disciplinas_pendentes para o Pedro (aluno atrasado)
% Esperado: O Pedro tem muitas pendentes. Como ele não fez materias base, as liberadas serão limitadas.
% ?- disciplinas_liberadas(pedro, LiberadasPedro).
% ?- disciplinas_pendentes(pedro, PendentesPedro).

% Teste 2.3: O impacto da negação por falha (\+ cursou) 
% Esperado: Pedro não pode cursar programacao_orientada_a_objetos porque falta o pre-requisito, 
% (retorna false).
% ?- pode_cursar(pedro, programacao_orientada_a_objetos).



% ------------------------------------------------------------------------------
% CAMADA 3
% ------------------------------------------------------------------------------

% Teste 3.1: Cadeia de profundidade >= 3
% Esperado: Deve retornar true, provando que a disciplina avançada depende da disciplina de base.
% ?- prerequisito_transitivo(processamento_de_linguagem_natural, resolucao_de_problemas_estruturados_em_computacao).

% Teste 3.2: Trilha válida do zero ate à formatura para o Alisson (aluno ritmo normal)
% Esperado: Uma lista de listas (semestres) detalhando o caminho ate não haver pendentes, 
% respeitando um limite de 20 creditos por semestre.
% ?- trilha_valida(alisson, 20, TrilhaAlisson).

% Teste 3.3: Multiplas trilhas (backtracking) para a Bruna
% Esperado: Ao usar setof ou chamando multiplas vezes, o Prolog deve sugerir caminhos 
% alternativos para a Bruna se formar com as materias que lhe faltam.
% ?- trilha_valida(bruna, 16, TrilhaAlternativa).

% ------------------------------------------------------------------------------
% TESTE DE DETECAO DE CICLO
% ------------------------------------------------------------------------------

% Teste 3.4: Injeção de ciclo na base para testar existe_ciclo/1
% Esperado: Apos inserir um pre-requisito circular, existe_ciclo deve retornar true.
% ?- assertz(prerequisito(raciocinio_algoritmico, programacao_imperativa)).
% ?- existe_ciclo(raciocinio_algoritmico).
% ?- retract(prerequisito(raciocinio_algoritmico, programacao_imperativa)). % Limpa o erro
