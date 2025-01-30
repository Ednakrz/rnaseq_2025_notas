## Lets build our first SummarizedExperiment object
library("SummarizedExperiment")
## ?SummarizedExperiment

## De los ejemplos en la ayuda oficial

## Creamos los datos para nuestro objeto de tipo SummarizedExperiment
## para 200 genes a lo largo de 6 muestras
nrows <- 200
ncols <- 6
## Números al azar de cuentas
set.seed(20210223)
counts <- matrix(runif(nrows * ncols, 1, 1e4), nrows)
## Información de nuestros genes
rowRanges <- GRanges(
  rep(c("chr1", "chr2"), c(50, 150)),
  IRanges(floor(runif(200, 1e5, 1e6)), width = 100),
  strand = sample(c("+", "-"), 200, TRUE),
  feature_id = sprintf("ID%03d", 1:200)
)
names(rowRanges) <- paste0("gene_", seq_len(length(rowRanges)))
## Información de nuestras muestras
colData <- DataFrame(
  Treatment = rep(c("ChIP", "Input"), 3),
  row.names = LETTERS[1:6]
)
## Juntamos ahora toda la información en un solo objeto de R
rse <- SummarizedExperiment(
  assays = SimpleList(counts = counts),
  rowRanges = rowRanges,
  colData = colData
)

#comentario
## Exploremos el objeto resultante
rse

stopifnot(
  identical(
    rse[,c(1,4,6)],
    rse[,c("A","D","F")]
  )
)


# Ejercicio de clase

## Comando 1
## Seleccionala los primeros dos renglones de mi tabla y obtienen el resumen de
## todas las columnas
rse[1:2, ]



## Comando 2
## Devuelve el rse de todos los renglones (genes) de las colúmnas específicadas
## A, D y F.
rse[, c("A", "D", "F")]

## Explora el objeto rse de forma interactiva
library("iSEE")
iSEE::iSEE(rse)

## Ejercicio final

## Descarguemos unos datos de spatialLIBD
sce_layer <- spatialLIBD::fetch_data("sce_layer")

## Explorar los datos
iSEE::iSEE(sce_layer)
## #

Ejercicio
###
