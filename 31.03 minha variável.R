# IC.TAX. LABR. CP. ZS

# Imposto e contribuições trabalhistas

# TAXA DE JUROS DE EMPRÉSTIMO (FR.INR.LEND)

library(WDI) # CARREGAR BIBLIOTECA/PACOTE

options(scipen = 999) # REMOVER A NOT. CIENT.
# DADOS EM PAINEL
dadostaxaempre <- WDI(country = 'all',
                indicator = 'FR.INR.LEND')

paises <- c('BR', 'US')

dadostaxaemprebrus <- WDI(country = paises,
                    indicator = 'FR.INR.LEND')

# CORTE TRANSVERSAL
taxaempre2023 <- WDI(country = 'all',
                    indicator = 'FR.INR.LEND',
                    start = 2023, end = 2023)

# SÉRIE TEMPORAL
taxaemprebr <- WDI(country = 'BR',
                  indicator = 'FR.INR.LEND')

# GRÁFICOS

# BIBLIOTECA ggplot2 (tidyverse)
install.packages ("tidyverse")
library(tidyverse)

## DADOS EM PAINEL

grafpainel <- ggplot(dadostaxaempre,
                     mapping = aes (y = FR.INR.LEND,
                                    x = year)) +
  geom_point()

# COLUNA COM NOME DO TEMA NO EIXO Y, ANO EIXO X

# ABRIR O GRÁFICO
print (grafpainel)

# OUTRA FORMA DE ABRIR É CLICAR NO CTRL E CLICAR COM O BOTÃO ESQUERDO NO NOME DO GRÁFICO

# CORTE TRANSVERSAL 

grafcorte <- ggplot (taxaempre2023,
                     mapping = aes (y = FR.INR.LEND,
                                    x = year)) +
  geom_point()

print(grafcorte)

# SÉRIE TEMPORAL

grafserie <- ggplot (taxaemprebr,
                     mapping = aes (y = FR.INR.LEND,
                                    x = year)) +
  geom_line()

print(grafserie)
