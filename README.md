# MATA56-PLP-prolog
# README - Sistema de Alocação de Datashows

## Descrição

Este sistema foi desenvolvido em **Prolog** para gerenciar a alocação de datashows em salas de aula, evitando conflitos e garantindo que cada sala tenha no máximo um datashow alocado por vez. O sistema também implementa um **gerenciamento de filas**, permitindo que requisições de alocação e desalocação sejam processadas conforme os recursos fiquem disponíveis.

## Funcionalidades

### 1. **Alocação de Datashows**

- Permite alocar um datashow para uma sala específica, em um horário definido.
- Verifica se a sala está disponível e se não há conflito de horários com outras alocações.

### 2. **Desalocação de Datashows**

- Permite liberar um datashow de uma sala, tornando-o disponível para novas alocações.
- Após a desalocação, as requisições em fila são processadas automaticamente.

### 3. **Gerenciamento de Filas**

- Requisições de alocação e desalocação são adicionadas a uma fila.
- O sistema processa a fila assim que os recursos ficam disponíveis.

### 4. **Consulta de Alocações**

- Permite consultar todas as alocações atuais de datashows nas salas, incluindo seus horários de início e fim.

## Requisitos

- Interpretador **SWI-Prolog** instalado no sistema.

## Como Executar

1. **Abra o SWI-Prolog**.
2. **Carregue o arquivo** contendo o código-fonte:
   ```prolog
   ?- [nome_do_arquivo].
   ```
3. **Inicialize o sistema**:
   ```prolog
   ?- inicializar_disponibilidade.
   ```

## Como Usar

### 1. Adicionar Requisições à Fila

#### **Alocar Datashow**

```prolog
?- adicionar_fila(alocar_datashow(s1, d1, 08:00, 10:00)).
```

Saída esperada:

```
Requisição alocar_datashow(s1, d1, 08:00, 10:00) adicionada à fila.
Processando requisição: alocar_datashow(s1, d1, 08:00, 10:00).
Datashow d1 alocado para a sala s1 de 08:00 até 10:00.
```

#### **Desalocar Datashow**

```prolog
?- adicionar_fila(desalocar_datashow(s1, d1)).
```

Saída esperada:

```
Requisição desalocar_datashow(s1, d1) adicionada à fila.
Processando requisição: desalocar_datashow(s1, d1).
Datashow d1 liberado da sala s1.
```

### 2. Consultar Alocações

Para verificar todas as alocações ativas:

```prolog
?- consultar_alocacoes.
```

Saída esperada (exemplo):

```
Alocações: [(s1, d1, 08:00, 10:00), (s2, d2, 10:00, 12:00)].
```

## Exemplo de Execução

```prolog
?- inicializar_disponibilidade.
?- adicionar_fila(alocar_datashow(s1, d1, 08:00, 10:00)).
?- adicionar_fila(alocar_datashow(s2, d2, 10:00, 12:00)).
?- consultar_alocacoes.
?- adicionar_fila(desalocar_datashow(s1, d1)).
?- consultar_alocacoes.
```

## Considerações

- O sistema impede que uma sala tenha mais de um datashow simultaneamente.
- Apenas datashows disponíveis podem ser alocados não permitindo a alocação de dashows já ocupados.
- O gerenciamento de filas assegura que as requisições sejam processadas em ordem.
- As alocações podem ser consultadas a qualquer momento.



