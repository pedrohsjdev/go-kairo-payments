# variaveis
GOCMD = go

# Variáveis para organizar o projeto
BINARY_NAME=go-kairo-payments
CMD_PATH=./cmd/main.go

.PHONY: all build run test lint clean help

# Comando padrão ao rodar apenas 'make'
all: lint test build

## build: Compila o binário do projeto
build:
	@echo "Compilando o binário..."
	$(GOCMD) build -o $(BINARY_NAME) $(CMD_PATH)

## run: Compila e executa a aplicação
run: build
	@chmod +x ./$(BINARY_NAME)
	@echo "Executando a aplicação..."
	./$(BINARY_NAME)

## test: Executa todos os testes unitários
test:
	@echo "Executando testes..."
	$(GOCMD) test -v ./...

## lint: Executa a verificação de código com o golangci-lint
lint:
	@echo "Executando o golangci-lint..."
	golangci-lint run ./...

## clean: Remove o binário gerado e limpa o cache de teste
clean:
	@echo "Limpando arquivos gerados..."
	rm -f $(BINARY_NAME)
	$(GOCMD) clean -testcache

## help: Mostra os comandos disponíveis e suas descrições
help:
	@echo "Comandos disponíveis:"
	@sed -n 's/^##//p' $(MAKEFILE) | column -t -s ':' |  sed -e 's/^/ /'
