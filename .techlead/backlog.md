# Kairo Payments — Acordos de trabalho & Roadmap

> 📋 **Backlog, status e kanban vivem no GitHub.** [Issues](https://github.com/pedrohsjdev/go-kairo-payments/issues) · [Milestones](https://github.com/pedrohsjdev/go-kairo-payments/milestones)
> Aqui ficam os acordos de engenharia, a narrativa do roadmap e o que não é estado.

**Produto:** Kairo — plataforma de infoprodutos e comunidades pagas.
**Nosso time:** Payments Core. **TL:** Rafael Duarte. **Dev:** você.
**Repo:** `payments-go` · **Início:** 2026-09-19

---

## Roadmap (milestones)

| # | Milestone | Foco | Duração | Competência que estresso |
|---|---|---|---|---|
| **M0** | Fundação | Repo, HTTP, Postgres, testes, CI, ADR-0001 | 1 sem | Programming BASIC |
| **M1** | Checkout & Orders | Modelagem de domínio, máquina de estados, idempotência | 2 sem | Programming + Architecture |
| **M2** | PSP & Webhooks | Integração com gateway, webhook, outbox, consistência | 2 sem | Architecture INTERMEDIATE |
| **M3** | Ledger & Split | Partidas dobradas, comissão, co-produção, afiliado, saldo | 2 sem | Architecture + Product |
| **M4** | Assinaturas & Payouts | Recorrência, dunning, retry, saque | 2 sem | Architecture INTERMEDIATE |
| **M5** | Reconciliação & Observabilidade | Conciliação com PSP, métricas, traces, SLO | 2 sem | Programming INT-2/INT-3 |
| **M6** | Crescimento | Load test, gargalo real, eventos, quebra em microserviços | 4 sem | Architecture INT-1/2/3 |
| **M7** | Produção | Deploy, runbook, incidente simulado | 2 sem | Ownership |

> A migração para microserviços em **M6 só acontece se os dados justificarem**. Se você propuser microserviço antes de ter métrica na mão, eu reprovo. Essa é a diferença entre `ARCH-INT-3` e `ARCH-POOR-3`.

---

## Regras de engenharia (valem desde o primeiro commit)

**Branch:** `feat/KAI-N-descricao` · `fix/KAI-N-...` · `chore/KAI-N-...`
**Commit:** Conventional Commits — `feat(order): adiciona máquina de estados`

**Todo PR precisa de:**
1. **Contexto** — qual problema resolve e por quê.
2. **Decisões** — o que você considerou e descartou. Se não descartou nada, você não decidiu, você aceitou a primeira ideia.
3. **Como testar** — passo a passo.
4. **Risco** — o que pode quebrar em produção.

**Meu SLA de review:** respondo no mesmo dia. PR sem as 4 seções acima eu devolvo sem ler o código.

**Definition of Ready** (minha responsabilidade, não a sua):
Todo ticket daqui em diante declara **Dado** (restrição fechada, não negocie) e **Sua decisão** (é sua, e eu reviso o raciocínio — não a escolha). Se um ticket não separar os dois, **me cobre antes de começar**. Ticket ambíguo é falha minha, e eu não pontuo contra você o que não especifiquei.

**Definition of Done:**
- [ ] `go build ./...` e `go vet ./...` limpos
- [ ] `go test ./...` passando
- [ ] `gofmt` aplicado
- [ ] Cenário principal + pelo menos um caminho de erro testados
- [ ] Você consegue explicar **cada linha** que subiu

---

## Uso de IA no time (acordo firmado em 19/09)

A rubrica da Hubla é clara: usar IA não é problema. `PROG-POOR-5` é *"faz deploy de código gerado por IA sem revisão, de forma descuidada"* — o que reprova é não entender o que subiu, não a ferramenta.

**Você pode me pedir código quando:**
- já entende o conceito e sabe ler o resultado;
- sabe **especificar** o que quer (se o pedido for vago, o problema é que você ainda não entendeu o suficiente);
- é código repetitivo/mecânico e escrever à mão não te ensina nada novo.

**Você não deve me pedir código quando:**
- é a primeira vez que você encosta no conceito;
- é o núcleo de domínio da milestone — é exatamente ali que a avaliação acontece;
- você quer o resultado sem o caminho.

### Trava: prova de leitura

Todo PR que contiver código escrito por mim ganha uma seção extra:

```
## Código do TL
- Arquivo/trecho: <onde>
- Por que pedi: <motivo>
- O que esse código faz, nas minhas palavras: <sua explicação>
- O que eu mudaria se o requisito fosse X: <sua análise>
```

Se a explicação for rasa, eu faço pergunta de acompanhamento. Se você não souber responder, o PR é rejeitado e o código sai. Registro cada ocorrência no `scorecard.csv` — bem usado, vira evidência de `PROG-INT-1` (reduz complexidade acidental); mal usado, vira `PROG-POOR-5`.

---

## Sprint 0 — "Fundação" · 21/09 → 29/09 · capacidade 20–25h  🟢 EM ANDAMENTO

> **Status agora vive no GitHub.** Este arquivo guarda acordos de trabalho e a narrativa do roadmap; quem manda em estado de ticket é a issue.
> Milestone: [M0 — Fundação](https://github.com/pedrohsjdev/go-kairo-payments/milestone/1) · due 29/09

| Issue | Ticket | Prazo | Decisões suas |
|---|---|---|---|
| [#1](https://github.com/pedrohsjdev/go-kairo-payments/issues/1) | Bootstrap do repositório | 21/09 | ✅ entregue · 🟡 4 correções pendentes |
| [#2](https://github.com/pedrohsjdev/go-kairo-payments/issues/2) | Servidor HTTP + config + shutdown | qua 23/09 | estrutura, payload do healthz, env vars, timeout |
| [#3](https://github.com/pedrohsjdev/go-kairo-payments/issues/3) | Logging estruturado + request ID | qui 24/09 | origem do ID, chave de context, **o que não logar** |
| [#4](https://github.com/pedrohsjdev/go-kairo-payments/issues/4) | Postgres + migrations | sex 25/09 | ferramenta, driver, números do pool |
| [#5](https://github.com/pedrohsjdev/go-kairo-payments/issues/5) | Testes + CI | seg 28/09 | linters, o que testar, matriz |
| [#6](https://github.com/pedrohsjdev/go-kairo-payments/issues/6) | ADR-0001: fronteiras do monolito | ter 29/09 | **todas** |
| [#7](https://github.com/pedrohsjdev/go-kairo-payments/issues/7) | Estudo: Tour of Go + LGwT | ter 29/09 | — |

**Fluxo por ticket:**
```bash
gh issue develop 2 --base main --name feat/KAI-2-http-server --checkout
# ... implementa ...
gh pr create --fill --body "Closes #2"
```

---

## Sprint 1 — "Checkout & Orders" · 30/09 → 10/10
*A ser detalhada na review da Sprint 0.* Prévia do escopo: agregado `Order`, máquina de estados de pagamento, `Idempotency-Key` no `POST /checkout`, PSP fake, testes de concorrência.

---

## Backlog (não priorizado)

Migram para issues ao abrir cada milestone.

`KAI-B1` Split de comissão com co-produtores e afiliados · `KAI-B2` Ledger de partidas dobradas · `KAI-B3` Webhook receiver idempotente · `KAI-B4` Transactional outbox · `KAI-B5` Assinaturas recorrentes · `KAI-B6` Dunning e retry policy · `KAI-B7` Payout e saque · `KAI-B8` Reconciliação com extrato do PSP · `KAI-B9` Reembolso e chargeback · `KAI-B10` Antifraude básico · `KAI-B11` Métricas Prometheus + SLO · `KAI-B12` Tracing distribuído · `KAI-B13` Load test e profiling · `KAI-B14` Extração do primeiro microserviço
