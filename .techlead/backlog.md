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

## M0 em modo micro-sprint · 25/11 → 20/12  🟢 EM ANDAMENTO

> **Acordo de 25/11/2026.** Três planos por data falharam. O problema era o dimensionamento, não a pessoa: sprint de uma semana com 5 tickets não sobrevive a uma agenda instável.
> **Novo formato:** 1 ticket por semana, dimensionado para **3–5h**, prazo fechando **no domingo** para o fim de semana contar.
> Previsibilidade está **suspensa como critério** até existir uma baseline — ver `README.md`.
> Conforme a entrega acelerar, a gente comprime as datas.

| Micro-sprint | Issue | Ticket | Entrega |
|---|---|---|---|
| **MS1** | [#2](https://github.com/pedrohsjdev/go-kairo-payments/issues/2) | HTTP + config + graceful shutdown | **dom 29/11** |
| **MS2** | [#5](https://github.com/pedrohsjdev/go-kairo-payments/issues/5) | Testes + CI | dom 06/12 |
| **MS3** | [#3](https://github.com/pedrohsjdev/go-kairo-payments/issues/3) | Logging estruturado + request ID | dom 13/12 |
| **MS4** | [#6](https://github.com/pedrohsjdev/go-kairo-payments/issues/6) | ADR-0001: fronteiras do monolito | dom 20/12 |
| — | [#7](https://github.com/pedrohsjdev/go-kairo-payments/issues/7) | `docs/go-notes.md` | contínuo, sem data |
| — | [#4](https://github.com/pedrohsjdev/go-kairo-payments/issues/4) | Postgres + migrations | movido para a M1 |

**Regra de uma só:** nunca mais de um ticket aberto por vez. Se a semana render, você puxa o próximo — não pego dois de uma vez.

**M1 em diante:** M1 fecha 31/01. M2–M7 têm data provisória e são recalibradas ao fechar a M1, com velocidade real medida em vez de estimada.

---

## M1 — "Checkout & Orders" · a detalhar na review da M0
*A ser detalhada na review da Sprint 0.* Prévia do escopo: agregado `Order`, máquina de estados de pagamento, `Idempotency-Key` no `POST /checkout`, PSP fake, testes de concorrência.

---

## Backlog (não priorizado)

Migram para issues ao abrir cada milestone.

`KAI-B1` Split de comissão com co-produtores e afiliados · `KAI-B2` Ledger de partidas dobradas · `KAI-B3` Webhook receiver idempotente · `KAI-B4` Transactional outbox · `KAI-B5` Assinaturas recorrentes · `KAI-B6` Dunning e retry policy · `KAI-B7` Payout e saque · `KAI-B8` Reconciliação com extrato do PSP · `KAI-B9` Reembolso e chargeback · `KAI-B10` Antifraude básico · `KAI-B11` Métricas Prometheus + SLO · `KAI-B12` Tracing distribuído · `KAI-B13` Load test e profiling · `KAI-B14` Extração do primeiro microserviço
