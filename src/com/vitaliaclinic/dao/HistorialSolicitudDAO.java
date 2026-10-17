package com.vitaliaclinic.dao;

import com.vitaliaclinic.model.HistorialSolicitud;
import com.vitaliaclinic.util.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class HistorialSolicitudDAO {

    public boolean registrarHistorial(
            HistorialSolicitud historial) {

        String sql =
                "INSERT INTO historial_solicitudes ("
                + "id_solicitud, "
                + "accion, "
                + "comentario, "
                + "id_usuario_solicitante, "
                + "id_usuario_gestor"
                + ") VALUES (?, ?, ?, ?, ?)";

        try (
                Connection con =
                        ConexionBD.obtenerConexion();

                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

            ps.setInt(
                    1,
                    historial.getIdSolicitud()
            );

            ps.setString(
                    2,
                    historial.getAccion()
            );

            ps.setString(
                    3,
                    historial.getComentario()
            );

            ps.setInt(
                    4,
                    historial.getIdUsuarioSolicitante()
            );

            ps.setInt(
                    5,
                    historial.getIdUsuarioGestor()
            );

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {

            System.out.println(
                    "Error al registrar historial: "
                    + e.getMessage()
            );

            return false;
        }
    }
}