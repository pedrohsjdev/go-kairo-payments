# Review — `KAI-1` Bootstrap do repositório

**Data:** 2026-09-21 · **Commits:** `2f91652`, `3bdd685`, `020dcd8` (direto na `main`)
**Veredito:** 🟡 REQUEST CHANGES → 🟡 REQUEST CHANGES → ✅ **APPROVED** (22/09). Histórico completo abaixo.

## Verificado

| Check | Resultado |
|---|---|
| `go build ./...` | ✅ |
| `go vet ./...` | ✅ limpo |
| `go test ./...` | ✅ passa |
| `gofmt -l .` | ✅ sem diff |
| `golangci-lint` | ✅ instalado (v2.13.2) |
| `make help` | ❌ **trava o terminal** |

---

## 🔴 Bloqueantes

### 1. Binário de 2.4MB commitado e já no remote
`go-kairo-payments` (ELF, 2.405.877 bytes) está rastreado no HEAD. O `.gitignore` cobre `*.exe`, `*.so`, `*.dylib` — mas o artefato que o **seu próprio Makefile** produz na raiz não está lá.

Faltou fechar o laço: você escreveu o alvo `build`, rodou, e não conferiu o `git status` antes do `add`.

**Ponto que vale mais que o bug:** `git rm --cached` remove do índice mas **não remove do histórico**. O blob continua no `.git` e em quem já clonou. Esse é exatamente o mecanismo pelo qual credencial vazada continua vazada depois do "commit de remoção". Como você está sozinho, no dia 1 e com 3 commits, dá pra reescrever limpo.

### 2. `make help` trava o terminal
```make
@sed -n 's/^##//p' $(MAKEFILE) | column -t -s ':'
```
`$(MAKEFILE)` não existe em Make — provei rodando: expande para vazio. `sed` sem arquivo lê **stdin**, então o alvo fica pendurado até `Ctrl+D`. A variável correta é `$(MAKEFILE_LIST)`.

Classifiquei como `PROG-POOR-3` (bug facilmente evitável) porque a validação era executar o alvo **uma vez**. Um POOR isolado não é problema; o hábito de não rodar o que escreveu é.

### 3. Module path não corresponde ao repositório
```
module github.com/go-kairo-payments/setup
```
O repo é `github.com/pedrohsjdev/go-kairo-payments`. Dois defeitos: o path não resolve (`go get` quebra) e o sufixo `/setup` não significa nada — era o nome da tarefa, não do módulo.

Isso contamina **todo import interno futuro**: `github.com/go-kairo-payments/setup/internal/order`. Custa 30 segundos agora com 2 arquivos; custa um `sed` em tudo depois de 50.

---

## 🟡 Atenção

### 4. `Example()` chamando `main()` vira deadlock no KAI-2
```go
func Example() { main(); /* Output: Hello, World! */ }
```
A intenção estava certa — provar que o harness roda. A construção não: no `KAI-2` o `main()` vira servidor HTTP bloqueante e esse teste **pendura o `go test` para sempre**. Some com ele quando houver comportamento real pra testar.

### 5. README descreve software que não existe
Diz "API HTTP", "processamento de transações", "inicia o servidor HTTP imediatamente". O binário imprime `Hello, World!`. E `git clone https://github.com` está truncado.

Parece detalhe, mas é `PROD-BAS-2`: README é interface com outro humano. Documente o que **existe**; o que se pretende vai em roadmap, com essa palavra.

---

## 🟢 Nits

- **`cmd/main.go` → `cmd/kairo-api/main.go`.** Vamos ter um segundo binário (worker de outbox/dunning na M2/M4). `cmd/<app>/main.go` é a convenção e evita a mudança depois.
- **`make test` sem `-race`.** Em pagamentos, concorrência é o assunto. `-race` deveria ser default no alvo de teste.
- **`run: build` faz `chmod +x`.** `go build` já entrega executável. Linha morta.
- **README pede Go 1.20+, `go.mod` exige 1.26.1.**

---

## O que ficou bom

- **O Makefile está acima do nível de quem começou Go há dois dias.** `.PHONY` declarado corretamente, variáveis extraídas, alvos coerentes, `all: lint test build` na ordem certa, e o padrão self-documenting via `##`. Você foi atrás de algo que a maioria só copia.
- **`gofmt`, `go vet` e lint limpos** sem eu pedir.
- **Conventional Commits** aplicados desde o primeiro commit.
- **Você perguntou sobre branching antes de executar.** Registrei como `PROG-INT-4`. Trazer decisão estrutural para discussão em vez de apresentar fato consumado é comportamento de Senior, e é o sinal mais forte deste ticket.

---

## Ações antes do `KAI-2`

- [ ] Remover o binário do histórico e ignorar o artefato de build
- [ ] Corrigir `$(MAKEFILE)` → `$(MAKEFILE_LIST)` e **rodar todos os alvos**
- [ ] Corrigir o module path
- [ ] Ajustar o README para o estado real

---

# Re-review — 22/09

Commits `f1cfdfc`, `9edf6d3`, `8205a71`. Build, vet, test e gofmt limpos.

## ✅ Fechados

| # | Item | Verificação |
|---|---|---|
| 1 | Binário fora do versionamento | `bin/` ignorado, `TARGET=bin/$(BINARY_NAME)` — boa solução, melhor que ignorar nome solto |
| 2 | `make help` | roda e lista os 6 alvos |
| 3 | Module path | `github.com/pedrohsjdev/go-kairo-payments` |
| 5 | URL de clone | completa |
| — | `cmd/api/main.go` | **nit adotado sem eu cobrar** |

## 🔴 Novo: `make clean` está quebrado

```make
clean:
	rm -f bin          # bin virou diretório
```

```
rm: cannot remove 'bin': Is a directory
make: *** [Makefile:38: clean] Error 1
```

`rm` sem `-r` recusa diretório. O alvo **aborta com erro**, o binário sobrevive, e o `go clean -testcache` da linha seguinte nunca executa.

**O bug é de um caractere. O padrão não.** É a segunda vez no mesmo ticket que um alvo do Makefile é escrito e não executado — `make help` foi exatamente isso. Registrado como reincidência de `PROG-POOR-3`, peso 2.

Regra daqui pra frente: **alvo que você tocou, alvo que você roda antes do commit.**

## 🟡 Continuam abertos

- **`Example()` chamando `main()`** — urgente agora, não no KAI-2. Detalhe em `docs`/resposta do TL.
- **README linha 34** — ainda promete "inicia o servidor HTTP imediatamente". Falta separar o que funciona do que é roadmap.
- Nits: `chmod +x` morto, `-race` ausente (esse o KAI-5 cobre), pré-requisito diz Go 1.20 e o `go.mod` exige 1.26.1.

## Para fechar

- [ ] `rm -f bin` → `rm -rf bin`, **e rodar `make clean`**
- [ ] Remover `cmd/api/main_test.go`
- [ ] README: seção de status

---

# 3ª rodada — ✅ APPROVED (22/09)

Commits `614f9e2`, `548dd24`, `535490b`.

| Verificação | Resultado |
|---|---|
| `make build` / `test` / `lint` / `clean` / `help` | ✅ os 5 executam sem erro |
| `make clean` remove `bin/` de fato | ✅ |
| `go vet` · `gofmt` · `golangci-lint` | ✅ 0 issues |
| `cmd/api/main_test.go` | ✅ removido |
| README | ✅ aviso de estado adicionado |

**Nit remanescente (não bloqueia):** o aviso `API em construção... Ainda não existe servidor HTTP` está imediatamente antes de `### 3. Executar a API — Compila o projeto e inicia o servidor HTTP imediatamente`. Resolve a ambiguidade, mas contradiz a linha seguinte. Quando o `KAI-2` entregar o servidor, some com o aviso e o texto fica correto sozinho.

**Saldo do ticket:** 5 HIT · 4 MISS · 1 anulado.
Destaques positivos: `TARGET=bin/` foi solução melhor que a que o TL propôs; nit `cmd/api/` adotado sem cobrança; três pendências fechadas em uma rodada sem atrito.
Destaque negativo: reincidência de alvo escrito e não executado (`make help`, depois `make clean`).
