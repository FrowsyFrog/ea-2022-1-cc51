barplot(
  table(hotel_data_pre3$required_car_parking_spaces),
  col = c("#0072B2"),
  main = "Estacionamientos solicitados por reserva",
  xlab = "Cantidad de estacionamientos solicitados",
  ylab = "Frecuencia",
)
