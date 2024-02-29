# Vamos criar o primeiro estágio: vamos compilar o código Go em um executável
# Usamos a técnica multistage

FROM golang:alpine AS builder
WORKDIR /app
COPY main.go .
COPY go.mod .
RUN go build -o main

# depois, fazer o segundo estágio, que é copiar o executável para uma imagem mínima
FROM scratch
WORKDIR /app
COPY --from=builder /app/main /app/projeto
CMD ["./projeto"]
