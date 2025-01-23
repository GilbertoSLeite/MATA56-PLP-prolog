## Objetivo
- Verificar se um datashow está disponível em um determinado dia e horário.
- Exibir mensagens indicando se o datashow está disponível ou onde ele está reservado.

## Como rodar o projeto?

### Requisitos
- SWI-Prolog instalado.

### Passos
1. Abra o terminal e execute o SWI-Prolog:
   ```bash
   swipl
   ```

2. Carregue o arquivo `datashow.pl`:
   ```prolog
   [datashow].
   ```

3. Teste o código com os exemplos abaixo.


#### Verificar Disponibilidade
```prolog
?- verificar_disponibilidade(1, segunda, 10, 12).
```
**Saída esperada**:
```
O datashow não está disponível.
Ele está reservado na sala Sala A com ID 1 no dia segunda das 10 às 12.
```

#### Datashow Disponível
```prolog
?- verificar_disponibilidade(3, terca, 14, 16).
```
**Saída esperada**:
```
O datashow está disponível e está na coordenação do PAF1.
```

## Branches
- Implementação inicial: `feature/atividade-01-20242`
- Correções (se necessário): `bugfix/atividade-01-20242`
