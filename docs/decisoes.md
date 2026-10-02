# Decisões de Modelagem e Implementação

## Camada 1

Não houveram decisões de modelagem específicas nesta camada. Os predicados disciplina/4, prerequisito/2 e cursou/2 não têm detalhes específicos de implementação.

## Camada 2

### Uso de setof/3 em vez de findall/3

A escolha por setof/3 em vez de findall/3 no predicado disciplinas_liberadas/2 foi feita intencionalmente para garantir que a lista de retorno seja um conjunto matemático verdadeiro. Ele remove elementos em duplicidade e ordena a lista alfabeticamente de forma automática.<br>
Se fosse utilizado findall/3, os resultados poderiam ser duplicados caso o motor de inferência encontrasse mais de um caminho lógico para validar a disciplina.

## Camada 3

### Não Uso de assert/retract

Optou-se por nãu utilizar assert/retract durante a geração de trilhas no predicado trilha_valida/3. Como o Prolog não desfaz alterações em bases de dados dinâmicas automaticamente durante o backtracking, o uso desses efeitos colaterais exigiria operações manuais propensas a falhas.<br>
A solução adotada foi o uso da variável HistoricoAtual acumulando o estado do aluno recursivamente na memória.

### Perfis de Alunos

Representar um aluno "atrasado" não exigiu criação de novos atributos. A modelagem valeu-se da ausência de fatos cursou/2 em disciplinas fundamentais logo no primeiro período, o que bloqueia a progressão do estudante na cadeia de pré-requisitos pelo simples uso da negação por falha lógica.

# Limitações conhecidas

### Equivalências e Transições Curriculares

A base de dados foi modelada para uma grade estática e, portanto, o sistema não contempla equivalências de disciplinas para alunos pegos em transições de matrizes curriculares ou vindos de outros cursos.

### Performance em Grades Vazias

Embora o limite de 12 semestres previna loops infinitos e explosões de memória, requisitar múltiplas trilhas exaustivamente para um calouro com histórico completamente vazio e teto alto de créditos gerará lentidão, dada a imensidão da árvore de permutações possíveis.

### Ausência de Priorização Estratégica

O predicado escolhe_disciplinas/3 gera subconjuntos válidos que respeitam o limite de créditos do semestre. No entanto, a seleção é arbitrária e o sistema não utiliza heurísticas para priorizar matérias gargalo, o que pode resultar em sugestão de trilhas que demoram mais semestres do que o estritamente necessário.
