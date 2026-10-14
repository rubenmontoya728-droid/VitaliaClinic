package com.vitaliaclinic.dao;

import com.vitaliaclinic.model.Usuario;
import com.vitaliaclinic.util.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UsuarioDAO {

    public boolean registrarUsuario(
            Usuario usuario) {

        String sql =
                "INSERT INTO usuarios "
                + "(id_rol, nombre_completo, correo, clave) "
                + "VALUES (?, ?, ?, ?)";

        try {

            Connection conexion =
                    ConexionBD.obtenerConexion();

            PreparedStatement sentencia =
                    conexion.prepareStatement(sql);

            sentencia.setInt(
                    1,
                    1);

            sentencia.setString(
                    2,
                    usuario.getNombreCompleto());

            sentencia.setString(
                    3,
                    usuario.getCorreo());

            sentencia.setString(
                    4,
                    usuario.getClave());

            sentencia.executeUpdate();

            sentencia.close();
            conexion.close();

            return true;

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }
}