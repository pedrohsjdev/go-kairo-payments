# variaveis
GOCMD = go

# Variáveis para organizar o projeto
BINARY_NAME=go-kairo-payments
TARGET=bin/$(BINARY_NAME)
CMD_PATH=./cmd/api/main.go

.PHONY: all build run test lint clean help

# Comando padrão ao rodar apenas 'make'
all: lint test build

## build: Compila o binário do projeto
build:
	@echo "Compilando o binário..."
	$(GOCMD) build -o $(TARGET) $(CMD_PATH)

## run: Compila e executa a aplicação
run: build
	@chmod +x ./$(TARGET)
	@echo "Executando a aplicação..."
	./$(TARGET)

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
	rm -rf bin
	$(GOCMD) clean -testcache

## help: Mostra os comandos disponíveis e suas descrições
help:
	@echo "Comandos disponíveis:"
	@sed -n 's/^##//p' $(MAKEFILE_LIST) | column -t -s ':' |  sed -e 's/^/ /'
