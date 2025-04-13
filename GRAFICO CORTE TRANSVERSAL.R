library(ggplot2)
library(dplyr)

# Definir o ano de corte (ex: 2022)
ano_corte <- 2022

# Filtrar os dados para o ano de interesse
dados_corte <- dados_juros %>%
  filter(year == ano_corte, country %in% c(paises_top10, "Brazil"))

# Ordenar países pela taxa de juros real
dados_corte$country <- reorder(dados_corte$country, dados_corte$taxa_juros)

# Gráfico de corte transversal
ggplot(dados_corte, aes(x = taxa_juros, y = country, fill = country == "Brazil")) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("FALSE" = "steelblue", "TRUE" = "red"),
                    labels = c("FALSE" = "Outros países", "TRUE" = "Brasil")) +
  labs(
    title = paste("Taxa de Juros Real em", ano_corte),
    x = "Taxa de juros real (%)",
    y = "",
    fill = "País"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")



# Carregar pacotes
library(WDI)
library(ggplot2)
library(dplyr)

# Baixar os dados da taxa de juros real (FR.INR.LEND) para os países
paises_top10 <- c("US", "CN", "JP", "DE", "GB", "IN", "FR", "IT", "BR", "CA")

dados_juros <- WDI(
  country = paises_top10,
  indicator = "FR.INR.LEND",
  start = 1980,
  end = 2024
)

# Renomear variável para facilitar
colnames(dados_juros)[colnames(dados_juros) == "FR.INR.LEND"] <- "taxa_juros"

# Remover valores ausentes
dados_juros <- na.omit(dados_juros)

# Filtrar apenas os dados do ano de corte (ex: 2022)
ano_corte <- 2022
dados_corte <- dados_juros %>%
  filter(year == ano_corte)

# Verificar nomes corretos dos países
unique(dados_corte$country)



# Ordenar os países pela taxa de juros
dados_corte$country <- reorder(dados_corte$country, dados_corte$taxa_juros)

# Gráfico de corte transversal
ggplot(dados_corte, aes(x = taxa_juros, y = country, fill = country == "Brazil")) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("FALSE" = "steelblue", "TRUE" = "red"),
                    labels = c("FALSE" = "Outros países", "TRUE" = "Brasil")) +
  labs(
    title = paste("Taxa de Juros Real em", ano_corte),
    x = "Taxa de juros real (%)",
    y = "",
    fill = "País"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")




library(WDI)
library(ggplot2)
library(dplyr)

# Definir os países (códigos ISO)
paises_iso <- c("US", "CN", "JP", "DE", "GB", "IN", "FR", "IT", "BR", "CA")

# Baixar os dados do WDI para a variável FR.INR.LEND
dados_juros <- WDI(
  country = paises_iso,
  indicator = "FR.INR.LEND",
  start = 2000,
  end = 2024
)

# Renomear a variável
colnames(dados_juros)[colnames(dados_juros) == "FR.INR.LEND"] <- "taxa_juros"

# Remover valores ausentes
dados_juros <- na.omit(dados_juros)

# Definir o ano de corte
ano_corte <- 2022

# Obter os nomes corretos dos países presentes nos dados
unique(dados_juros$country)
# (Isso é útil para conferir os nomes exatos dos países, se necessário)

# Filtrar para os 10 países no ano de corte
dados_corte <- dados_juros %>%
  filter(year == ano_corte) %>%
  filter(country %in% c("United States", "China", "Japan", "Germany",
                        "United Kingdom", "India", "France", "Italy",
                        "Brazil", "Canada"))

# Garantir que temos os 10 países
print(unique(dados_corte$country))  # Deve listar os 10

# Ordenar países pela taxa de juros
dados_corte$country <- reorder(dados_corte$country, dados_corte$taxa_juros)

# Criar o gráfico de corte transversal
ggplot(dados_corte, aes(x = taxa_juros, y = country, fill = country == "Brazil")) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("FALSE" = "steelblue", "TRUE" = "red"),
                    labels = c("FALSE" = "Outros países", "TRUE" = "Brasil")) +
  labs(
    title = paste("Taxa de Juros Real em", ano_corte),
    subtitle = "Comparação entre o Brasil e as 10 maiores economias do mundo",
    x = "Taxa de juros real (%)",
    y = "",
    fill = "País"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")

