package com.vitaliaclinic.dao;

import com.vitaliaclinic.model.Solicitud;
import com.vitaliaclinic.util.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

public class SolicitudDAO {

        public List<Solicitud> listarSolicitudes() {

        List<Solicitud> solicitudes = new ArrayList<>();

        String sql =
                "SELECT " +
                "s.*, " +
                "u.nombre_completo, " +
                "u.numero_identificacion, " +
                "ti.codigo AS tipo_identificacion " +
                "FROM solicitudes s " +
                "INNER JOIN usuarios u " +
                "ON s.id_usuario_solicitante = u.id_usuario " +
                "INNER JOIN tipos_identificacion ti " +
                "ON u.id_tipo_identificacion = ti.id_tipo_identificacion " +
                "WHERE s.estado = 'PENDIENTE' " +
                "ORDER BY s.fecha_solicitud DESC";

        try (
                Connection con = ConexionBD.obtenerConexion();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()
        ) {

        while (rs.next()) {

                Solicitud s = new Solicitud();

                s.setIdSolicitud(rs.getInt("id_solicitud"));
                s.setCodigoSolicitud(rs.getString("codigo_solicitud"));
                s.setFechaSolicitud(rs.getTimestamp("fecha_solicitud"));

                s.setIdUsuarioSolicitante(
                        rs.getInt("id_usuario_solicitante")
                );

                s.setNombreSolicitante(
                        rs.getString("nombre_completo")
                );

                s.setTipoIdentificacion(
                        rs.getString("tipo_identificacion")
                );

                s.setNumeroIdentificacion(
                        rs.getString("numero_identificacion")
                );

                s.setIdentificacionCompleta(
                        rs.getString("tipo_identificacion")
                        + " "
                        + rs.getString("numero_identificacion")
                );

                s.setDepartamento(
                        rs.getString("departamento")
                );

                s.setTipoSolicitud(
                        rs.getString("tipo_solicitud")
                );

                s.setPrioridad(
                        rs.getString("prioridad")
                );

                s.setComentarios(
                        rs.getString("comentarios")
                );

                s.setEstado(
                        rs.getString("estado")
                );

                s.setFechaDecision(
                        rs.getTimestamp("fecha_decision")
                );

                s.setIdUsuarioDecisor(
                        (Integer) rs.getObject("id_usuario_decisor")
                );

                solicitudes.add(s);
        }

        } catch (SQLException e) {

                System.out.println(
                        "Error al listar solicitudes: "
                        + e.getMessage()
                );
        }

        return solicitudes;
        }

        public Solicitud buscarPorId(int idSolicitud) {

        String sql =
                "SELECT " +
                "s.*, " +
                "u.nombre_completo, " +
                "u.numero_identificacion, " +
                "ti.codigo AS tipo_identificacion " +
                "FROM solicitudes s " +
                "INNER JOIN usuarios u " +
                "ON s.id_usuario_solicitante = u.id_usuario " +
                "INNER JOIN tipos_identificacion ti " +
                "ON u.id_tipo_identificacion = ti.id_tipo_identificacion " +
                "WHERE s.id_solicitud = ?";

        try (
                Connection con = ConexionBD.obtenerConexion();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, idSolicitud);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    Solicitud s = new Solicitud();

                    s.setIdSolicitud(rs.getInt("id_solicitud"));
                    s.setCodigoSolicitud(rs.getString("codigo_solicitud"));
                    s.setFechaSolicitud(rs.getTimestamp("fecha_solicitud"));

                    s.setIdUsuarioSolicitante(
                            rs.getInt("id_usuario_solicitante")
                    );

                    s.setNombreSolicitante(
                            rs.getString("nombre_completo")
                    );

                    s.setTipoIdentificacion(
                            rs.getString("tipo_identificacion")
                    );

                    s.setNumeroIdentificacion(
                            rs.getString("numero_identificacion")
                    );

                    s.setIdentificacionCompleta(
                            rs.getString("tipo_identificacion")
                            + " "
                            + rs.getString("numero_identificacion")
                    );

                    s.setDepartamento(
                            rs.getString("departamento")
                    );

                    s.setTipoSolicitud(
                            rs.getString("tipo_solicitud")
                    );

                    s.setPrioridad(
                            rs.getString("prioridad")
                    );

                    s.setComentarios(
                            rs.getString("comentarios")
                    );

                    s.setEstado(
                            rs.getString("estado")
                    );

                    s.setFechaDecision(
                            rs.getTimestamp("fecha_decision")
                    );

                    s.setIdUsuarioDecisor(
                            (Integer) rs.getObject("id_usuario_decisor")
                    );

                    return s;
                }
            }

        } catch (SQLException e) {

            System.out.println(
                    "Error al buscar solicitud: "
                    + e.getMessage()
            );
        }

        return null;
    }
    public boolean actualizarEstado(
                int idSolicitud,
                String estado,
                Integer idUsuarioDecisor) {

        String sql =
                "UPDATE solicitudes " +
                "SET estado = ?, " +
                "fecha_decision = CURRENT_TIMESTAMP, " +
                "id_usuario_decisor = ? " +
                "WHERE id_solicitud = ?";

        try (
                Connection con =
                        ConexionBD.obtenerConexion();

                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

                ps.setString(1, estado);

                ps.setObject(2, idUsuarioDecisor);

                ps.setInt(3, idSolicitud);

                return ps.executeUpdate() > 0;

        } catch (SQLException e) {

                System.out.println(
                        "Error al actualizar estado: "
                        + e.getMessage()
                );

                return false;
        }
        }
        public boolean aprobarSolicitud(
                int idSolicitud,
                Integer idUsuarioDecisor) {

                return actualizarEstado(
                        idSolicitud,
                        "APROBADA",
                        idUsuarioDecisor
                );
        }
        public boolean rechazarSolicitud(
                int idSolicitud,
                Integer idUsuarioDecisor) {

                return actualizarEstado(
                        idSolicitud,
                        "RECHAZADA",
                        idUsuarioDecisor
                );
        }
}