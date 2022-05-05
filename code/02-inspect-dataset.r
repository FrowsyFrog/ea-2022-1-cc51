#Inspeccionando el dataset

View(hotel_data)
head(hotel_data, 5)
#Identificando los nombres de los datos
names(hotel_data)

#Viendo los tipos de datos
str(hotel_data)

#Obtener resumen de cada atributo
summary(hotel_data)

#Los outliers y data inutilizable se visualizo en el archivo 03-preprocess-dataset