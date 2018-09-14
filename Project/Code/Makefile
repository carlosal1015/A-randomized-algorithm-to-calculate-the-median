# Directorios
BIN=bin
INC=include
OBJ=obj
SRC=src

# Compilador y opciones
CXX=gcc
CXX_FLAGS=-c -I${INC}

all: ${BIN}/programa

${BIN}/programa: ${OBJ}/main.o ${OBJ}/functions.o 					# Dependencias del programa
	${CXX} -o ${BIN}/programa ${OBJ}/main.o ${OBJ}/functions.o

${OBJ}/main.o:
	${CXX} ${CXX_FLAGS} ${SRC}/main.c -o ${OBJ}/main.o 				# Creando objetos de main.

${OBJ}/functions.o:
	${CXX} ${CXX_FLAGS} ${SRC}/functions.c -o ${OBJ}/functions.o	# Creando objetos de functions

clean:																# Sin dependencias
	rm -r ${OBJ}/*
	rm -r ${BIN}/*