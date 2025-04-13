# CÓDIGO FINAL PARA DADOS EM PAINÉL

# Instalar e carregar o pacote se necessário
# install.packages("WDI")
library(WDI)

# Definir os países
paises <- c("US", "CN", "JP", "DE", "GB", "IN", "FR", "IT", "BR", "CA")

# Baixar os dados da variável FR.INR.LEND (Taxa de juros real)
dados_juros <- WDI(country = paises, 
                   indicator = "FR.INR.LEND", 
                   start = 1980, 
                   end = 2024)

# Renomear a variável para facilitar
colnames(dados_juros)[colnames(dados_juros) == "FR.INR.LEND"] <- "taxa_juros"

# Remover NAs
dados_juros <- na.omit(dados_juros)

# Visualizar estrutura
str(dados_juros)

# Instalar se necessário
# install.packages("ggplot2")
library(ggplot2)

# Criar o gráfico
ggplot(dados_juros, aes(x = year, y = taxa_juros, color = country, group = country)) +
  geom_line(size = 1) +
  scale_color_manual(values = c(
    "Brazil" = "red",
    "United States" = "gray30",
    "China" = "blue",
    "Japan" = "green",
    "Germany" = "purple",
    "United Kingdom" = "orange",
    "India" = "brown",
    "France" = "pink",
    "Italy" = "cyan",
    "Canada" = "gold"
  )) +
  labs(title = "Taxa de Juros Real (1980–2024)",
       subtitle = "Comparação entre o Brasil e as 10 maiores economias do mundo",
       x = "Ano",
       y = "Taxa de Juros (%)",
       color = "País") +
  theme_minimal() +
  theme(legend.position = "right")


# Filtrar os dados para o período de 2000 a 2024
dados_juros <- subset(dados_juros, year >= 2000)


# Instalar e carregar pacotes (caso ainda não esteja feito)
# install.packages("WDI")
# install.packages("ggplot2")
library(WDI)
library(ggplot2)

# Definir os países
paises <- c("US", "CN", "JP", "DE", "GB", "IN", "FR", "IT", "BR", "CA")

# Baixar dados da WDI
dados_juros <- WDI(country = paises, 
                   indicator = "FR.INR.LEND", 
                   start = 1980, 
                   end = 2024)

# Renomear a variável
colnames(dados_juros)[colnames(dados_juros) == "FR.INR.LEND"] <- "taxa_juros"

# Remover valores ausentes
dados_juros <- na.omit(dados_juros)

# Filtrar a partir do ano 2000
dados_juros <- subset(dados_juros, year >= 2000)

# Gráfico
ggplot(dados_juros, aes(x = year, y = taxa_juros, color = country, group = country)) +
  geom_line(size = 1) +
  scale_color_manual(values = c(
    "Brazil" = "red",
    "United States" = "gray30",
    "China" = "blue",
    "Japan" = "green",
    "Germany" = "purple",
    "United Kingdom" = "orange",
    "India" = "brown",
    "France" = "pink",
    "Italy" = "cyan",
    "Canada" = "gold"
  )) +
  labs(title = "Taxa de Juros Real (2000–2024)",
       subtitle = "Comparação entre o Brasil e as 10 maiores economias do mundo",
       x = "Ano",
       y = "Taxa de Juros (%)",
       color = "País") +
  theme_minimal() +
  theme(legend.position = "right")