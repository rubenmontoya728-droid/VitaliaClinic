package com.vitaliaclinic.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {

    private static final String URL =
            "jdbc:mariadb://localhost:3306/vitaliaclinic";

    private static final String USUARIO =
            "root";

    private static final String CLAVE =
            "";

    public static Connection obtenerConexion()
        throws SQLException {
            try {
                Class.forName(
                "org.mariadb.jdbc.Driver");

        } catch (ClassNotFoundException e) {
                throw new SQLException(
                "Driver MariaDB no encontrado",
                e);
    }

    return DriverManager.getConnection(
            URL,
            USUARIO,
            CLAVE);
        }
}