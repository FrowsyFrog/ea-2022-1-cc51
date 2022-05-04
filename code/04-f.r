hotel_data_pre3_cancelados <-c(hotel_data_pre3[hotel_data_pre3$is_canceled=="1",])
hotel_data_pre3_cancelados$arrival_date_month <- ordered(hotel_data_pre3_cancelados$arrival_date_month, levels = month.name)

table(hotel_data_pre3_cancelados$is_canceled, hotel_data_pre3_cancelados$arrival_date_month)

barplot(
  table(hotel_data_pre3_cancelados$is_canceled, hotel_data_pre3_cancelados$arrival_date_month),
  col = c("#0072B2"),
  main = "Cancelaciones de reservas en un mes",
  xlab = "Mes",
  ylab = "Cantidad de cancelaciones",
  names = c("Enero","Febrero", "Marzo", "Abril", "Mayo", "Junio",
  "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre")
)
