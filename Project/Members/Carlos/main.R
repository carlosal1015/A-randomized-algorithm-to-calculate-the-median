library(help = "graphics")
options(repr.plot.width=6, repr.plot.height=5)
x <- rnorm(50); y <- rnorm(50)
plot(x,y)

####################################################

names(faithful)     # nombres de las variables
summary(faithful)   # resumen de las variables

summary(mtcars)

library(ggplot2)
names(mpg)

options(repr.plot.width = 6, repr.plot.height = 5)
plot(faithful$eruptions, xlab = "Números muestrales",
     ylab = "Tiempo de erupciones (min)", main = "Tiempo de erupciones Old Faithful")

help("hist")

# Dibujamos un histograma con 20 intervaki
options(repr.plot.width = 6, repr.plot.height = 6)
hist(faithful$eruptions, breaks = 20, xlab = "Tiempo de erupciones (mín)",
     ylab = "cuentas", main = "")

options(repr.plot.width = 6, repr.plot.height = 5)
qplot(x=waiting, data = faithful, binwidth = 3, main = "Esperando el tiempo de la próxima erupción (mín)")

options(repr.plot.width = 6, repr.plot.height = 5)
ggplot(faithful, aes(x = waiting)) + geom_histogram(binwidth = 1)

options(repr.plot.width = 6, repr.plot.height = 5)
sinc = function(x) sin(pi * x)/(pi * x)
curve(sinc, -7, +7)

options(repr.plot.width = 6, repr.plot.height = 5)
# S$x almacena los valores ordenados de city mpg
# S$ix almacena los índices de los valores ordenados

S = sort.int(mpg$cty, index.return = T)
plot(S$x, type = "l", lty = 2, xlab = "N", ylab = "mpg")

# Agregamos una línea a hwy mpg

lines(mpg$hwy[S$ix], lty = 1)
legend("topleft", c("highway mpg", "city mpg"), lty = c(1,2))


#########################################################
