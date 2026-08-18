
USE ITBA;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    department_id INT NOT NULL,
    job_id INT NOT NULL
);

INSERT INTO employees
(employee_id, first_name, last_name, salary, department_id, job_id)
VALUES
(101, 'Juan', 'Perez',        9000,  10, 1),
(102, 'Maria', 'Gomez',      21000,  10, 2),
(103, 'Lucas', 'Fernandez',  12000,  10, 1),
(104, 'Sofia', 'Martinez',   18000,  10, 3),
(105, 'Tomas', 'Rodriguez',  14000,  10, 2),
(106, 'Camila', 'Lopez',     16000,  10, 1),

(107, 'Nicolas', 'Garcia',   10000,  20, 2),
(108, 'Valentina', 'Diaz',   20000,  20, 3),
(109, 'Federico', 'Romero',  13000,  20, 1),
(110, 'Agustina', 'Sanchez', 17000,  20, 2),
(111, 'Martin', 'Torres',    14500,  20, 4),
(112, 'Carolina', 'Ruiz',    15500,  20, 4),
(113, 'Joaquin', 'Castro',   15000,  20, 1),

(114, 'Julieta', 'Molina',   11000,  30, 5),
(115, 'Matias', 'Silva',     19000,  30, 3),
(116, 'Florencia', 'Acosta', 12500,  30, 5),
(117, 'Gonzalo', 'Herrera',  17500,  30, 2),
(118, 'Lucia', 'Medina',     13500,  30, 1),
(119, 'Facundo', 'Vega',     16500,  30, 3),

(120, 'Paula', 'Ramos',       8000,  40, 5),
(121, 'Bruno', 'Navarro',    22000,  40, 3),
(122, 'Delfina', 'Ibarra',   15000,  40, 4);


-- -------------------------- 
-- -------------------------- 
-- -------------------------- 

-- 1)

SELECT first_name,
		last_name,
        salary
FROM employees;


-- 2) 

SELECT first_name,
		last_name,
        salary
FROM employees
WHERE salary > 14000; 

-- 3) 

SELECT DISTINCT 
				department_id
FROM employees; 

-- 4) 

SELECT AVG(salary) AS salario_promedio
FROM employees;

-- 5) 

SELECT
		department_id,
        COUNT(*) AS cantidad_empleados
FROM employees 
GROUP BY department_id
HAVING cantidad_empleados > 5; 


