CREATE DATABASE IF NOT EXISTS academica_db;
USE academica_db;

-- Tabla Usuario
CREATE TABLE usuario (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         clave VARCHAR(100) NOT NULL,
                         nombre VARCHAR(100) NOT NULL,
                         rol VARCHAR(50) NOT NULL,
                         email VARCHAR(100)
);

-- Datos iniciales Usuario
INSERT INTO usuario (clave, nombre, rol, email) VALUES
                                                    ('admin123', 'Administrador', 'admin', 'admin@ejemplo.com'),
                                                    ('user123', 'Usuario Demo', 'usuario', 'demo@ejemplo.com');

-- Tabla CarreraAcademica
CREATE TABLE carrera_academica (
                                   id INT AUTO_INCREMENT PRIMARY KEY,
                                   nombre VARCHAR(150) NOT NULL,
                                   numCreditos INT,
                                   numAsignaturas INT,
                                   numSemestres INT,
                                   nivelFormacion VARCHAR(50),
                                   titulo VARCHAR(150),
                                   valorSemestre DECIMAL(12,2),
                                   universidad VARCHAR(150),
                                   esAcreditada BOOLEAN,
                                   perfiles TEXT,
                                   areaConocimiento VARCHAR(100)
);

-- Datos iniciales CarreraAcademica
INSERT INTO carrera_academica
(nombre, numCreditos, numAsignaturas, numSemestres, nivelFormacion, titulo, valorSemestre, universidad, esAcreditada, perfiles, areaConocimiento)
VALUES
    ('Ingeniería de Sistemas', 160, 45, 10, 'Pregrado', 'Ingeniero de Sistemas', 3500000, 'Universidad Nacional', true, 'Desarrollador, Analista', 'Tecnología'),
    ('Administración de Empresas', 140, 40, 8, 'Pregrado', 'Administrador de Empresas', 2800000, 'Universidad de los Andes', true, 'Gerente, Consultor', 'Negocios');