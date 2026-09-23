# 💳 go-kairo-payments

O **go-kairo-payments** é uma API HTTP desenvolvida em Go para o processamento de transações de pagamento da **Kairo**. Este projeto foi criado com foco em performance, simplicidade e serve como base de aprendizado para arquitetura de microsserviços financeiros.

## 🚀 Tecnologias Utilizadas

*   **Go** (Golang)
*   **Golangci-lint** (Qualidade de código)
*   **Makefile** (Automação de comandos)

## 📋 Pré-requisitos

Antes de começar, você precisará ter instalado em sua máquina:
*   [Go](https://go.dev) (versão 1.20 ou superior recomendada)
*   [Golangci-lint](https://golangci-lint.run) (para verificação de padrões de código)

## 🛠️ Como Executar o Projeto

O projeto utiliza um `Makefile` para abstrair e simplificar os comandos de terminal.

### 1. Clonar o repositório
```bash
git clone https://github.com/pedrohsjdev/go-kairo-payments.git
cd go-kairo-payments
```

### 2. Rodar o fluxo completo
Executa o linter, os testes unitários e compila o binário de uma só vez:
```bash
make
```

API em construção... Ainda não existe servidor HTTP
### 3. Executar a API
Compila o projeto e inicia o servidor HTTP imediatamente:
```bash
make run
```

### 4. Executar os Testes
Roda todas as suítes de testes unitários de forma detalhada:
```bash
make test
```

### 5. Executar o Linter
Valida se o código segue as boas práticas da comunidade Go:
```bash
make lint
```

### 6. Limpar Arquivos Gerados
Remove o binário compilado e limpa o cache de testes:
```bash
make clean
```

---

⚠️ **Nota Importante:** Este é um projeto estritamente **fictício** e voltado para **fins educacionais e de aprendizado**. A empresa "Kairo" não existe e este software não deve ser utilizado em ambientes de produção real de pagamentos.
