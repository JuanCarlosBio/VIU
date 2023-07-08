library(tidyverse)
library(lubridate)
library(DescTools)
library(rstatix)
library(glue)

prot_viz <- read_delim("visualizadores.csv",
                       skip = 1, 
                       delim=",") %>% view()

prot_viz_processed <- prot_viz %>%
    rename(pymol = `PyMOL: (Todo el mundo)`,
           jmol = `Jmol: (Todo el mundo)`,
           chimera = `UCSF Chimera: (Todo el mundo)`,
           fecha = Semana) %>%
    pivot_longer(-fecha, 
                 names_to = "visualizadores",
                 values_to = "porcentaje_busqueda") %>%
    mutate(visualizadores = factor(visualizadores,
                                   levels = c("pymol", "jmol", "chimera"),
                                   labels = c("PyMol", "JMol", "UCFS Chimera"))) 

prot_vizz_anios <- prot_viz %>%
    rename(pymol = `PyMOL: (Todo el mundo)`,
           jmol = `Jmol: (Todo el mundo)`,
           chimera = `UCSF Chimera: (Todo el mundo)`,
           fecha = Semana) %>%
    mutate(anio=as.character(year(fecha))) %>%
    select(-fecha)

matrix_anio <- prot_vizz_anios %>% 
    select(-anio) %>%
    as.matrix()

prot_viz_processed %>% glimpse()
prot_vizz_anios %>% glimpse()

viu_estafa <- tibble(
    x = as.Date("2020-09-15"),
    y = 95,
    label = " = VIU es una estafa!!!!"
) 

prot_viz_processed %>%
    ggplot(aes(fecha, porcentaje_busqueda, color=visualizadores)) +
    geom_line() +
    geom_text(data=viu_estafa,
              aes(x=x, y=y, label=label), 
              inherit.aes=FALSE, size=4,
              color="orangered") +
    scale_y_continuous(expand=expansion(0),
                       limits = c(0,100),
                       breaks = seq(0,100,10)) +
    scale_color_manual(values = c("orange", "red", "blue")) +
    labs(
        title = "Visualizadores 3D de proteínas Google Trends\nICM no aparece xd",
        x = "Año", y="% Usado (Todo el mundo)", color = NULL
    ) +
    theme_classic() +
    theme(
        plot.title = element_text(hjust =.5, face="bold",
                                  margin = margin(b=15)),
        axis.title = element_text(face = "bold", size=12),
        axis.text = element_text(color = "black", size=11),
        legend.position = c(.2,.9),
        legend.text = element_text(size = 10),
        legend.background = element_rect(color="black")
    )

ggsave("vizualizadores_proteicos.png", 
       width = 7,
       height = 5)

## Análisis comparativo:
prot_viz_processed %>%
    group_by(visualizadores) %>%
    count()
# Estudio de la normalidad de los datos con el test de Kolmogorov-smirnov (n>50)
tapply(prot_viz_processed$porcentaje_busqueda, 
       prot_viz_processed$visualizadores, 
       LillieTest)

# No hay normalidad en los datos, usaremos Kruskal-Wallis
prot_viz_processed %>%
    kruskal_test(porcentaje_busqueda~visualizadores)

# obviamente existen diferencias significativas, pero entre que grupos?
prot_viz_processed %>%
    dunn_test(porcentaje_busqueda~visualizadores,
                 p.adjust.method="bonferroni") %>%
    select(group1, group2, p.adj, p.adj.signif)

significancia <- tibble(
    x = c(2,1.5,2.5),
    y = c(118, 110, 100),
    label = c("***", "***", "*** LOL")
)

lineas_sig <- tibble(
    x = c(1,3,1,2,2,3),
    y = c(115,115,105,105,95,95),
    linea = rep(c("linea1", "linea2", "linea3"),2)
) %>%
    mutate(linea=sort(linea))


prot_viz_processed %>%
    ggplot(aes(visualizadores, porcentaje_busqueda, fill=visualizadores)) +
    geom_boxplot(width=.5, show.legend=FALSE) +
    geom_jitter(pch=21, position=position_jitter(),
                alpha=.25, show.legend=FALSE) +
    geom_text(data=significancia,
              aes(x=x, y=y, label=label), 
              size=6, inherit.aes=FALSE) +
    geom_line(data=lineas_sig,
              aes(x=x, y=y, color=linea), 
              inherit.aes=FALSE, show.legend=FALSE) +
    scale_y_continuous(expand = expansion(0),
                       limits = c(0,125),
                       breaks = seq(0,100,10)) +
    scale_fill_manual(values = c("orange", "red", "blue")) +
    scale_color_manual(values = c(rep("black", 3))) +
    labs(
        title = "Comparación entre los visualizadores (últimos 5 años)",
        y = "% Usado (Todo el mundo)",
        x = "Tipo de visualizador"
    ) +
    theme_classic() +
    theme(
        plot.title = element_text(hjust =.5, face="bold",
                                  margin = margin(b=15),
                                  size=13),
        axis.title = element_text(face = "bold", size=13),
        axis.text = element_text(color = "black", size=12)
    )


ggsave("comparacion.png", 
       width=7,
       height=5)

## PCA de según los años
pca_anios <- prcomp(matrix_anio,
                    scale = TRUE,
                    center = TRUE)

resumen_pca <- summary(pca_anios)
resumen_pca$importance

varianza_pc1 <- round(resumen_pca$importance[2,1]*100,2)
varianza_pc2 <- round(resumen_pca$importance[2,2]*100,2)

print(glue("Varianza acumulada PC1 = {varianza_pc1}%"))
print(glue("Varianza acumulada PC1 = {varianza_pc2}%"))
print(glue("Las 2 PC explican un total de {varianza_pc1+varianza_pc2}% de la varianza acumulada"))

tibble_componentes <- as_tibble(pca_anios$x[,c(1,2)]) %>%
    mutate(anio = prot_vizz_anios$anio)

## Nada que se pueda ver
tibble_componentes %>%
    ggplot(aes(PC1, PC2, color=anio, fill=anio)) +
    geom_point() +
    stat_ellipse(geom="polygon", alpha=.5)
