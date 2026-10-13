package com.vitaliaclinic.dao;

import com.vitaliaclinic.model.Usuario;
import com.vitaliaclinic.util.ConexionBD;

import java.sql.Connection;

public class UsuarioDAO {

    public boolean registrarUsuario(Usuario usuario) {

        try {

            Connection conexion =
                    ConexionBD.obtenerConexion();

            conexion.close();

            return true;

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }
}