CREATE TABLE categorias (
  categoria_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre_categoria varchar(100) NOT NULL
);
-- Datos para la tabla `categorias`
insert into categorias (nombre_categoria) values 
('Novela'), 
('Ciencia Ficción'), 
('Fantasía'), 
('Ensayo');

CREATE TABLE autores (
  autor_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre varchar(100) NOT NULL,
  fecha_nacimiento date NOT NULL,
  nacionalidad varchar(50) NOT NULL
);

-- Datos para la tabla `autores`
insert into autores (nombre, fecha_nacimiento, nacionalidad) values 
('Gabriel García Márquez', '1927-03-06', 'Colombiano'), 
('George Orwell', '1903-06-25', 'Británico'), 
('J.K. Rowling', '1965-07-31', 'Británica'), 
('Isaac Asimov', '1920-01-02', 'Ruso');

CREATE TABLE libros (
  libro_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  titulo varchar(255) NOT NULL,
  autor_id INT NOT NULLL,
  categoria_id INT NOT NULLL,
  anio_publicacion int(11) NOT NULL,
  disponible BOOLEAN DEFAULT true,
  FOREIGN KEY (autor_id) REFERENCES autores(autor_id),
  FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id)
);

-- Datos para la tabla `Libros`
insert into libros (titulo, autor_id, categoria_id, anio_publicacion, disponible) values 
('Cien Años de Soledad', 1, 1, 1997, true), 
('Harry Potter y la Piedra Filosofal', 3, 2, 1997, true), 
('La era de 1984', 2, 2, 1949, true), 
('Fundación', 4, 2, 1951, true), 
('El juego de Ender', 4, 2, 1985, true);

CREATE TABLE usuarios (
  usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre varchar(100) NOT NULL,
  direccion varchar(100) NOT NULL,
  telefono varchar(15) NOT NULL
);

-- Datos para la tabla `Usuarios`
insert into usuarios (nombre, direccion, telefono) values 
('Juan Pérez', 'Calle 123', '555-1234'), 
('Ana Gómez', 'Avenida 456', '555-5678'), 
('Luis Martínez', 'Calle 789', '555-8765'), 
('María López', 'Avenida 321', '555-4321'), 
('Carlos Sánchez', 'Calle 654', '555-3456');


CREATE TABLE prestamos (
  prestamo_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  libro_id INT NOT NULL,
  fecha_prestamo date NOT NULL,
  fecha_devolucion date DEFAULT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
  FOREIGN KEY (libro_id) REFERENCES libros(libro_id)
);

-- Datos para la tabla `Prestamos`
insert into prestamos (usuario_id, libro_id, fecha_prestamo, fecha_devolucion) values 
(1, 1, '2024-08-01', '2024-08-20'), 
(2, 2, '2024-08-05', '2024-08-11'), 
(3, 3, '2024-08-10', '2024-08-23'), 
(4, 4, '2024-08-15', '2024-09-22'), 
(5, 5, '2024-08-20', '2024-08-23');

-- Consulta para obtener todos los libros prestados
UPDATE libros SET disponible = 'false' WHERE id = 3;
update prestamos set fecha_devolucion = '2024-08-20' where prestamo_id = 1;
delete from libros where libro_id = 3;
select * from libros;
select * from autores;

select l.titulo from libros as l 
inner join autores as a 
on l.autor_id = a.autor_id 
where a.nombre like '%Gabriel%';

select * from prestamos where MONTH(fecha_prestamo) = 8 and YEAR(fecha_prestamo) = 2024;