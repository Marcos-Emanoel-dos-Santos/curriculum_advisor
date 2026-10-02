# Curriculum Advisor

Sistema desenvolvido em Prolog para representar a grade curricular de um curso universitário.<br>
Estudantes: Alisson Ayres Pereira Martins Silva, Bruna Neves Sbardeloto, Marcos Emanoel dos Santos, Pedro Ferraira Carneiro Maraski

## Pré-requisitos
Para executar o projeto, é necessário ter o interpretador [SWI-Prolog](https://www.swi-prolog.org/) instalado na sua máquina.

## Carregando o projeto
- Abra o terminal na raiz do projeto
- Navegue até a pasta `src`:
```bash
cd src
```
- Inicie o SWI-Prolog (não é necessário -q, embora seja recomendável):
```bash
swipl -q
```
- Carregue o arquivo principal.
```bash
[main].
```

## Consultando o projeto (testes)
Após carregar com sucesso, você tem duas formas de seguir com o sistema:

### Executando Demonstração Automática
O sistema possui um script de demonstração que passa pelas três camadas do projeto (Fatos, Elegibilidade e Trilhas). Digite:
```bash
demo.
```

### Fazendo consultas manuais
Você pode perguntar diretamente ao motor de inferência. Alguns exemplos de uso são:
```bash
disciplinas_liberadas(bruna, Liberadas).
```

```bash
trilha_valida(alisson, 20, Trilha).
```

### Teste de Ciclo (edge case)
Existe um teste isolado que injeta dependências circulares.
Para iniciá-lo, reinicie o SWI-Prolog dentro da pasta de testes e rode:
```bash
?- [ciclos_teste].
?- existe_ciclo(programacao_imperativa).
```

### 

## Fechando a ferramenta
Para fechar o SWI-Prolog pelo terminal, use o comando:
```bash
halt.
```

Assim, retornará ao terminal.
