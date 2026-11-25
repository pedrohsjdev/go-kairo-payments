# .techlead — instrumental de avaliação

Mantido por **Rafael Duarte (TL Principal)**. O dev não edita estes arquivos; ele lê.

| Arquivo | O que é |
|---|---|
| `scorecard.csv` | Base de dados. Uma linha por evidência observada. |
| `ladder.md` | Rubrica da Hubla. Fonte da verdade do veredito final. |
| `backlog.md` | Backlog, sprints, deadlines, status. |
| `resources.md` | Curadoria de estudo (gratuita). |
| `reviews/` | Um arquivo por PR revisado. |
| `adr/` | Architecture Decision Records — escritos pelo **dev**. |
| `metrics/` | Snapshots de performance, load tests, profiling. |

## Como leio o `scorecard.csv`

- `competencia`: `PROGRAMMING` | `ARCHITECTURE` | `PRODUCT`
- `criterio`: id do item da rubrica, ex. `PROG-INT-2`, `ARCH-BAS-3`
- `nivel`: `POOR` | `BASIC` | `INTERMEDIATE` | `ADVANCED` | `EXCEPTIONAL`
- `veredito`: `HIT` (acerto) | `MISS` (erro)
- `peso`: `1` sinal fraco/pontual · `2` sinal relevante · `3` sinal forte, define nível
- `acao`: o que foi combinado para corrigir/consolidar

## Gatilhos de alerta (eu notifico, não deixo passar)

1. **3+ `MISS` em `POOR` na mesma competência** dentro de uma milestone → conversa de correção de rota.
2. **Mesmo `criterio` com `MISS` em 3 PRs diferentes** → padrão, não descuido. Vira plano de ação.
3. **Previsibilidade** → ver a seção abaixo. Suspensa por acordo em 25/11.
4. **Código que ele não sabe explicar** → `PROG-POOR-5`. Rejeição automática do PR.

## Previsibilidade — quando volta a contar (acordo de 25/11/2026)

Este é um projeto de **estudo**, não um compromisso com stakeholder. Atraso aqui não gera custo para terceiros, e previsibilidade só é mensurável contra uma cadência de referência. Essa cadência ainda não existe.

**Regra, com todas as condições necessárias.** Só registro `PROG-POOR-4` quando **todas** forem verdadeiras:

1. **Baseline estabelecida** — 3 micro-sprints consecutivas entregues dentro do prazo. Antes disso, não há do que desviar.
2. **Interrupção depois dessa baseline** — prazo perdido ou ausência prolongada.
3. **Sem aviso prévio** — se ele sinalizar antes do prazo, não conta, ponto. Nem mesmo como peso 1.

Enquanto a baseline não existir, atraso é **fato de planejamento, não evidência de desempenho**: eu reagendo e sigo, sem anotar nada contra ele.

O registro de 28/09 fica (foi antes do acordo). O de 25/11 foi anulado no mesmo dia.

**Contrapartida minha:** se o escopo escorregar duas vezes, o erro é do meu dimensionamento e eu reduzo a escala — não reconstruo o plano no mesmo tamanho.

## Veredito

Ao fim do arco, cruzo o acumulado do `scorecard.csv` com `ladder.md` e emito o nível.
Alvo: `Programming INTERMEDIATE` · `Architecture INTERMEDIATE` · `Product BASIC`.
