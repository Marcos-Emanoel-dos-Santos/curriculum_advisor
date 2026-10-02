% Declaração de modulo
:- module(curriculum, [disciplina/4, prerequisito/2, cursou/2]).

% SE TIRAR NÃO TEM COMO USAR assertz.
:- dynamic cursou/2.
:- dynamic prerequisito/2.


disciplina(fundamentos_de_sistemas_ciberfisicos, obrigatoria, 4, 1).
disciplina(resolucao_de_problemas_com_logica_matematica, obrigatoria, 4, 1).
disciplina(filosofia, obrigatoria, 4, 1).
disciplina(experiencia_criativa_navegando_na_computacao, obrigatoria, 6, 1).
disciplina(raciocinio_algoritmico, obrigatoria, 6, 1).
disciplina(resolucao_de_problemas_de_natureza_discreta, obrigatoria, 4, 2).
disciplina(arquitetura_de_banco_de_dados, obrigatoria, 6, 2).
disciplina(programacao_imperativa, obrigatoria, 4, 2).
disciplina(programacao_web, obrigatoria, 4, 2).
disciplina(conectividade_em_sistemas_ciberfisicos, obrigatoria, 4, 2).
disciplina(etica, obrigatoria, 2, 2).
disciplina(modelagem_de_fenomenos_fisicos, obrigatoria, 4, 3).
disciplina(experiencia_criativa_criando_solucoes_computacionais, obrigatoria, 6, 3).
disciplina(programacao_orientada_a_objetos, obrigatoria, 6, 3).
disciplina(seguranca_da_informacao, obrigatoria, 4, 3).
disciplina(performance_em_sistemas_ciberfisicos, obrigatoria, 4, 3).
disciplina(clinica_de_tic, obrigatoria, 2, 3).
disciplina(teologia_e_sociedade, obrigatoria, 2, 4).
disciplina(resolucao_de_problemas_estruturados_em_computacao, obrigatoria, 4, 4).
disciplina(programacao_logica_e_funcional, obrigatoria, 4, 4).
disciplina(big_data, obrigatoria, 4, 4).
disciplina(sistemas_operacionais_ciberfisicos, obrigatoria, 4, 4).
disciplina(redes_convergentes, obrigatoria, 4, 4).
disciplina(modelagem_de_sistemas_computacionais, obrigatoria, 4, 4).
disciplina(complexidade_de_algoritmos, obrigatoria, 4, 5).
disciplina(metodos_quantitativos_para_computacao, obrigatoria, 4, 5).
disciplina(resolucao_de_problemas_com_grafos, obrigatoria, 6, 5).
disciplina(metodos_de_pesquisa_cientifica, obrigatoria, 4, 5).
disciplina(experiencia_criativa_inovando_colaborativamente, obrigatoria, 6, 5).
disciplina(aprendizagem_de_maquina, obrigatoria, 4, 6).
disciplina(inteligencia_artificial, obrigatoria, 4, 6).
disciplina(programacao_distribuida, obrigatoria, 4, 6).
disciplina(gestao_de_projetos_e_metodos_ageis, obrigatoria, 6, 6).
disciplina(pesquisa_aplicada, obrigatoria, 4, 6).
disciplina(engenharia_de_software, obrigatoria, 4, 6).
disciplina(construcao_de_interpretadores, obrigatoria, 4, 7).
disciplina(data_science, obrigatoria, 6, 7).
disciplina(construcao_de_software_grafico_3d, obrigatoria, 4, 7).
disciplina(cloud_computing, obrigatoria, 4, 7).
disciplina(arquitetura_de_software, obrigatoria, 4, 7).
disciplina(experiencia_criativa_projeto_transformador_i, obrigatoria, 4, 7).
disciplina(processamento_de_linguagem_natural, obrigatoria, 4, 8).
disciplina(devops, obrigatoria, 4, 8).
disciplina(avaliacao_de_desempenho_de_sistemas, obrigatoria, 4, 8).
disciplina(experiencia_criativa_projeto_transformador_ii, obrigatoria, 4, 8).
disciplina(mundos_virtuais_e_realidade_misturada, obrigatoria, 4, 8).
disciplina(visao_computacional, obrigatoria, 4, 8).
disciplina(libras, eletiva, 4, 3).
disciplina(empreendedorismo_digital, eletiva, 4, 5).
disciplina(desenvolvimento_de_jogos, eletiva, 4, 6).
disciplina(blockchain_e_criptografia, eletiva, 4, 7).
disciplina(topicos_avancados_em_ia, eletiva, 4, 8).


prerequisito(programacao_imperativa, raciocinio_algoritmico).
prerequisito(resolucao_de_problemas_de_natureza_discreta, resolucao_de_problemas_com_logica_matematica).
prerequisito(conectividade_em_sistemas_ciberfisicos, fundamentos_de_sistemas_ciberfisicos).
prerequisito(modelagem_de_fenomenos_fisicos, resolucao_de_problemas_de_natureza_discreta).
prerequisito(programacao_orientada_a_objetos, programacao_imperativa).
prerequisito(performance_em_sistemas_ciberfisicos, fundamentos_de_sistemas_ciberfisicos).
prerequisito(resolucao_de_problemas_estruturados_em_computacao, programacao_orientada_a_objetos).
prerequisito(programacao_logica_e_funcional, resolucao_de_problemas_com_logica_matematica).
prerequisito(seguranca_da_informacao, fundamentos_de_sistemas_ciberfisicos).
prerequisito(experiencia_criativa_criando_solucoes_computacionais, experiencia_criativa_navegando_na_computacao).
prerequisito(big_data, arquitetura_de_banco_de_dados).
prerequisito(sistemas_operacionais_ciberfisicos, performance_em_sistemas_ciberfisicos).
prerequisito(redes_convergentes, conectividade_em_sistemas_ciberfisicos).
prerequisito(complexidade_de_algoritmos, resolucao_de_problemas_estruturados_em_computacao).
prerequisito(metodos_quantitativos_para_computacao, modelagem_de_fenomenos_fisicos).
prerequisito(resolucao_de_problemas_com_grafos, resolucao_de_problemas_estruturados_em_computacao).
prerequisito(aprendizagem_de_maquina, complexidade_de_algoritmos).
prerequisito(inteligencia_artificial, complexidade_de_algoritmos).
prerequisito(inteligencia_artificial, programacao_logica_e_funcional).
prerequisito(programacao_distribuida, redes_convergentes).
prerequisito(programacao_distribuida, sistemas_operacionais_ciberfisicos).
prerequisito(pesquisa_aplicada, metodos_de_pesquisa_cientifica).
prerequisito(data_science, modelagem_de_fenomenos_fisicos).
prerequisito(data_science, big_data).
prerequisito(data_science, metodos_de_pesquisa_cientifica).
prerequisito(arquitetura_de_software, modelagem_de_sistemas_computacionais).
prerequisito(arquitetura_de_software, engenharia_de_software).
prerequisito(construcao_de_interpretadores, resolucao_de_problemas_com_grafos).
prerequisito(construcao_de_software_grafico_3d, modelagem_de_fenomenos_fisicos).
prerequisito(cloud_computing, programacao_distribuida).
prerequisito(experiencia_criativa_projeto_transformador_i, experiencia_criativa_inovando_colaborativamente).
prerequisito(processamento_de_linguagem_natural, inteligencia_artificial).
prerequisito(processamento_de_linguagem_natural, aprendizagem_de_maquina).
prerequisito(devops, engenharia_de_software).
prerequisito(devops, gestao_de_projetos_e_metodos_ageis).
prerequisito(avaliacao_de_desempenho_de_sistemas, metodos_quantitativos_para_computacao).
prerequisito(avaliacao_de_desempenho_de_sistemas, sistemas_operacionais_ciberfisicos).
prerequisito(experiencia_criativa_projeto_transformador_ii, experiencia_criativa_projeto_transformador_i).
prerequisito(mundos_virtuais_e_realidade_misturada, construcao_de_software_grafico_3d).
prerequisito(visao_computacional, aprendizagem_de_maquina).
prerequisito(desenvolvimento_de_jogos, programacao_orientada_a_objetos).
prerequisito(blockchain_e_criptografia, seguranca_da_informacao).
prerequisito(topicos_avancados_em_ia, inteligencia_artificial).


% Marcos e Bruna são adiantados
% Alisson e Pedro estão em ritmo normal
% Akira e João estão atrasados
cursou(marcos, fundamentos_de_sistemas_ciberfisicos).
cursou(marcos, resolucao_de_problemas_com_logica_matematica).
cursou(marcos, raciocinio_algoritmico).
cursou(marcos, resolucao_de_problemas_de_natureza_discreta).
cursou(marcos, arquitetura_de_banco_de_dados).
cursou(marcos, programacao_imperativa).
cursou(marcos, programacao_orientada_a_objetos).
cursou(marcos, resolucao_de_problemas_estruturados_em_computacao).
cursou(marcos, programacao_logica_e_funcional).
cursou(marcos, complexidade_de_algoritmos).
cursou(marcos, aprendizagem_de_maquina).
cursou(marcos, inteligencia_artificial).
cursou(marcos, processamento_de_linguagem_natural).
cursou(marcos, visao_computacional).
cursou(marcos, experiencia_criativa_navegando_na_computacao).
cursou(marcos, filosofia).
cursou(marcos, etica).
cursou(marcos, topicos_avancados_em_ia).
cursou(bruna, fundamentos_de_sistemas_ciberfisicos).
cursou(bruna, resolucao_de_problemas_com_logica_matematica).
cursou(bruna, conectividade_em_sistemas_ciberfisicos).
cursou(bruna, arquitetura_de_banco_de_dados).
cursou(bruna, resolucao_de_problemas_de_natureza_discreta).
cursou(bruna, performance_em_sistemas_ciberfisicos).
cursou(bruna, modelagem_de_fenomenos_fisicos).
cursou(bruna, redes_convergentes).
cursou(bruna, sistemas_operacionais_ciberfisicos).
cursou(bruna, big_data).
cursou(bruna, programacao_distribuida).
cursou(bruna, cloud_computing).
cursou(bruna, metodos_de_pesquisa_cientifica).
cursou(bruna, data_science).
cursou(bruna, raciocinio_algoritmico).
cursou(bruna, programacao_imperativa).
cursou(bruna, programacao_web).
cursou(alisson, fundamentos_de_sistemas_ciberfisicos).
cursou(alisson, resolucao_de_problemas_com_logica_matematica).
cursou(alisson, filosofia).
cursou(alisson, experiencia_criativa_navegando_na_computacao).
cursou(alisson, raciocinio_algoritmico).
cursou(alisson, resolucao_de_problemas_de_natureza_discreta).
cursou(alisson, arquitetura_de_banco_de_dados).
cursou(alisson, programacao_imperativa).
cursou(alisson, programacao_web).
cursou(alisson, conectividade_em_sistemas_ciberfisicos).
cursou(alisson, etica).
cursou(alisson, modelagem_de_fenomenos_fisicos).
cursou(alisson, experiencia_criativa_criando_solucoes_computacionais).
cursou(alisson, programacao_orientada_a_objetos).
cursou(alisson, seguranca_da_informacao).
cursou(alisson, performance_em_sistemas_ciberfisicos).
cursou(alisson, clinica_de_tic).
cursou(alisson, teologia_e_sociedade).
cursou(alisson, resolucao_de_problemas_estruturados_em_computacao).
cursou(alisson, programacao_logica_e_funcional).
cursou(alisson, big_data).
cursou(alisson, sistemas_operacionais_ciberfisicos).
cursou(alisson, redes_convergentes).
cursou(alisson, modelagem_de_sistemas_computacionais).
cursou(alisson, libras).
cursou(alisson, empreendedorismo_digital).
cursou(pedro, fundamentos_de_sistemas_ciberfisicos).
cursou(pedro, resolucao_de_problemas_com_logica_matematica).
cursou(pedro, filosofia).
cursou(pedro, experiencia_criativa_navegando_na_computacao).
cursou(pedro, raciocinio_algoritmico).
cursou(pedro, resolucao_de_problemas_de_natureza_discreta).
cursou(pedro, arquitetura_de_banco_de_dados).
cursou(pedro, programacao_imperativa).
cursou(pedro, programacao_web).
cursou(pedro, conectividade_em_sistemas_ciberfisicos).
cursou(pedro, etica).
cursou(pedro, modelagem_de_fenomenos_fisicos).
cursou(pedro, experiencia_criativa_criando_solucoes_computacionais).
cursou(pedro, programacao_orientada_a_objetos).
cursou(pedro, seguranca_da_informacao).
cursou(pedro, performance_em_sistemas_ciberfisicos).
cursou(pedro, clinica_de_tic).
cursou(pedro, teologia_e_sociedade).
cursou(pedro, resolucao_de_problemas_estruturados_em_computacao).
cursou(pedro, programacao_logica_e_funcional).
cursou(pedro, big_data).
cursou(pedro, sistemas_operacionais_ciberfisicos).
cursou(pedro, redes_convergentes).
cursou(pedro, modelagem_de_sistemas_computacionais).
cursou(akira, fundamentos_de_sistemas_ciberfisicos).
cursou(akira, resolucao_de_problemas_com_logica_matematica).
cursou(akira, filosofia).
cursou(akira, experiencia_criativa_navegando_na_computacao).
cursou(akira, resolucao_de_problemas_de_natureza_discreta).
cursou(akira, arquitetura_de_banco_de_dados).
cursou(akira, programacao_web).
cursou(akira, etica).
cursou(akira, modelagem_de_fenomenos_fisicos).
cursou(akira, experiencia_criativa_criando_solucoes_computacionais).
cursou(akira, performance_em_sistemas_ciberfisicos).
cursou(akira, clinica_de_tic).
cursou(joao, resolucao_de_problemas_com_logica_matematica).
cursou(joao, filosofia).
cursou(joao, experiencia_criativa_navegando_na_computacao).
cursou(joao, arquitetura_de_banco_de_dados).
cursou(joao, programacao_web).
cursou(joao, etica).
cursou(joao, experiencia_criativa_criando_solucoes_computacionais).
cursou(joao, clinica_de_tic).
