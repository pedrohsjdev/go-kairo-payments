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
3. **2 deadlines perdidos sem sinalização prévia** → `PROG-POOR-4`. Grave: previsibilidade é critério de corte pra Senior.
4. **Código que ele não sabe explicar** → `PROG-POOR-5`. Rejeição automática do PR.

## Veredito

Ao fim do arco, cruzo o acumulado do `scorecard.csv` com `ladder.md` e emito o nível.
Alvo: `Programming INTERMEDIATE` · `Architecture INTERMEDIATE` · `Product BASIC`.
