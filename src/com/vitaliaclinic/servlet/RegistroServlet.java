package com.vitaliaclinic.servlet;

import com.vitaliaclinic.dao.UsuarioDAO;
import com.vitaliaclinic.model.Usuario;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegistroServlet extends HttpServlet {

    @Override
    protected void doGet(
        HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

            response.getWriter().println("RegistroServlet funcionando correctamente");
        }

    @Override
    protected void doPost(
        HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

            String nombreCompleto =
                    request.getParameter("nombreCompleto");

            String correo =
                    request.getParameter("correo");

            String clave =
                    request.getParameter("clave");
            Usuario usuario = new Usuario();

            usuario.setNombreCompleto(nombreCompleto);
            usuario.setCorreo(correo);
            usuario.setClave(clave);

            UsuarioDAO usuarioDAO = new UsuarioDAO();
            boolean resultado = usuarioDAO.registrarUsuario(usuario);
            
            if (resultado) {

                response.getWriter().println(
                        "Usuario registrado correctamente");

            } else {

                response.getWriter().println(
                        "Error al registrar usuario");
            }
        }
}