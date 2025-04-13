# Gráfico de série temporal
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
  labs(
    title = "Taxa de Juros Real (2000–2024)",
    subtitle = "Comparação entre o Brasil e as 10 maiores economias do mundo",
    x = "Ano",
    y = "Taxa de Juros Real (%)",
    color = "País"
  ) +
  theme_minimal() +
  theme(legend.position = "right")
