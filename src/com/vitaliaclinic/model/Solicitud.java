package com.vitaliaclinic.model;

import java.sql.Timestamp;

public class Solicitud {

    private int idSolicitud;

    private String codigoSolicitud;

    private Timestamp fechaSolicitud;

    private int idUsuarioSolicitante;

    private String nombreSolicitante;

    private String tipoIdentificacion;

    private String numeroIdentificacion;

    private String identificacionCompleta;

    private String departamento;

    private String tipoSolicitud;

    private String prioridad;

    private String comentarios;

    private String estado;

    private Timestamp fechaDecision;

    private Integer idUsuarioDecisor;

    public Solicitud() {
    }

    public Solicitud(
            int idSolicitud,
            String codigoSolicitud,
            Timestamp fechaSolicitud,
            int idUsuarioSolicitante,
            String nombreSolicitante,
            String tipoIdentificacion,
            String numeroIdentificacion,
            String identificacionCompleta,
            String departamento,
            String tipoSolicitud,
            String prioridad,
            String comentarios,
            String estado,
            Timestamp fechaDecision,
            Integer idUsuarioDecisor) {

        this.idSolicitud = idSolicitud;
        this.codigoSolicitud = codigoSolicitud;
        this.fechaSolicitud = fechaSolicitud;
        this.idUsuarioSolicitante = idUsuarioSolicitante;
        this.nombreSolicitante = nombreSolicitante;
        this.tipoIdentificacion = tipoIdentificacion;
        this.numeroIdentificacion = numeroIdentificacion;
        this.identificacionCompleta = identificacionCompleta;
        this.departamento = departamento;
        this.tipoSolicitud = tipoSolicitud;
        this.prioridad = prioridad;
        this.comentarios = comentarios;
        this.estado = estado;
        this.fechaDecision = fechaDecision;
        this.idUsuarioDecisor = idUsuarioDecisor;
    }

    public int getIdSolicitud() {
        return idSolicitud;
    }

    public void setIdSolicitud(int idSolicitud) {
        this.idSolicitud = idSolicitud;
    }

    public String getCodigoSolicitud() {
        return codigoSolicitud;
    }

    public void setCodigoSolicitud(String codigoSolicitud) {
        this.codigoSolicitud = codigoSolicitud;
    }

    public Timestamp getFechaSolicitud() {
        return fechaSolicitud;
    }

    public void setFechaSolicitud(Timestamp fechaSolicitud) {
        this.fechaSolicitud = fechaSolicitud;
    }

    public int getIdUsuarioSolicitante() {
        return idUsuarioSolicitante;
    }

    public void setIdUsuarioSolicitante(int idUsuarioSolicitante) {
        this.idUsuarioSolicitante = idUsuarioSolicitante;
    }

    public String getNombreSolicitante() {
        return nombreSolicitante;
    }

    public void setNombreSolicitante(String nombreSolicitante) {
        this.nombreSolicitante = nombreSolicitante;
    }

    public String getTipoIdentificacion() {
        return tipoIdentificacion;
    }

    public void setTipoIdentificacion(String tipoIdentificacion) {
        this.tipoIdentificacion = tipoIdentificacion;
    }

    public String getNumeroIdentificacion() {
        return numeroIdentificacion;
    }

    public void setNumeroIdentificacion(String numeroIdentificacion) {
        this.numeroIdentificacion = numeroIdentificacion;
    }

    public String getIdentificacionCompleta() {
        return identificacionCompleta;
    }

    public void setIdentificacionCompleta(String identificacionCompleta) {
        this.identificacionCompleta = identificacionCompleta;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public String getTipoSolicitud() {
        return tipoSolicitud;
    }

    public void setTipoSolicitud(String tipoSolicitud) {
        this.tipoSolicitud = tipoSolicitud;
    }

    public String getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }

    public String getComentarios() {
        return comentarios;
    }

    public void setComentarios(String comentarios) {
        this.comentarios = comentarios;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Timestamp getFechaDecision() {
        return fechaDecision;
    }

    public void setFechaDecision(Timestamp fechaDecision) {
        this.fechaDecision = fechaDecision;
    }

    public Integer getIdUsuarioDecisor() {
        return idUsuarioDecisor;
    }

    public void setIdUsuarioDecisor(Integer idUsuarioDecisor) {
        this.idUsuarioDecisor = idUsuarioDecisor;
    }

    @Override
    public String toString() {
        return "Solicitud{"
                + "idSolicitud=" + idSolicitud
                + ", codigoSolicitud='" + codigoSolicitud + '\''
                + ", fechaSolicitud=" + fechaSolicitud
                + ", idUsuarioSolicitante=" + idUsuarioSolicitante
                + ", nombreSolicitante='" + nombreSolicitante + '\''
                + ", tipoIdentificacion='" + tipoIdentificacion + '\''
                + ", numeroIdentificacion='" + numeroIdentificacion + '\''
                + ", identificacionCompleta='" + identificacionCompleta + '\''
                + ", departamento='" + departamento + '\''
                + ", tipoSolicitud='" + tipoSolicitud + '\''
                + ", prioridad='" + prioridad + '\''
                + ", comentarios='" + comentarios + '\''
                + ", estado='" + estado + '\''
                + ", fechaDecision=" + fechaDecision
                + ", idUsuarioDecisor=" + idUsuarioDecisor
                + '}';
    }
}