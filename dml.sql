INSERT INTO Departamento (Id_Departamento, Nombre)
VALUES
(1, 'Departamento A'),
(2, 'Departamento B'),
(3, 'Departamento C');

INSERT INTO Terminal (Id_Terminal, Nombre, Id_Departamento)
VALUES
(1, 'Terminal Central', 1),
(2, 'Terminal Norte', 2),
(3, 'Terminal Sur', 3);

INSERT INTO Bus (Id_Bus, Marca, Tipo, Capacidad_asientos)
VALUES
(1, 'Volvo', 'Tipo 1', 30),
(2, 'Marcopolo', 'Tipo 2', 25),
(3, 'Yonyohn', 'Tipo 3', 35),
(4, 'Volkswagen', 'Tipo 1', 40),  
(5, 'Ferrari', 'Tipo 2', 37),  
(6, 'Chevrolet', 'Tipo 3', 28), 
(7, 'YingTong', 'Tipo 4', 36);

INSERT INTO Destino (Id_Destino, Importe_Viaje, Fecha_Hora_Salida, Duracion_Aproximada, Informacion_General, Terminal_Origen, Terminal_Destino, Id_Bus)
VALUES
(1, 100, '2024-11-15 08:00', 4, 'Viaje a la playa', 1, 2, 1),
(2, 150, '2024-11-16 09:00', 6, 'Viaje a la montaña', 2, 3, 2),
(3, 120, '2024-11-17 10:00', 5, 'Viaje a la ciudad histórica', 3, 1, 3),
(4, 100, '2024-11-14 08:00', 4, 'Viaje al Cerro', 1, 2, 1),  
(5, 150, '2024-11-15 09:00', 6, 'Viaje a la cascada', 2, 3, 2),  
(6, 120, '2024-11-14 10:00', 5, 'Viaje al centro', 3, 1, 4),
(255, 1200, '2024-11-14 19:00', 5, 'Viaje al centro del mundo', 3, 1, 4);

INSERT INTO Asiento (Id_Asiento, Numero_Fila, Letra, Id_Bus)
VALUES
(1, 1, 'A', 1),
(2, 1, 'B', 1),
(3, 1, 'C', 2),
(4, 2, 'A', 2),
(5, 2, 'B', 3);

INSERT INTO Turista (Id_Usuario, Nombre, Primer_Apellido, Segundo_Apellido, Tipo_Documento, Numero_Documento, Fecha_Nacimiento, Correo_Electronico, Contrasenia, Categoria)
VALUES
(1, 'Juan', 'Pérez', 'González', 'DNI', '12345678', '1985-04-12', 'juanperez@email.com', 'password123', 'Mercosur'),
(2, 'Ana', 'Gómez', 'Martínez', 'DNI', '87654321', '1990-09-23', 'anagomez@email.com', 'password456', 'Mercosur'),
(3, 'Luis', 'Martínez', 'Ramírez', 'DNI', '11223344', '1982-02-01', 'luismartinez@email.com', 'password789', 'Mercosur'),
(4, 'Juan', 'Pérez', 'González', 'DNI', '12345678', '1990-05-15', 'soyturista@gmail.com', 'password123', 'Mercosur');;

INSERT INTO Pasaje (Id_Pasaje, Fecha_Compra, Estado, Id_Usuario, Id_Destino, Id_Asiento)
VALUES
(1, '2024-11-01', 'No Utilizado', 1, 1, 1),
(2, '2024-11-02', 'Utilizado', 2, 2, 3),
(3, '2024-11-03', 'No Utilizado', 3, 3, 5),
(4, '2024-11-01', 'No Utilizado', 1, 2, 2),
(5, '2024-11-01', 'Utilizado', 1, 1, 1),
(6, '2024-11-02', 'Utilizado', 1, 2, 2),
(7, '2024-11-03', 'Utilizado', 1, 3, 3),
(8, '2024-11-04', 'Utilizado', 1, 4, 4),
(9, '2024-11-05', 'Utilizado', 1, 5, 5),
(10, '2024-11-06', 'Utilizado', 1, 6, 3),
(11, '2024-11-01', 'No Utilizado', 2, 1, 1),
(12, '2024-11-02', 'Utilizado', 2, 2, 2),
(13, '2024-11-01', 'No Utilizado', 3, 1, 1),
(14, '2024-11-02', 'No Utilizado', 3, 2, 2),
(15, '2024-11-03', 'Utilizado', 3, 3, 3),
(16, '2024-11-04', 'Utilizado', 3, 255, 4),
(17, '2024-11-05', 'No Utilizado', 3, 5, 5),
(18, '2024-11-01', 'No Utilizado', 4, 255, 1),
(19, '2017-09-01', 'No Utilizado', 4, 4, 2), 
(20, '2017-09-05', 'No Utilizado', 3, 5, 1), 
(21, '2017-09-10', 'No Utilizado', 4, 2, 1),  
(22, '2017-09-12', 'No Utilizado', 4, 255, 2);  


INSERT INTO Beneficio_Mercosur (Id_Beneficio, Descripcion)
VALUES
(1, 'Descuento en tarifas de viaje'),
(2, 'Acceso prioritario a terminales');

INSERT INTO Turista_Beneficio_Mercosur (Id_Turista, Id_Beneficio)
VALUES
(1, 1),
(2, 2),
(3, 1);