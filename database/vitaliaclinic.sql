-- =====================================================
-- VitaliaClinic
-- Script principal de base de datos
-- ADSO
-- =====================================================

CREATE DATABASE IF NOT EXISTS vitaliaclinic;
USE vitaliaclinic;

CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255),
    estado VARCHAR(20) NOT NULL DEFAULT 'ACTIVO'
);

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    id_rol INT NOT NULL,

    nombre_completo VARCHAR(150) NOT NULL,
    correo VARCHAR(120) NOT NULL UNIQUE,
    clave VARCHAR(255) NOT NULL,

    estado VARCHAR(20) NOT NULL DEFAULT 'ACTIVO',

    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_usuario_rol
        FOREIGN KEY (id_rol)
        REFERENCES roles(id_rol)
);

CREATE TABLE pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,

    documento VARCHAR(20) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,

    telefono VARCHAR(20),
    correo VARCHAR(120),

    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);