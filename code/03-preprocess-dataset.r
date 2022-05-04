#Pre-procesamiento 

#Cargar solo los datos unicos
hotel_data_pre <- unique(hotel_data)

#Convertir todos los datos no utilizables a NA
hotel_data_pre[hotel_data_pre == "NULL"] <- NA
hotel_data_pre[hotel_data_pre == ""] <- NA

#Eliminando redundancia (Undefined es lo mismo que SC segun documentacion)
hotel_data_pre[hotel_data_pre == "Undefined"] <- "SC"

#Convertir datos de tiempo a Date
hotel_data_pre$reservation_status_date <- as.Date(hotel_data_pre$reservation_status_date,"%m/%d/%Y")

#Eliminando la columna company porque mas de el 90% de los datos tenian valores inutilizables
#Ademas, esta columna no afecta a nuestros casos de analisis
hotel_data_pre2 <- subset(hotel_data_pre,select = -company)

#Eliminando filas con valores inutilizables en la columna country(0,41% de los datos)
hotel_data_pre2 <- hotel_data_pre2[!is.na(hotel_data_pre2$country),]

#Convertir datos inutilizables de lead_time al promedio de los normales
hotel_data_pre2$lead_time <- ifelse(is.na(hotel_data_pre2$lead_time), mean(hotel_data_pre2$lead_time, na.rm = TRUE), hotel_data_pre2$lead_time)
#Funciones para cambiar valores NA a valores aleatorios que si existen
rand.valor <- function(x) {
  faltantes <- is.na(x)
  tot.faltantes <- sum(faltantes)
  x.obs <- x[!faltantes]
  valorado <- x
  valorado[faltantes] <- sample(x.obs, tot.faltantes, replace = TRUE)
  return (valorado)
}
random.df <- function(df) {
  nombres <- names(df)
  for (nombre in nombres) {
    df[nombre] <- rand.valor(df[,nombre])
  }
  df
}
#Asignando valores aleatorios a los NA del dataframe
hotel_data_pre2 <- random.df(hotel_data_pre2)
View(hotel_data_pre2)
#Tranformando variables a factores
hotel_data_pre2$ï..hotel <- factor(hotel_data_pre2$ï..hotel)#
hotel_data_pre2$agent <- factor(hotel_data_pre2$agent)#
hotel_data_pre2$is_canceled <- factor(hotel_data_pre2$is_canceled)#
hotel_data_pre2$is_repeated_guest <- factor(hotel_data_pre2$is_repeated_guest)#
hotel_data_pre2$arrival_date_month <- factor(hotel_data_pre2$arrival_date_month)#
hotel_data_pre2$meal <- factor(hotel_data_pre2$meal)#
hotel_data_pre2$country <- factor(hotel_data_pre2$country)#
hotel_data_pre2$market_segment <- factor(hotel_data_pre2$market_segment)#
hotel_data_pre2$distribution_channel <- factor(hotel_data_pre2$distribution_channel)#
hotel_data_pre2$reserved_room_type <- factor(hotel_data_pre2$reserved_room_type)#
hotel_data_pre2$assigned_room_type <- factor(hotel_data_pre2$assigned_room_type)#
hotel_data_pre2$deposit_type <- factor(hotel_data_pre2$deposit_type)#
hotel_data_pre2$customer_type <- factor(hotel_data_pre2$customer_type)#
hotel_data_pre2$reservation_status <- factor(hotel_data_pre2$reservation_status)#

str(hotel_data_pre2)

View(hotel_data_pre2)

#reescalar
#normalizar
#categorizar


hotel_data_pre3 <- hotel_data_pre2
rm.outliers <- function(t, x) {
    i = grep(x,colnames(t))
    while(length(boxplot.stats(t[,i])$out) > 1) {
        t <- t[!t[,i] %in% boxplot.stats(t[,i])$out,]
    }
    return (t)
}
#get index of column lead_time

#Lead_time es una variable, en días, que no deseamos que los valores atípicos la afecten, por la que las removemos
boxplot(hotel_data_pre3$lead_time)
hotel_data_pre3 <- rm.outliers(hotel_data_pre3, "lead_time")
boxplot(hotel_data_pre3$lead_time)

boxplot(hotel_data_pre3$days_in_waiting_list)
hotel_data_pre3 <- rm.outliers(hotel_data_pre3, "days_in_waiting_list")
boxplot(hotel_data_pre3$days_in_waiting_list)

boxplot(hotel_data_pre3$adr)
hotel_data_pre3 <- rm.outliers(hotel_data_pre3, "adr")
boxplot(hotel_data_pre3$adr)

boxplot(hotel_data_pre3$stays_in_weekend_nights)
hotel_data_pre3 <- rm.outliers(hotel_data_pre3, "stays_in_weekend_nights")
boxplot(hotel_data_pre3$stays_in_weekend_nights)

boxplot(hotel_data_pre3$stays_in_week_nights)
hotel_data_pre3 <- rm.outliers(hotel_data_pre3, "stays_in_week_nights")
boxplot(hotel_data_pre3$stays_in_week_nights)

boxplot(hotel_data_pre3$adults)
hotel_data_pre3 <- rm.outliers(hotel_data_pre3, "adults")
boxplot(hotel_data_pre3$adults)

boxplot(hotel_data_pre3$children)
hotel_data_pre3 <- rm.outliers(hotel_data_pre3, "children")
boxplot(hotel_data_pre3$children)

boxplot(hotel_data_pre3$babies)
hotel_data_pre3 <- rm.outliers(hotel_data_pre3, "babies")
boxplot(hotel_data_pre3$babies)

#Son factores (?)
# boxplot(hotel_data_pre3$meal)
# hotel_data_pre3 <- rm.outliers(hotel_data_pre3, "meal")


boxplot(hotel_data_pre3$market_segment) #
boxplot(hotel_data_pre3$distribution_channel) #
boxplot(hotel_data_pre3$is_repeated_guest) #
boxplot(hotel_data_pre3$previous_cancellations) #
boxplot(hotel_data_pre3$previous_bookings_not_canceled) #
boxplot(hotel_data_pre3$reserved_room_type) #
boxplot(hotel_data_pre3$assigned_room_type) #
boxplot(hotel_data_pre3$booking_changes) #
boxplot(hotel_data_pre3$deposit_type) #
boxplot(hotel_data_pre3$customer_type) #
boxplot(hotel_data_pre3$required_car_parking_spaces) #