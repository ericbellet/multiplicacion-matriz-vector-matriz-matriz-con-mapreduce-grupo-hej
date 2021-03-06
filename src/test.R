#Ejemplificación del uso de los scripts previamente mencionados.
#Leemos los datasets con .csv ya que si lo leemos con file("", W) lo lee mal
#ya que no lee la primera fila, y esta funcion no tiene un parametro tipo header = F
direccion <- "C:/Users/Eric/Desktop/MapReduce/multiplicacion-matriz-vector-matriz-matriz-con-mapreduce-grupo-hej"
setwd(direccion)
source("src/memlimit.R")


#source("src/productmvSINMEMORIA.R")
unlink(paste(direccion,"/tmp/archivotemporal.csv", sep = ""))

#-------------------------------------------------------------------------
#-------------------------------SIN MANEJO DE MEMORIA-------------------------------
#-------------------------------------------------------------------------

#***********************SIN MANEJO DE MEMORIA MATRIZ*VECTOR  3X3*********************************
A <- read.csv("data/tblAkv3x3.csv", header = FALSE)
x <- read.csv("data/tblxkv3.csv", header = FALSE)
N <- nrow(x)
source("src/productmv.R")
#Introduzca la memoria, recuerde que la memoria minima debe permitir hacer una operacion,
# es decir tomar por lo menos un valor de la matriz y un valor del vector, y poder guardar
# el resultado.
#************************************************************************
memoria <- -1
#************************************************************************

if (memoria > memory.limit()){
  print("La maquina no posee tanta memoria, por lo tanto no se puede realizar las operaciones
        con esta cantidad de memoria.")
}

#Minmemoria <- Una valor matriz  + Un valor Vector    + El maximo resultado de una multiplicacion
minmemoria <- object.size(A[N,]) + object.size(x[N,]) + object.size(max(A[,ncol(A)]) * max(x[,2]))

memoria <- memlimit(memoria)
if (memoria < minmemoria){
  print("No hay suficiente memoria para realizar una operacion")
}

#Llamo a producmv
resultadomv <- productmv(A, x, N, memoria)
cat("El resultado de A*x 3x3 sin manejo de memoria es: " )
resultadomv

#Borro el archivo temporal.
unlink(paste(direccion,"/tmp/archivotemporal.csv", sep = ""))


#***********************SIN MANEJO DE MEMORIA MATRIZ*VECTOR  10X10*********************************
A <- read.csv("data/tblAkv10x10.csv", header = FALSE)
x <- read.csv("data/tblxkv10.csv", header = FALSE)
N <- nrow(x)
source("src/productmv.R")
#Introduzca la memoria, recuerde que la memoria minima debe permitir hacer una operacion,
# es decir tomar por lo menos un valor de la matriz y un valor del vector, y poder guardar
# el resultado.
#************************************************************************
memoria <- -1
#************************************************************************

if (memoria > memory.limit()){
  print("La maquina no posee tanta memoria, por lo tanto no se puede realizar las operaciones
        con esta cantidad de memoria.")
}

#Minmemoria <- Una valor matriz  + Un valor Vector    + El maximo resultado de una multiplicacion
minmemoria <- object.size(A[N,]) + object.size(x[N,]) + object.size(max(A[,ncol(A)]) * max(x[,2]))

memoria <- memlimit(memoria)
if (memoria < minmemoria){
  print("No hay suficiente memoria para realizar una operacion")
}

#Llamo a producmv
resultadomv <- productmv(A, x, N, memoria)
cat("El resultado de A*x 10x10 sin manejo de memoria es: " )
resultadomv
#Borro el archivo temporal.
unlink(paste(direccion,"/tmp/archivotemporal.csv", sep = ""))



#***********************SIN MANEJO DE MEMORIA MATRIZ*MATRIZ 3X3*********************************

A <- read.csv("data/tblAkv3x3.csv", header = FALSE)
B <- read.csv("data/tblAkv3x3.csv", header = FALSE)
N <- 3
source("src/productmm.R")
#Introduzca la memoria, recuerde que la memoria minima debe permitir hacer una operacion,
# es decir tomar por lo menos un valor de la matriz y un valor del vector, y poder guardar
# el resultado.
#************************************************************************
memoria <- -1
#************************************************************************
if (memoria > memory.limit()){
  print("La maquina no posee tanta memoria, por lo tanto no se puede realizar las operaciones
        con esta cantidad de memoria.")
}

#Minmemoria <- Una fila de la matriz  + La matriz B    + El maximo resultado de una multiplicacion n veces
minmemoria <- object.size(A[N,])*N + object.size(B) + (object.size(max(A[,ncol(A)]) * max(B[,ncol(B)])))*N

memoria <- memlimit(memoria)
if (memoria < minmemoria){
  print("No hay suficiente memoria para realizar una operacion")
}

#Llamo a producmv
resultadomm <- productmm(A, B, N, memoria)
cat("El resultado de A*B 3x3 sin manejo de memoria es: " )
resultadomm
#Borro el archivo temporal.
unlink(paste(direccion,"/tmp/archivotemporal.csv", sep = ""))


#***********************SIN MANEJO DE MEMORIA MATRIZ*MATRIZ 10X10*********************************

M <- matrix(1:100,ncol=10, byrow=TRUE)
w <- M %*% M
#w


A <- read.csv("data/tblAkv10x10.csv", header = FALSE)
B <- read.csv("data/tblAkv10x10.csv", header = FALSE)
N <- 10
source("src/productmm.R")
#Introduzca la memoria, recuerde que la memoria minima debe permitir hacer una operacion,
# es decir tomar por lo menos un valor de la matriz y un valor del vector, y poder guardar
# el resultado.
#************************************************************************
memoria <- -1
#************************************************************************
if (memoria > memory.limit()){
  print("La maquina no posee tanta memoria, por lo tanto no se puede realizar las operaciones
        con esta cantidad de memoria.")
}

#Minmemoria <- Una fila de la matriz  + La matriz B    + El maximo resultado de una multiplicacion n veces
minmemoria <- object.size(A[N,])*N + object.size(B) + (object.size(max(A[,ncol(A)]) * max(B[,ncol(B)])))*N

memoria <- memlimit(memoria)
if (memoria < minmemoria){
  print("No hay suficiente memoria para realizar una operacion, sin embargo liberaremos
        memoria para poder ejecutar la operacion")
}

#Llamo a producmv
resultadomm <- productmm(A, B, N, memoria)
cat("El resultado de A*B 10x10 sin manejo de memoria es: " )
resultadomm
#Borro el archivo temporal.
unlink(paste(direccion,"/tmp/archivotemporal.csv", sep = ""))

#********************SIN MANEJO DE MEMORIA MATRIZ*MATRIZ 10X10 IDENTIDAD*********************************

M <- matrix(1:100,ncol=10, byrow=TRUE)
w <- M %*% M
#w


A <- read.csv("data/tblAkv10x10.csv", header = FALSE)
B <- read.csv("data/tblAkv10x10ident.csv", header = FALSE)
N <- 10
source("src/productmm.R")
#Introduzca la memoria, recuerde que la memoria minima debe permitir hacer una operacion,
# es decir tomar por lo menos un valor de la matriz y un valor del vector, y poder guardar
# el resultado.
#************************************************************************
memoria <- -1
#************************************************************************
if (memoria > memory.limit()){
  print("La maquina no posee tanta memoria, por lo tanto no se puede realizar las operaciones
        con esta cantidad de memoria.")
}

#Minmemoria <- Una fila de la matriz  + La matriz B    + El maximo resultado de una multiplicacion n veces
minmemoria <- object.size(A[N,])*N + object.size(B) + (object.size(max(A[,ncol(A)]) * max(B[,ncol(B)])))*N

memoria <- memlimit(memoria)
if (memoria < minmemoria){
  print("No hay suficiente memoria para realizar una operacion, sin embargo liberaremos
        memoria para poder ejecutar la operacion")
}

#Llamo a producmv
resultadomm <- productmm(A, B, N, memoria)
cat("El resultado de A*B 10x10 sin manejo de memoria es: " )
resultadomm
#Borro el archivo temporal.
unlink(paste(direccion,"/tmp/archivotemporal.csv", sep = ""))



#-------------------------------------------------------------------------
#-------------------------------CON MEMORIA-------------------------------
#-------------------------------------------------------------------------



#***********************CON MEMORIA MATRIZ*VECTOR  3X3*********************************
A <- read.csv("data/tblAkv3x3.csv", header = FALSE)
x <- read.csv("data/tblxkv3.csv", header = FALSE)
N <- nrow(x)
source("src/productmv.R")
#Introduzca la memoria, recuerde que la memoria minima debe permitir hacer una operacion,
# es decir tomar por lo menos un valor de la matriz y un valor del vector, y poder guardar
# el resultado.
#************************************************************************
memoria <- 1760 + 1760 
#************************************************************************

if (memoria > memory.limit()){
  print("La maquina no posee tanta memoria, por lo tanto no se puede realizar las operaciones
        con esta cantidad de memoria.")
}

#Minmemoria <- Una valor matriz  + Un valor Vector    + El maximo resultado de una multiplicacion
minmemoria <- object.size(A[N,]) + object.size(x[N,]) + object.size(max(A[,ncol(A)]) * max(x[,2]))

memoria <- memlimit(memoria)
if (memoria < minmemoria){
  print("No hay suficiente memoria para realizar una operacion")
}

#Llamo a producmv
resultadomv <- productmv(A, x, N, memoria)
cat("El resultado de A*x 3x3 con memoria es: " )
resultadomv

#Borro el archivo temporal.
unlink(paste(direccion,"/tmp/archivotemporal.csv", sep = ""))


#***********************CON MEMORIA MATRIZ*VECTOR  10X10*********************************
A <- read.csv("data/tblAkv10x10.csv", header = FALSE)
x <- read.csv("data/tblxkv10.csv", header = FALSE)
N <- nrow(x)
source("src/productmv.R")
#Introduzca la memoria, recuerde que la memoria minima debe permitir hacer una operacion,
# es decir tomar por lo menos un valor de la matriz y un valor del vector, y poder guardar
# el resultado.
#************************************************************************
memoria <- 1888
#************************************************************************

if (memoria > memory.limit()){
  print("La maquina no posee tanta memoria, por lo tanto no se puede realizar las operaciones
        con esta cantidad de memoria.")
}

#Minmemoria <- Una valor matriz  + Un valor Vector    + El maximo resultado de una multiplicacion
minmemoria <- object.size(A[N,]) + object.size(x[N,]) + object.size(max(A[,ncol(A)]) * max(x[,2]))

memoria <- memlimit(memoria)
if (memoria < minmemoria){
  print("No hay suficiente memoria para realizar una operacion")
}

#Llamo a producmv
resultadomv <- productmv(A, x, N, memoria)
cat("El resultado de A*x 10x10 con memoria es: " )
resultadomv
#Borro el archivo temporal.
unlink(paste(direccion,"/tmp/archivotemporal.csv", sep = ""))



#***********************CON MEMORIA MATRIZ*MATRIZ 3X3*********************************
M <- matrix(1:9,ncol=3, byrow=TRUE)
w <- M %*% M
#w

A <- read.csv("data/tblAkv3x3.csv", header = FALSE)
B <- read.csv("data/tblAkv3x3.csv", header = FALSE)
N <- 3
source("src/productmm.R")
#Introduzca la memoria, recuerde que la memoria minima debe permitir hacer una operacion,
# es decir tomar por lo menos un valor de la matriz y un valor del vector, y poder guardar
# el resultado.
#************************************************************************
memoria <- 3944 + 3944 
#************************************************************************
if (memoria > memory.limit()){
  print("La maquina no posee tanta memoria, por lo tanto no se puede realizar las operaciones
        con esta cantidad de memoria.")
}

#Minmemoria <- Una fila de la matriz  + La matriz B    + El maximo resultado de una multiplicacion n veces
minmemoria <- object.size(A[N,])*N + object.size(B) + (object.size(max(A[,ncol(A)]) * max(B[,ncol(B)])))*N

memoria <- memlimit(memoria)
if (memoria < minmemoria){
  print("No hay suficiente memoria para realizar una operacion")
}

#Llamo a producmv
resultadomm <- productmm(A, B, N, memoria)
cat("El resultado de A*B 3x3 con memoria es: " )
resultadomm
#Borro el archivo temporal.
unlink(paste(direccion,"/tmp/archivotemporal.csv", sep = ""))


#***********************CON MEMORIA MATRIZ*MATRIZ 10X10*********************************

M <- matrix(1:100,ncol=10, byrow=TRUE)
w <- M %*% M
#w


A <- read.csv("data/tblAkv10x10.csv", header = FALSE)
B <- read.csv("data/tblAkv10x10.csv", header = FALSE)
N <- 10
source("src/productmm.R")
#Introduzca la memoria, recuerde que la memoria minima debe permitir hacer una operacion,
# es decir tomar por lo menos un valor de la matriz y un valor del vector, y poder guardar
# el resultado.
#************************************************************************
memoria <- 11776
#************************************************************************
if (memoria > memory.limit()){
  print("La maquina no posee tanta memoria, por lo tanto no se puede realizar las operaciones
        con esta cantidad de memoria, sin embargo liberaremos
        memoria para poder ejecutar la operacion.")
}

#Minmemoria <- Una fila de la matriz  + La matriz B    + El maximo resultado de una multiplicacion n veces
minmemoria <- object.size(A[N,])*N + object.size(B) + (object.size(max(A[,ncol(A)]) * max(B[,ncol(B)])))*N

memoria <- memlimit(memoria)
if (memoria < minmemoria){
  print("No hay suficiente memoria para realizar una operacion.")
}

#Llamo a producmv
resultadomm <- productmm(A, B, N, memoria)
cat("El resultado de A*B 10x10 con memoria es: " )
resultadomm
#Borro el archivo temporal.
unlink(paste(direccion,"/tmp/archivotemporal.csv", sep = ""))

#********************CON MEMORIA MATRIZ*MATRIZ 10X10 IDENTIDAD*********************************

M <- matrix(1:100,ncol=10, byrow=TRUE)
w <- M %*% M
#w


A <- read.csv("data/tblAkv10x10.csv", header = FALSE)
B <- read.csv("data/tblAkv10x10ident.csv", header = FALSE)
N <- 10
source("src/productmm.R")
#Introduzca la memoria, recuerde que la memoria minima debe permitir hacer una operacion,
# es decir tomar por lo menos un valor de la matriz y un valor del vector, y poder guardar
# el resultado.
#************************************************************************
memoria <- 11776
#************************************************************************
if (memoria > memory.limit()){
  print("La maquina no posee tanta memoria, por lo tanto no se puede realizar las operaciones
        con esta cantidad de memoria, sin embargo liberaremos
        memoria para poder ejecutar la operacion.")
}

#Minmemoria <- Una fila de la matriz  + La matriz B    + El maximo resultado de una multiplicacion n veces
minmemoria <- object.size(A[N,])*N + object.size(B) + (object.size(max(A[,ncol(A)]) * max(B[,ncol(B)])))*N

memoria <- memlimit(memoria)
if (memoria < minmemoria){
  print("No hay suficiente memoria para realizar una operacion, sin embargo liberaremos
        memoria para poder ejecutar la operacion")
}

#Llamo a producmv
resultadomm <- productmm(A, B, N, memoria)
cat("El resultado de A*B 10x10 con memoria es: " )
resultadomm
#Borro el archivo temporal.
unlink(paste(direccion,"/tmp/archivotemporal.csv", sep = ""))

