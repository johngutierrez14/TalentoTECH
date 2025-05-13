CREATE DATABASE empresa;
USE empresa;

CREATE table cargos(
    cargo_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_cargo VARCHAR(50) NOT NULL,
);

CREATE table empleados(
    empleado_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_empleado VARCHAR(50) NOT NULL,
    cargo_id INT NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (cargo_id) REFERENCES cargos(cargo_id)
);

INSERT INTO cargos (nombre_cargo) VALUES 
('Gerente'), 
('Asistente'), 
('Desarrollador'), 
('Diseñador'), 
('Tester'), 
('Project Manager');
INSERT INTO empleados (nombre_empleado, cargo_id, salario) VALUES 
('Juan Pérez', 1, 5000000.00),
('Ana Gómez', 2, 2500000.00),
('Luis Martínez', 3, 4000000.00),
('María López', 6, 10000000.00),
('Carlos Sánchez', 5, 3250000.00);

select * from empleados;
select * from cargos;
SELECT 
    e.nombre_empleado, 
    c.nombre_cargo, 
    e.salario 
FROM empleados AS e 
INNER JOIN cargos AS c ON e.cargo_id = c.cargo_id 
WHERE e.salario > 3500000;

update empleados set salario = 6500000.00 where empleado_id = 2;
delete from empleados where empleado_id = 3;

SELECT
    e.nombre_empleado
FROM empleados AS e 
INNER JOIN cargos AS c ON e.cargo_id = c.cargo_id
WHERE c.nombre_cargo LIKE '%Gerente%';


select * from empleados where cargo_id = 3;
insert into empleados (nombre_empleado, cargo_id, salario) values ('Martha Lopez', 4, 3500000.00);