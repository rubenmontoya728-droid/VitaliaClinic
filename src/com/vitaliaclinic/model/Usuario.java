package com.vitaliaclinic.model;

public class Usuario {

    private int idUsuario;
    private int idRol;

    private String nombreCompleto;
    private String correo;
    private String clave;
    private String estado;

    public Usuario() {
    }

    public Usuario(int idUsuario, int idRol,
                   String nombreCompleto,
                   String correo,
                   String clave,
                   String estado) {

        this.idUsuario = idUsuario;
        this.idRol = idRol;
        this.nombreCompleto = nombreCompleto;
        this.correo = correo;
        this.clave = clave;
        this.estado = estado;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}