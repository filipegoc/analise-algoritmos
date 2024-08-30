diretorio <- getwd()  # Obtém o diretório atual

# Cria o caminho usando file.path()
#caminho_completo <- file.path(diretorio, "novaFaculdade", "analise-algoritmos", "dados", "search_logs1000.txt")
#caminho_completo <- file.path(diretorio, "novaFaculdade", "analise-algoritmos", "dados", "search_logs10000.txt")
#caminho_completo <- file.path(diretorio, "novaFaculdade", "analise-algoritmos", "dados", "search_logs100000.txt")
#caminho_completo <- file.path(diretorio, "novaFaculdade", "analise-algoritmos", "dados", "search_logs1000000.txt")
#caminho_completo <- file.path(diretorio, "novaFaculdade", "analise-algoritmos", "dados", "search_logs10000000.txt")
#caminho_completo <- file.path(diretorio, "novaFaculdade", "analise-algoritmos", "dados", "search_logs100000000.txt")
caminho_completo <- file.path(diretorio, "novaFaculdade", "analise-algoritmos", "dados", "search_logs1000000000.txt")

# Ler o arquivo
dados <- read.table(caminho_completo, header = FALSE, sep = ",", col.names = c("numero_buscado", "tempo_binaria", "tempo_linear"))

# Visualizar os primeiros dados
#head(dados)

dados$numero_buscado <- as.numeric(gsub("[{}]", "", dados$numero_buscado))
dados$tempo_binaria <- as.numeric(gsub("[{}]", "", dados$tempo_binaria))
dados$tempo_linear <- as.numeric(gsub("[{}]", "", dados$tempo_linear))

# Visualizar a tabela limpa
#head(dados)

media_binaria <- mean(dados$tempo_binaria)
media_linear <- mean(dados$tempo_linear)

cat("Tempo médio de execução (Busca Binária):", media_binaria, "ns\n")
cat("Tempo médio de execução (Busca Linear):", media_linear, "ns\n")

# Cálculo do desvio padrão
sd_binaria <- sd(dados$tempo_binaria)
sd_linear <- sd(dados$tempo_linear)

cat("Desvio padrão (Busca Binária):", sd_binaria, "ns\n")
cat("Desvio padrão (Busca Linear):", sd_linear, "ns\n")

# Histograma para a busca binária e busca linear
ggplot(dados, aes(x = tempo_binaria)) +
  geom_histogram(binwidth = 1000, fill = "blue", alpha = 0.5) +
  labs(title = "Distribuição dos Tempos de Execução (Busca Binária)", x = "Tempo (ns)", y = "Frequência")

ggplot(dados, aes(x = tempo_linear)) +
  geom_histogram(binwidth = 1000, fill = "red", alpha = 0.5) +
  labs(title = "Distribuição dos Tempos de Execução (Busca Linear)", x = "Tempo (ns)", y = "Frequência")

# Plotando a relação entre o número buscado e o tempo de execução
ggplot(dados, aes(x = numero_buscado, y = tempo_binaria)) +
  geom_point(color = "blue") +
  labs(title = "Tempo de Execução da Busca Binária vs Número Buscado", x = "Número Buscado", y = "Tempo (ns)")

ggplot(dados, aes(x = numero_buscado, y = tempo_linear)) +
  geom_point(color = "red") +
  labs(title = "Tempo de Execução da Busca Linear vs Número Buscado", x = "Número Buscado", y = "Tempo (ns)")


# Cálculo da razão entre os tempos de execução
dados$razao_tempo <- dados$tempo_linear / dados$tempo_binaria

# Visualizando a razão
ggplot(dados, aes(x = numero_buscado, y = razao_tempo)) +
  geom_line(color = "purple") +
  labs(title = "Razão entre o Tempo de Execução da Busca Linear e Binária", x = "Número Buscado", y = "Razão Linear/Binária")


# Ajuste de curvas para busca binária e busca linear
# Filtrar os valores de numero_buscado maiores que zero
modelo_binaria_dados_filtrados <- subset(dados, numero_buscado > 0)
modelo_linear <- lm(tempo_linear ~ numero_buscado, data = dados)

summary(modelo_binaria_dados_filtrados)  # Ver análise do modelo da busca binária
summary(modelo_linear)   # Ver análise do modelo da busca linear


# Filtrar para o melhor caso (número buscado no início)
melhor_caso <- subset(dados, numero_buscado == min(dados$numero_buscado))

# Filtrar para o pior caso (número buscado no final)
pior_caso <- subset(dados, numero_buscado == max(dados$numero_buscado))

# Filtrar para o caso médio
caso_medio <- subset(dados, numero_buscado == median(dados$numero_buscado))

# Comparar tempos para os três cenários
cat("Melhor caso - Tempo de busca binária:", melhor_caso$tempo_binaria, "Tempo de busca linear:", melhor_caso$tempo_linear, "\n")
cat("Pior caso - Tempo de busca binária:", pior_caso$tempo_binaria, "Tempo de busca linear:", pior_caso$tempo_linear, "\n")
cat("Caso médio - Tempo de busca binária:", caso_medio$tempo_binaria, "Tempo de busca linear:", caso_medio$tempo_linear, "\n")
