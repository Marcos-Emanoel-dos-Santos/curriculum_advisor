:- use_module('../src/curriculum').
:- use_module('../src/trilhas').

% No curriculum.pl exite um 'prerequisito(programacao_imperativa, raciocinio_algoritmico).'
:- assertz(prerequisito(raciocinio_algoritmico, programacao_imperativa)).

% Para testar, rode: ?- existe_ciclo(programacao_imperativa).
