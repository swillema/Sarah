# --- PACOTES NECESSÁRIOS ---
if (!require(GetBCBData)) install.packages("GetBCBData")
if (!require(tidyverse)) install.packages("tidyverse")
if (!require(gganimate)) install.packages("gganimate")
if (!require(transformr)) install.packages("transformr")
if (!require(gifski)) install.packages("gifski")

library(GetBCBData)
library(tidyverse)
library(gganimate)

# --- BAIXAR OS DADOS ---
meu.id <- c(renda_nacional_disponivel_familias = 29029)

df.bcb <- gbcbd_get_series(
  id = meu.id,
  first.date = '1986-03-06',
  last.date = Sys.Date(),
  format.data = 'long',
  use.memoise = TRUE,
  cache.path = tempdir(),
  do.parallel = FALSE
)

# --- CONVERTER PARA MILHÕES DE REAIS ---
df.bcb <- df.bcb %>%
  mutate(value_milhoes = value / 1e6)

# --- REMOVER DADOS FALTANTES E ORDENAR ---
df.bcb <- df.bcb %>%
  filter(!is.na(value_milhoes)) %>%
  arrange(ref.date)

# --- GRÁFICO ESTÁTICO MELHORADO ---
p <- ggplot(df.bcb, aes(x = ref.date, y = value_milhoes)) +
  geom_line(color = "#0073C2FF", size = 1.2) +                     # Linha azul mais forte
  geom_point(color = "#EFC000FF", size = 1.5) +                    # Pontos para destacar os dados
  scale_y_continuous(labels = scales::comma_format(big.mark = ".", decimal.mark = ",")) + # Formatação do eixo y
  labs(
    title = 'Renda Nacional Disponível Bruta das Famílias',
    subtitle = paste0(min(df.bcb$ref.date), ' até ', max(df.bcb$ref.date)),
    x = 'Data',
    y = 'Milhões de R$',
    caption = 'Fonte: Banco Central do Brasil'
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 18),
    plot.subtitle = element_text(size = 12),
    axis.title = element_text(face = "bold"),
    panel.grid.minor = element_blank()
  )

# --- ANIMAÇÃO ACELERADA E COM MELHOR VISUAL ---
p_animado <- p +
  transition_reveal(ref.date) +
  ease_aes('linear') # suaviza o movimento

# --- RENDERIZAR A ANIMAÇÃO ---
anim <- animate(
  p_animado,
  nframes = 120,   # menos quadros = animação mais rápida
  fps = 25,        # mais quadros por segundo = mais fluida e rápida
  width = 900,
  height = 550,
  renderer = gifski_renderer()
)

# --- EXIBIR A ANIMAÇÃO ---
anim

# --- SALVAR O GIF ---
anim_save("renda_nacional_disponivel_milhoes_rapida.gif", animation = anim)

# Renderizar e salvar a animação
anim_save("renda_nacional_disponivel_milhoes_rapida.gif", animation = anim)


