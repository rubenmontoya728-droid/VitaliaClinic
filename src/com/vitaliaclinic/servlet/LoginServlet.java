package com.vitaliaclinic.servlet;

import com.vitaliaclinic.dao.UsuarioDAO;
import com.vitaliaclinic.model.Usuario;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String correo =
                request.getParameter("correo");

        String clave =
                request.getParameter("clave");

        UsuarioDAO usuarioDAO =
                new UsuarioDAO();

        Usuario usuario =
                usuarioDAO.validarLogin(
                        correo,
                        clave);

        if (usuario != null) {

            HttpSession sesion =
                    request.getSession();

            sesion.setAttribute(
                    "usuario",
                    usuario);

            response.sendRedirect(
                    request.getContextPath()
                    + "/jsp/dashboard.jsp");

        } else {

            response.getWriter().println(
                    "LOGIN INCORRECTO");
        }
    }
}