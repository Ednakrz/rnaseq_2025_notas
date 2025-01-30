###
## Load recount3 R package
library("recount3")

## Revisemos todos los proyectos con datos de humano en recount3
human_projects <- available_projects()

## Encuentra tu proyecto de interés. Aquí usaremos
## SRP009615 de ejemplo
proj_info <- subset(
  human_projects,
  project == "SRP009615" & project_type == "data_sources"
)

## Crea un objeto de tipo RangedSummarizedExperiment (RSE)
## con la información a nivel de genes
rse_gene_SRP009615 <- create_rse(proj_info) # el create rse tiene que ser un
#dataframe y de un solo renglón

## Explora el objeto RSE

rse_gene_SRP009615


metadata(rse_gene_SRP009615)
rowRanges(rse_gene_SRP009615)

## Explora los proyectos disponibles de forma interactiva
proj_info_interactive <- interactiveDisplayBase::display(human_projects)
## Selecciona un solo renglón en la tabla y da click en "send".

## Aquí verificamos que solo seleccionaste un solo renglón.
stopifnot(nrow(proj_info_interactive) == 1)
## Crea el objeto RSE
rse_gene_interactive <- create_rse(proj_info_interactive)
