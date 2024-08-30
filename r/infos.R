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

# Definir os dados, tempos médios de execução para cada tamanho de array
tamanho_array <- c(1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000)
tempo_busca_linear <- c(659, 1407, 11028, 171948, 2058248, 16944410, 161056772)
tempo_busca_binaria <- c(311, 185, 244, 1107, 4021, 19096, 22347)

# Criar o gráfico
plot(tamanho_array, tempo_busca_linear, type="o", col="red", log="xy",
     xlab="Tamanho do Array", ylab="Tempo (ns)", 
     main="Comparação de Tempo: Busca Linear vs. Busca Binária",
     lwd=2, pch=19)

# Adicionar a linha da busca binária
lines(tamanho_array, tempo_busca_binaria, type="o", col="blue", lwd=2, pch=19)

# Adicionar a legenda
legend("topleft", legend=c("Busca Linear", "Busca Binária"), col=c("red", "blue"), lwd=2, pch=19)