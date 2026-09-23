# Review — `KAI-1` Bootstrap do repositório

**Data:** 2026-09-21 · **Commits:** `2f91652`, `3bdd685`, `020dcd8` (direto na `main`)
**Veredito:** 🟡 **REQUEST CHANGES** — nada fatal, mas 3 itens saem antes do `KAI-2`.

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
