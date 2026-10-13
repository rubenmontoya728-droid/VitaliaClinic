package com.vitaliaclinic.util;

import java.sql.Connection;

public class PruebaConexion {

    public static void main(String[] args) {

        try {

            Connection conexion =
                    ConexionBD.obtenerConexion();

            System.out.println(
                    "Conexion exitosa a VitaliaClinic");

            conexion.close();

        } catch (Exception e) {

            System.out.println(
                    "Error de conexion");

            e.printStackTrace();
        }
    }
}
