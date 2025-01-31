## ?model.matrix
mat <- with(trees, model.matrix(log(Volume) ~ log(Height) + log(Girth)))
mat

colnames(mat)

summary(lm(log(Volume) ~ log(Height) + log(Girth), data = trees))


## -----------Example 1 --------------------------

## ----------EMM_example1-------------------------


## Datos de ejemplo
(sampleData <- data.frame(
  genotype = rep(c("A", "B"), each = 4),
  treatment = rep(c("ctrl", "trt"), 4)
))


## Creemos las imágenes usando ExploreModelMatrix
vd <- ExploreModelMatrix::VisualizeDesign(
  sampleData = sampleData,
  designFormula = ~ genotype + treatment,
  textSizeFitted = 4
)

## Veamos las imágenes
cowplot::plot_grid(plotlist = vd$plotlist)

mat2 <- with(sampleData, model.matrix(~ genotype + treatment))
mat2
sampleData

cbind(mat2,sampleData)
colnames(mat2)


## Usaremos shiny otra ves
app <- ExploreModelMatrix::ExploreModelMatrix(
  sampleData = sampleData,
  designFormula = ~ genotype + treatment
)
if (interactive()) shiny::runApp(app)


