package com.vitaliaclinic.servlet;

import com.vitaliaclinic.dao.HistorialSolicitudDAO;
import com.vitaliaclinic.dao.SolicitudDAO;

import com.vitaliaclinic.model.HistorialSolicitud;
import com.vitaliaclinic.model.Solicitud;
import com.vitaliaclinic.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/gerencia")
public class GerenciaServlet extends HttpServlet {

    private SolicitudDAO solicitudDAO;
    private HistorialSolicitudDAO historialDAO;

    @Override
    public void init() {

        solicitudDAO = new SolicitudDAO();

        historialDAO = new HistorialSolicitudDAO();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String accion =
                request.getParameter("accion");

        if ("detalle".equals(accion)) {

            int idSolicitud =
                    Integer.parseInt(
                            request.getParameter("id")
                    );

            Solicitud solicitudSeleccionada =
                    solicitudDAO.buscarPorId(
                            idSolicitud
                    );

            request.setAttribute(
                    "solicitudSeleccionada",
                    solicitudSeleccionada
            );
        }

        List<Solicitud> solicitudes =
                solicitudDAO.listarSolicitudes();

        request.setAttribute(
                "solicitudes",
                solicitudes
        );

        request.getRequestDispatcher(
                "/jsp/gerencia.jsp"
        ).forward(
                request,
                response
        );
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String accion =
                request.getParameter("accion");

        int idSolicitud =
                Integer.parseInt(
                        request.getParameter(
                                "idSolicitud"
                        )
                );

        Usuario usuarioSesion =
                (Usuario) request
                        .getSession()
                        .getAttribute("usuario");

        if (usuarioSesion == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/jsp/login.jsp"
            );

            return;
        }

        Integer idUsuarioGestor =
                usuarioSesion.getIdUsuario();

        Solicitud solicitud =
                solicitudDAO.buscarPorId(
                        idSolicitud
                );

        if (solicitud == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/gerencia"
            );

            return;
        }

        if ("aprobar".equals(accion)) {

            solicitudDAO.aprobarSolicitud(
                    idSolicitud,
                    idUsuarioGestor
            );

            HistorialSolicitud historial =
                    new HistorialSolicitud();

            historial.setIdSolicitud(
                    idSolicitud
            );

            historial.setAccion(
                    "APROBADA"
            );

            historial.setComentario(
                    "Solicitud aprobada por gerencia."
            );

            historial.setIdUsuarioSolicitante(
                    solicitud.getIdUsuarioSolicitante()
            );

            historial.setIdUsuarioGestor(
                    idUsuarioGestor
            );

            historialDAO.registrarHistorial(
                    historial
            );
        }

        if ("rechazar".equals(accion)) {

            solicitudDAO.rechazarSolicitud(
                    idSolicitud,
                    idUsuarioGestor
            );

            HistorialSolicitud historial =
                    new HistorialSolicitud();

            historial.setIdSolicitud(
                    idSolicitud
            );

            historial.setAccion(
                    "RECHAZADA"
            );

            historial.setComentario(
                    "Solicitud rechazada por gerencia."
            );

            historial.setIdUsuarioSolicitante(
                    solicitud.getIdUsuarioSolicitante()
            );

            historial.setIdUsuarioGestor(
                    idUsuarioGestor
            );

            historialDAO.registrarHistorial(
                    historial
            );
        }

        response.sendRedirect(
                request.getContextPath()
                + "/gerencia"
        );
    }
}