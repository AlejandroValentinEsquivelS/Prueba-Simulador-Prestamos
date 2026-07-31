--Crear tabla Usuarios
CREATE TABLE Usuarios ( id_usuario INT PRIMARY KEY, nombre VARCHAR(100), correo VARCHAR(100), fecha_registro DATE);

--Crear tabla Prestamos
CREATE TABLE Prestamos ( id_prestamo INT PRIMARY KEY, id_usuario INT, monto DECIMAL(10,2), estatus VARCHAR(20), FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario));

--Insertar registros en la tabla de Usuarios
INSERT INTO Usuarios (id_usuario, nombre, correo, fecha_registro) VALUES
(1, 'Ana López', 'ana@example.com', '2024-01-15'),
(2, 'Carlos Pérez', 'carlos@example.com', '2024-02-10'),
(3, 'María Gómez', 'maria@example.com', '2024-03-05'),
(4, 'Luis Hernández', 'luis@example.com', '2024-04-20');

--Insertar registros en la tabla de Prestamos
INSERT INTO Prestamos (id_prestamo, id_usuario, monto, estatus) VALUES
(101, 1, 5000.00, 'Aprobado'),
(102, 1, 3000.00, 'Pendiente'),
(103, 2, 7000.00, 'Aprobado'),
(104, 2, 2000.00, 'Rechazado'),
(105, 3, 4000.00, 'Pendiente'),
(106, 4, 10000.00, 'Aprobado'),
(107, 4, 2500.00, 'Aprobado');


--Consultas SQL 
--usuarios con prestamos aprobados
SELECT nombre, correo FROM usuarios u JOIN prestamos p ON u.id_usuario=p.id_usuario WHERE p.estatus='Aprobado' GROUP BY u.nombre, u.correo;

--Suma total acumulada de los montos de préstamos aprobados por cada usuario ordenados de mayor a menor
SELECT u.nombre, SUM(p.monto) AS total_aprobado FROM Usuarios u JOIN Prestamos p ON u.id_usuario = p.id_usuario WHERE p.estatus = 'Aprobado' GROUP BY u.nombre ORDER BY total_aprobado DESC;
