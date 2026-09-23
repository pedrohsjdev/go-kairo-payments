# Curadoria de estudo — tudo gratuito

> Regra da nossa dinâmica: **você trava → estuda aqui → só depois me chama.**
> Quando me chamar, chegue com "li X, entendi Y, travei em Z". Isso muda a qualidade da resposta que eu te dou.

---

## Trilha 1 — Go, fundamento (semanas 1–2, obrigatório)

Nessa ordem. Não pule.

1. **[A Tour of Go](https://go.dev/tour/)** — 3–4h. Faça *todos* os exercícios, sem IA. Especialmente os de `interfaces`, `goroutines` e `channels`.
2. **[Learn Go with Tests](https://quii.gitbook.io/learn-go-with-tests)** ⭐ — o melhor recurso gratuito de Go que existe. Ensina a linguagem *através* de TDD, que é exatamente o hábito que quero de você. Foque em: "Structs, methods & interfaces", "Errors", "Maps", "Dependency Injection", "Mocking", "Context", "Sync", "Select".
3. **[Effective Go](https://go.dev/doc/effective_go)** — leitura de referência. Volte nela sempre.
4. **[Go by Example](https://gobyexample.com/)** — consulta rápida de sintaxe. Use como dicionário, não como curso.
5. **[Go Proverbs](https://go-proverbs.github.io/)** — 20 min. Cada frase ali é uma decisão de design da linguagem. Você vai me ouvir citar isso em review.

## Trilha 2 — Go idiomático e code review (contínuo)

- **[Go Code Review Comments](https://go.dev/wiki/CodeReviewComments)** — a lista oficial do que reprova num review de Go. **Leia antes do seu primeiro PR.**
- **[Google Go Style Guide](https://google.github.io/styleguide/go/)** — decisões de estilo com o *porquê* explicado.
- **[Uber Go Style Guide](https://github.com/uber-go/guide/blob/master/style.md)** — mais prático e opinativo. Ótimo em performance e armadilhas.
- **[100 Go Mistakes](https://100go.co/)** ⭐ — versão web gratuita. Leia os capítulos de *error handling*, *concurrency* e *testing*.
- **[Practical Go — Dave Cheney](https://dave.cheney.net/practical-go/presentations/qcon-china.html)** — nomeação, pacotes, APIs, tratamento de erro. Denso e excelente.
- **[The Go Blog](https://go.dev/blog/)** — leituras obrigatórias: [errors are values](https://go.dev/blog/errors-are-values), [error wrapping (1.13)](https://go.dev/blog/go1.13-errors), [context](https://go.dev/blog/context), [pipelines](https://go.dev/blog/pipelines), [routing enhancements](https://go.dev/blog/routing-enhancements).
- **[Rob Pike — Concurrency is not Parallelism](https://www.youtube.com/watch?v=oV9rvDllKEg)** — 30 min. Conceitual, muda sua cabeça.

## Trilha 3 — Go aplicado ao nosso stack

- **[Accessing databases](https://go.dev/doc/database/)** — `database/sql`, connection pool, `context`. Pool mal configurado é causa-raiz clássica de incidente.
- **[pgx](https://github.com/jackc/pgx)** — driver/pool Postgres que vamos usar.
- **[golangci-lint](https://golangci-lint.run/)** — nosso portão de qualidade no CI.
- **[Testcontainers for Go](https://golang.testcontainers.org/)** — teste de integração com Postgres real.
- **[Profiling Go programs (pprof)](https://go.dev/blog/pprof)** — vamos usar de verdade na milestone de escala.

> ⚠️ **[golang-standards/project-layout](https://github.com/golang-standards/project-layout)**: você vai achar em todo tutorial. Leia com ceticismo — **não é padrão oficial** e a comunidade Go diverge bastante dele. Se você copiar `pkg/` sem saber justificar, eu reprovo no review. Estrutura de pastas se justifica por domínio, não por cargo culting.

---

## Trilha 4 — Arquitetura e sistemas distribuídos

- **[AWS Builders' Library](https://aws.amazon.com/builders-library/)** ⭐⭐ — engenharia de produção de verdade, grátis. Leituras críticas pra nós: [Timeouts, retries and backoff with jitter](https://aws.amazon.com/builders-library/timeouts-retries-and-backoff-with-jitter/), [Avoiding fallback in distributed systems](https://aws.amazon.com/builders-library/avoiding-fallback-in-distributed-systems/), [Challenges with distributed systems](https://aws.amazon.com/builders-library/challenges-with-distributed-systems/).
- **[Microservices Patterns — Chris Richardson](https://microservices.io/patterns/index.html)** ⭐ — catálogo de padrões. Os que vamos usar: *Transactional Outbox*, *Saga*, *Database per Service*, *CQRS*, *Idempotent Consumer*.
- **[Google SRE Books](https://sre.google/books/)** — grátis e completos. Capítulos de SLO, monitoramento e postmortem.
- **[DDD Reference — Eric Evans](https://www.domainlanguage.com/ddd/reference/)** — PDF oficial e gratuito. Vocabulário de bounded context, agregado, entidade, value object.
- **[Hexagonal Architecture — Alistair Cockburn](https://alistair.cockburn.us/hexagonal-architecture/)** — a fonte original. Vamos usar o conceito (ports & adapters), não o cerimonial.
- **[martinfowler.com](https://martinfowler.com/)** — em especial [Accounting Patterns](https://martinfowler.com/eaaDev/AccountingNarrative.html), base conceitual do nosso ledger.
- **[jepsen.io/consistency](https://jepsen.io/consistency)** — mapa dos modelos de consistência. Referência quando eu perguntar "que garantia você está assumindo aí?".
- **[The Twelve-Factor App](https://12factor.net/)** — config, logs, processos. Curto.
- **[ADR — architecture decision records](https://github.com/joelparkerhenderson/architecture-decision-record)** — formato que você vai usar em `.techlead/adr/`.

## Trilha 5 — Domínio: pagamentos

Essa trilha é o seu diferencial na entrevista. Ninguém estuda isso.

- **[Stripe Docs](https://docs.stripe.com/)** ⭐⭐ — a melhor documentação pública de pagamentos do mundo. Estude como *material de arquitetura*, não como API: [Idempotent requests](https://docs.stripe.com/api/idempotent_requests), [Webhooks](https://docs.stripe.com/webhooks), [Payment Intents lifecycle](https://docs.stripe.com/payments/paymentintents/lifecycle), [Connect / split](https://docs.stripe.com/connect).
- **[brandur.org — Implementing Stripe-like Idempotency Keys](https://brandur.org/idempotency-keys)** ⭐⭐ — leitura **obrigatória** antes da Sprint 1. Escrito por um ex-engenheiro do Stripe. É o artigo mais importante desta lista pro nosso case.
- **[brandur.org — Transactionally staged job drain](https://brandur.org/job-drain)** — outbox pattern explicado com clareza cirúrgica.
- **[Modern Treasury Journal](https://www.moderntreasury.com/journal)** — artigos sobre ledger de partidas dobradas e reconciliação.
- **[Pix — Banco Central](https://www.bcb.gov.br/estabilidadefinanceira/pix)** — specs oficiais. Relevante porque Pix é peça central no checkout da Hubla.
- **[Hubla Help Center](https://help.hub.la/)** — leia como se fosse requisito de produto. É o domínio real que estamos simulando.

---

## O que **não** usar

- Tutorial de YouTube "API REST em Go em 20 minutos". Ensina a copiar, não a decidir.
- Boilerplate de "clean architecture em Go" no GitHub. Você vai herdar 6 camadas de indireção que não sabe justificar — e eu vou perguntar o porquê de cada uma.
- IA pra escrever código que você ainda não sabe ler. Esse é o critério `PROG-POOR-5`, o mais grave da rubrica.
