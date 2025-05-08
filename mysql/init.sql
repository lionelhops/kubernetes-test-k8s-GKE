CREATE DATABASE IF NOT EXISTS mydb;
USE mydb;
CREATE TABLE IF NOT EXISTS books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL
);
INSERT INTO books (title, author) VALUES
('Cien Años de Soledad', 'Gabriel García Márquez'),
('Don Quijote de la Mancha', 'Miguel de Cervantes'),
('La Sombra del Viento', 'Carlos Ruiz Zafón'),
('Pedro Páramo', 'Juan Rulfo'),
('Rayuela', 'Julio Cortázar'),
('1984', 'George Orwell'),
('Fahrenheit 451', 'Ray Bradbury'),
('Crónica de una Muerte Anunciada', 'Gabriel García Márquez'),
('El Aleph', 'Jorge Luis Borges'),
('La Ciudad y los Perros', 'Mario Vargas Llosa'),
('Ensayo sobre la Ceguera', 'José Saramago'),
('Los Detectives Salvajes', 'Roberto Bolaño'),
('El Amor en los Tiempos del Cólera', 'Gabriel García Márquez'),
('El Principito', 'Antoine de Saint-Exupéry'),
('Orgullo y Prejuicio', 'Jane Austen'),
('Matar a un Ruiseñor', 'Harper Lee'),
('La Odisea', 'Homero'),
('El Gran Gatsby', 'F. Scott Fitzgerald'),
('Drácula', 'Bram Stoker'),
('Frankenstein', 'Mary Shelley');