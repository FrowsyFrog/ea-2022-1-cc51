library(ggplot2)
# ¿Cuántas reservas incluyen niños y/o bebes?

children_rows <- nrow(hotel_data_pre3[hotel_data_pre3$children > 0,])
babies_rows <- nrow(hotel_data_pre3[hotel_data_pre3$babies > 0,])
children_babies_rows <-
nrow(hotel_data_pre3[hotel_data_pre3$children > 0 |
hotel_data_pre3$babies > 0,])
total_rows <- nrow(hotel_data_pre3)

matrix_comp <- matrix(c(
    children_rows, total_rows - children_rows,
    babies_rows, total_rows - babies_rows,
    children_babies_rows, total_rows - children_babies_rows),
    ncol = 3, byrow = FALSE
)

barplot(
    matrix_comp,
    col = c("#0072B2", "#b5b5b5"),
    legend = c("Total de reservas", "Reservas\ncon niños\ny/o bebes\n"),
    main = "Reservas con niños y/o bebes",
    ylab = "Cantidad de reservas",
    names = c("Niños", "Bebes", "Niños y/o bebes"),
)

View(matrix_comp)
#Como se puede observar en la matrix comarativa, siendo la primera fila
#la cantidad de reservas con niños y/o bebes, la segunda fila la cantidad
# restante de reservas. Podemos observar que la cantidad de reservas que
# incluyen niños y/o bebes.