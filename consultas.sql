-- Consulta 1:
SELECT t.Nombre, t.Primer_Apellido, t.Segundo_Apellido, COUNT(p.Id_Pasaje) AS Cantidad_Pasajes
FROM Turista t JOIN Pasaje p ON t.Id_Usuario = p.Id_Usuario
GROUP BY t.Id_Usuario, t.Nombre, t.Primer_Apellido, t.Segundo_Apellido
HAVING COUNT(p.Id_Pasaje) = (
    SELECT MAX(Cantidad_Pasajes)
    FROM (
        SELECT COUNT(Id_Pasaje) AS Cantidad_Pasajes
        FROM Pasaje
        GROUP BY Id_Usuario
    ) AS Consulta_1
);

-- Consulta 2:
SELECT b.*
FROM Bus b
WHERE b.Capacidad_asientos > 35
AND NOT EXISTS (
    SELECT 1
    FROM Destino d
    WHERE d.Id_Bus = b.Id_Bus
    AND CAST(d.Fecha_Hora_Salida AS DATE) = CAST(DATEADD(DAY, 1, GETDATE()) AS DATE)
);

-- Consulta 3:

SELECT t.*
FROM Turista t
JOIN Pasaje p ON t.Id_Usuario = p.Id_Usuario
GROUP BY t.Id_Usuario, t.Nombre, t.Primer_Apellido, t.Segundo_Apellido, t.Tipo_Documento, t.Numero_Documento, t.Fecha_Nacimiento, t.Correo_Electronico, t.Contrasenia, t.Categoria
HAVING COUNT(p.Id_Pasaje) > 5;

-- Consulta 4:

SELECT 
    p.Id_Usuario, 
    t.Nombre, 
    t.Primer_Apellido, 
    t.Segundo_Apellido, 
    a.Id_Asiento, 
    a.Numero_Fila
FROM 
    Pasaje p
JOIN 
    Turista t ON p.Id_Usuario = t.Id_Usuario
JOIN 
    Asiento a ON p.Id_Asiento = a.Id_Asiento
WHERE 
    p.Id_Destino = 255;

-- Consulta 5:

SELECT 
    d.Id_Destino, 
    COUNT(p.Id_Pasaje) AS Cantidad_Pasajes
FROM 
    Pasaje p
JOIN 
    Turista t ON p.Id_Usuario = t.Id_Usuario
JOIN 
    Destino d ON p.Id_Destino = d.Id_Destino
WHERE 
    t.Correo_Electronico = 'soyturista@gmail.com' 
    AND MONTH(p.Fecha_Compra) = 9
    AND YEAR(p.Fecha_Compra) = 2017
GROUP BY 
    d.Id_Destino
ORDER BY 
    d.Id_Destino ASC;