package com.vitaliaclinic.model;

import java.sql.Timestamp;

public class HistorialSolicitud {

    private int idHistorial;

    private int idSolicitud;

    private Timestamp fechaEvento;

    private String accion;

    private String comentario;

    private int idUsuarioSolicitante;

    private int idUsuarioGestor;

    public HistorialSolicitud() {
    }

    public HistorialSolicitud(
            int idHistorial,
            int idSolicitud,
            Timestamp fechaEvento,
            String accion,
            String comentario,
            int idUsuarioSolicitante,
            int idUsuarioGestor) {

        this.idHistorial = idHistorial;
        this.idSolicitud = idSolicitud;
        this.fechaEvento = fechaEvento;
        this.accion = accion;
        this.comentario = comentario;
        this.idUsuarioSolicitante = idUsuarioSolicitante;
        this.idUsuarioGestor = idUsuarioGestor;
    }

    public int getIdHistorial() {
        return idHistorial;
    }

    public void setIdHistorial(int idHistorial) {
        this.idHistorial = idHistorial;
    }

    public int getIdSolicitud() {
        return idSolicitud;
    }

    public void setIdSolicitud(int idSolicitud) {
        this.idSolicitud = idSolicitud;
    }

    public Timestamp getFechaEvento() {
        return fechaEvento;
    }

    public void setFechaEvento(Timestamp fechaEvento) {
        this.fechaEvento = fechaEvento;
    }

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public int getIdUsuarioSolicitante() {
        return idUsuarioSolicitante;
    }

    public void setIdUsuarioSolicitante(
            int idUsuarioSolicitante) {

        this.idUsuarioSolicitante =
                idUsuarioSolicitante;
    }

    public int getIdUsuarioGestor() {
        return idUsuarioGestor;
    }

    public void setIdUsuarioGestor(
            int idUsuarioGestor) {

        this.idUsuarioGestor =
                idUsuarioGestor;
    }

    @Override
    public String toString() {

        return "HistorialSolicitud{"
                + "idHistorial=" + idHistorial
                + ", idSolicitud=" + idSolicitud
                + ", fechaEvento=" + fechaEvento
                + ", accion='" + accion + '\''
                + ", comentario='" + comentario + '\''
                + ", idUsuarioSolicitante=" + idUsuarioSolicitante
                + ", idUsuarioGestor=" + idUsuarioGestor
                + '}';
    }
}