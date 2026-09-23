# Rubrica de avaliação — Hubla Engineering Ladder

Alvo do dev: **Senior** → `Programming: INTERMEDIATE` · `Architecture: INTERMEDIATE` · `Product Sense: BASIC`

|  | Pleno | **Senior** | Master | Staff | Sr. Staff | Principal |
|---|---|---|---|---|---|---|
| Programming | BASIC | **INTERMEDIATE** | INTERMEDIATE | ADVANCED | EXCEPTIONAL | EXCEPTIONAL |
| Architecture | BASIC | **INTERMEDIATE** | INTERMEDIATE | ADVANCED | ADVANCED | EXCEPTIONAL |
| Product Sense | BASIC | **BASIC** | INTERMEDIATE | INTERMEDIATE | ADVANCED | EXCEPTIONAL |

---

## PROGRAMMING

### POOR (sinais de alarme — contam contra)
- `PROG-POOR-1` Código que recorrentemente foge dos padrões/convenções do time. *Não conta:* divergência de estilo pessoal ou tentativa legítima de melhorar um padrão.
- `PROG-POOR-2` Não testa adequadamente, ou escreve teste sem significado. *Não conta:* ausência de teste onde o risco não justifica.
- `PROG-POOR-3` Bugs facilmente evitáveis (descuido, requisito lido pela metade). *Não conta:* bug isolado em cenário complexo.
- `PROG-POOR-4` Perde a maioria dos prazos, imprevisível, não sinaliza bloqueio com antecedência. *Não conta:* atraso por mudança de escopo/dependência **comunicado a tempo**.
- `PROG-POOR-5` Sobe código gerado por IA sem revisão crítica. *Não conta:* usar IA — conta não entender o que subiu.

### BASIC
- `PROG-BAS-1` Código funcional, limpo e bem estruturado em problemas simples.
- `PROG-BAS-2` Segue convenções e práticas do time com pouca orientação.
- `PROG-BAS-3` Usa testes unitários para verificar correção; cobre positivo e negativo básicos.
- `PROG-BAS-4` Resolve problemas bem definidos dentro do prazo, com pouca orientação.

### INTERMEDIATE ← **alvo**
- `PROG-INT-1` Código autoexplicativo, claro, conciso, fácil de manter. Reduz complexidade acidental em vez de aumentar. *Não conta:* sofisticação/abstração excessiva como prova de qualidade.
- `PROG-INT-2` Features bem testadas e confiáveis: escolhe o **tipo** de validação proporcional ao risco (unit, funcional, integração, CI/CD, monitoramento), cobre edge cases previsíveis. *Não conta:* maximizar cobertura indiscriminadamente.
- `PROG-INT-3` Depura problemas de complexidade moderada de forma independente, usando logs/métricas/traces/profiling. Diferencia sintoma de causa-raiz e **explica por que** a correção resolve.
- `PROG-INT-4` Colabora com a qualidade fora do próprio código: levanta riscos em discussões, dá feedback honesto que evita bugs ou simplifica solução. *Não conta:* presença passiva ou comentário cosmético.
- `PROG-INT-5` Entrega projetos de algumas semanas no prazo; quebra em entregáveis menores, comunica progresso/risco/bloqueio **antes** de virar surpresa. *Não conta:* liderar sozinho iniciativas ambíguas ou cross-team.

### ADVANCED (acima do alvo — anoto se aparecer)
- `PROG-ADV-1` Eleva a base de código via code review e mentoria com impacto no time.
- `PROG-ADV-2` Depura os casos mais difíceis; é referência do time.
- `PROG-ADV-3` Referência em incidentes, com urgência e maturidade.
- `PROG-ADV-4` Desenvolve outros engenheiros de forma consistente.
- `PROG-ADV-5` Conhecimento profundo de toda uma área grande do produto.
- `PROG-ADV-6` Ownership impecável de ponta a ponta em projetos complexos.
- `PROG-ADV-7` Define escopo com excelência; ETAs precisos; execução previsível.

---

## ARCHITECTURE

### POOR
- `ARCH-POOR-1` Sem base de modelagem de dados; modelos inconsistentes/redundantes; não explica por que escolheu a estrutura. (3+ correções básicas no ciclo)
- `ARCH-POOR-2` Incapaz de propor solução arquitetural mesmo em nível de aplicação; sem separação de responsabilidades.
- `ARCH-POOR-3` Cria dependências frágeis / acoplamento rígido evitável; sistemas que não escalam nem se adaptam. (2+ decisões que geraram retrabalho previsível)

### BASIC
- `ARCH-BAS-1` Projeta componentes simples seguindo padrões existentes, com responsabilidades claras.
- `ARCH-BAS-2` Entende a diferença entre arquitetura local e distribuída; não trata problema com partes independentes como se fosse local.
- `ARCH-BAS-3` Aplica boas práticas básicas de segurança e confiabilidade **com orientação**; sem omissões graves onde havia padrão claro.
- `ARCH-BAS-4` Atua em interações típicas do domínio: evolui modelos, interfaces e contratos sem quebrar o existente. (2+ situações)

### INTERMEDIATE ← **alvo**
- `ARCH-INT-1` Projeta sistemas modulares e escaláveis, interfaces claras, modelos consistentes; a solução **continua evoluível depois da primeira entrega**. (2+ soluções de complexidade relevante que outros estendem com baixo atrito)
- `ARCH-INT-2` Entende limitações/garantias de arquiteturas com partes independentes e **adapta o desenho**: sincronização, falhas, latência, consistência. Não assume garantia que a arquitetura real não oferece. (2+ adaptações que evitaram problema concreto)
- `ARCH-INT-3` Considera escala e performance no design e **valida com dados** — métricas, profiling, traces, benchmarks. (1+ decisão validada por medição)
- `ARCH-INT-4` Aplica observabilidade, resiliência e segurança **por conta própria**, não sob orientação. (2+ entregas com mecanismo fora do requisito original que se mostrou útil)
- `ARCH-INT-5` Compreende o contexto de negócio do domínio e projeta alinhado; evita overengineering. (1+ decisão técnica explicitamente influenciada por restrição de negócio)
- `ARCH-INT-6` Influencia decisões do time; muda materialmente o desenho proposto por outra pessoa. (2+ situações)

### ADVANCED (acima do alvo)
- `ARCH-ADV-1` Simplifica arquiteturas já complexas, reduzindo complexidade operacional/cognitiva.
- `ARCH-ADV-2` Domínio prático de trade-offs em sistemas de alta exigência; decisão sustentada por dados.
- `ARCH-ADV-3` Eleva o padrão de segurança/escala/performance em múltiplos domínios.
- `ARCH-ADV-4` Define arquiteturas complexas de impacto organizacional (2+ domínios).
- `ARCH-ADV-5` Lidera discussões técnicas alinhando múltiplos domínios.
- `ARCH-ADV-6` Antecipa gargalos futuros com base em experiência prática. (2+ riscos antecipados)

---

## PRODUCT SENSE

### POOR
- `PROD-POOR-1` Ignora necessidade do cliente; decide por opinião própria.
- `PROD-POOR-2` Pensa só numa dimensão (só viabilidade técnica, só estética).
- `PROD-POOR-3` Corre atrás de toda ideia; não separa urgente de importante.
- `PROD-POOR-4` Aceita solução confusa/mal feita sem perceber problema.
- `PROD-POOR-5` Pensa apenas em task/feature isolada, sem conectar ao fluxo maior.
- `PROD-POOR-6` Não explica ideias com clareza; gera confusão e desalinhamento.

### BASIC ← **alvo**
- `PROD-BAS-1` Ouve cliente e incorpora feedback — ainda que de forma literal. Traz sinal real para a discussão em vez de decidir por opinião.
- `PROD-BAS-2` Entrega sem problemas básicos de experiência e craft (fluxo confuso, mensagem que não explica o que aconteceu, comportamento inconsistente, fricção desnecessária).
- `PROD-BAS-3` Conecta a iniciativa a um objetivo concreto de negócio de curto prazo.
- `PROD-BAS-4` Explica decisões e trade-offs, ainda que com excesso de detalhe ou jargão.

### INTERMEDIATE (acima do alvo)
- `PROD-INT-1` Diagnostica antes de propor; **reformula o problema** quando o pedido não é a melhor resposta. (2+ reformulações que mudaram escopo/abordagem)
- `PROD-INT-2` Prioriza comparando alternativas explicitamente ("fazemos X e não Y porque..."); sabe dizer não. (2+ casos)
- `PROD-INT-3` Contribui na definição da solução de forma que **muda o resultado final**. (1+ caso rastreável)
- `PROD-INT-4` Enxerga como a feature se conecta ao fluxo e ao domínio; percebe impacto colateral. (1+ caso)
- `PROD-INT-5` Comunica de forma que stakeholders saem alinhados **sem reexplicação**. (2+ discussões)

---

## Notas de interpretação

- **Complexidade moderada**: problema difícil, mas contido num único domínio/serviço/fluxo familiar.
- **Alta complexidade**: exige autonomia atravessando múltiplos domínios/sistemas/times ao mesmo tempo.
- **Ownership** não é volume de trabalho nem sacrifício: é fazer o problema avançar com clareza, coordenação, antecipação de risco e previsibilidade.
- **Observabilidade significativa**: visibilidade suficiente para entender comportamento, detectar anomalia, investigar causa e decidir com dado.
- **Arquitetura alinhada ao negócio**: considera risco, custo, velocidade, operação e evolução — não só sofisticação técnica.
