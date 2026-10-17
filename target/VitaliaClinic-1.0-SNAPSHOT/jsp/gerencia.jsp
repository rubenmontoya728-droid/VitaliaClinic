<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.vitaliaclinic.model.Solicitud" %>
<%
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
        return;
    }
    List<Solicitud> solicitudes = (List<Solicitud>) request.getAttribute("solicitudes");
    Solicitud solicitudSeleccionada = (Solicitud) request.getAttribute("solicitudSeleccionada");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Aprobaciones de Solicitud (RF16) - Vitalia Clínica</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Styles2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylegerencia.css">
</head>
<body>
    <div class="sidebar">
        <div class="logo-area">
            <img src="${pageContext.request.contextPath}/img/Vitalia.jpg" alt="Vitalia Clínica" class="logo-image">
            <div class="logo-text">
                <strong>Vitalia Clínica</strong>
                <span>Panel Principal</span>
            </div>
        </div>
        <ul class="menu">
            <li><a href="${pageContext.request.contextPath}/jsp/dashboard.jsp" class="menu-button">Inicio</a></li>
            <li><a href="${pageContext.request.contextPath}/gerencia" class="active menu-button menu-button-active">Aprobaciones</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/gerencia_asignacion.jsp" class="menu-button">Asignación de Turnos</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/gerenciacomunicados.jsp" class="menu-button">Comunicados Vitalia</a></li>
            <li><a href="${pageContext.request.contextPath}/logout" class="menu-button">Salir</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="topbar">
            <h2>Aprobaciones de Solicitud (RF16)</h2>
            <div class="user-info">
                Gerente: ${sessionScope.usuario.nombreCompleto}
            </div>
        </div>
        <div class="content-box">
            <h2>Pendientes por Aprobar</h2>
            <p style="margin-bottom: 15px; color: #666; font-size: 0.95rem;">Solicitudes pendientes por revisar: <strong><%= solicitudes != null ? solicitudes.size() : 0 %></strong></p>

            <div class="filters-container">
                <div class="filter-group">
                    <label for="filtroTipo">Filtrar por Tipo</label>
                    <select id="filtroTipo" class="filter-select">
                        <option value="">Todos los tipos</option>
                    </select>
                </div>
                <div class="filter-group">
                    <label for="filtroPrioridad">Filtrar por Prioridad</label>
                    <select id="filtroPrioridad" class="filter-select">
                        <option value="">Todas las prioridades</option>
                    </select>
                </div>
                <div class="filter-group">
                    <label for="filtroSolicitante">Buscar por Solicitante</label>
                    <input type="text" id="filtroSolicitante" class="filter-input" placeholder="Nombre de solicitante...">
                </div>
            </div>

            <div class="pendientes-container">
                <table id="tablaPendientes" class="table-rf16">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Identificación</th>
                            <th>Departamento</th>
                            <th>Tipo Solicitud</th>
                            <th>Solicitante</th>
                            <th>Fecha</th>
                            <th>Prioridad</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (solicitudes != null && !solicitudes.isEmpty()) {
                                for (Solicitud s : solicitudes) {
                        %>
                        <tr data-tipo="<%= s.getTipoSolicitud() %>" data-prioridad="<%= s.getPrioridad() %>" data-solicitante="<%= s.getNombreSolicitante().toLowerCase() %>">
                            <td><%= s.getIdSolicitud() %></td>
                            <td><%= s.getIdentificacionCompleta() %></td>
                            <td><%= s.getDepartamento() %></td>
                            <td><%= s.getTipoSolicitud() %></td>
                            <td><%= s.getNombreSolicitante() %></td>
                            <td><%= s.getFechaSolicitud() %></td>
                            <td><%= s.getPrioridad() %></td>
                            <td><%= s.getEstado() %></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/gerencia?accion=detalle&id=<%= s.getIdSolicitud() %>" class="btn btn-sm">Revisar</a>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="9" style="text-align: center;">No hay solicitudes pendientes registradas.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <div class="form-section">
                <h3>Detalle de Revisión RF16</h3>
                <form id="formRevision" class="form-rf16" action="${pageContext.request.contextPath}/gerencia" method="POST">
                    <% if (solicitudSeleccionada != null) { %>
                        <input type="hidden" name="idSolicitud" value="<%= solicitudSeleccionada.getIdSolicitud() %>">
                    <% } %>
                    
                    <div class="form-row grid-2">
                        <div class="form-group">
                            <label>Identificación</label>
                            <input type="text" value="<%= solicitudSeleccionada != null ? solicitudSeleccionada.getIdentificacionCompleta() : "" %>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Departamento</label>
                            <input type="text" value="<%= solicitudSeleccionada != null ? solicitudSeleccionada.getDepartamento() : "" %>" readonly>
                        </div>
                    </div>

                    <div class="form-row grid-3">
                        <div class="form-group">
                            <label>Tipo Solicitud</label>
                            <input type="text" value="<%= solicitudSeleccionada != null ? solicitudSeleccionada.getTipoSolicitud() : "" %>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Prioridad</label>
                            <input type="text" value="<%= solicitudSeleccionada != null ? solicitudSeleccionada.getPrioridad() : "" %>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Estado</label>
                            <input type="text" value="<%= solicitudSeleccionada != null ? solicitudSeleccionada.getEstado() : "" %>" readonly>
                        </div>
                    </div>

                    <div class="form-row grid-2">
                        <div class="form-group">
                            <label>Fecha Solicitud</label>
                            <input type="text" value="<%= solicitudSeleccionada != null ? solicitudSeleccionada.getFechaSolicitud() : "" %>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Solicitante</label>
                            <input type="text" value="<%= solicitudSeleccionada != null ? solicitudSeleccionada.getNombreSolicitante() : "" %>" readonly>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Comentarios de Validación</label>
                        <textarea rows="3" readonly><%= solicitudSeleccionada != null && solicitudSeleccionada.getComentarios() != null ? solicitudSeleccionada.getComentarios() : "" %></textarea>
                    </div>

                    <div class="checkbox-group">
                        <label><input type="checkbox" name="revisionLegal"> Departamento Legal</label>
                        <label><input type="checkbox" name="revisionFinanciera"> Departamento Financiero</label>
                        <label><input type="checkbox" name="revisionRRHH"> Recursos Humanos</label>
                    </div>

                    <% if (solicitudSeleccionada != null) { %>
                    <div class="form-buttons">
                        <button type="submit" name="accion" value="rechazar" class="btn-secondary">Solicitar Revisión / Rechazar</button>
                        <button type="submit" name="accion" value="aprobar" class="btn">Aprobar Solicitud</button>
                    </div>
                    <% } %>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const filtroTipo = document.getElementById("filtroTipo");
            const filtroPrioridad = document.getElementById("filtroPrioridad");
            const filtroSolicitante = document.getElementById("filtroSolicitante");
            const filas = document.querySelectorAll("#tablaPendientes tbody tr");

            // Poblar selects dinámicamente según los datos reales de la tabla
            const tiposSet = new Set();
            const prioridadesSet = new Set();

            filas.forEach(fila => {
                const tipo = fila.getAttribute("data-tipo");
                const prioridad = fila.getAttribute("data-prioridad");
                if (tipo) tiposSet.add(tipo);
                if (prioridad) prioridadesSet.add(prioridad);
            });

            tiposSet.forEach(tipo => {
                const opt = document.createElement("option");
                opt.value = tipo;
                opt.textContent = tipo;
                filtroTipo.appendChild(opt);
            });

            prioridadesSet.forEach(prio => {
                const opt = document.createElement("option");
                opt.value = prio;
                opt.textContent = prio;
                filtroPrioridad.appendChild(opt);
            });

            function filtrarTabla() {
                const tipoVal = filtroTipo.value.toLowerCase();
                const prioVal = filtroPrioridad.value.toLowerCase();
                const solVal = filtroSolicitante.value.toLowerCase().trim();

                filas.forEach(fila => {
                    const tipo = (fila.getAttribute("data-tipo") || "").toLowerCase();
                    const prioridad = (fila.getAttribute("data-prioridad") || "").toLowerCase();
                    const solicitante = (fila.getAttribute("data-solicitante") || "");

                    const coincideTipo = !tipoVal || tipo === tipoVal;
                    const coincidePrio = !prioVal || prioridad === prioVal;
                    const coincideSol = !solVal || solicitante.includes(solVal);

                    if (coincideTipo && coincidePrio && coincideSol) {
                        fila.style.display = "";
                    } else {
                        fila.style.display = "none";
                    }
                });
            }

            if (filtroTipo) filtroTipo.addEventListener("change", filtrarTabla);
            if (filtroPrioridad) filtroPrioridad.addEventListener("change", filtrarTabla);
            if (filtroSolicitante) filtroSolicitante.addEventListener("input", filtrarTabla);
        });
    </script>
</body>
</html>