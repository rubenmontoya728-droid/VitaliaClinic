<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Comunicados Vitalia (RF18) - Vitalia Clínica</title>
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
            <li><a href="${pageContext.request.contextPath}/gerencia" class="menu-button">Aprobaciones</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/gerencia_asignacion.jsp" class="menu-button">Asignación de Turnos</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/gerencia_comunicados.jsp" class="active menu-button menu-button-active">Comunicados Vitalia</a></li>
            <li><a href="${pageContext.request.contextPath}/logout" class="menu-button">Salir</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="topbar">
            <h2>Comunicados Vitalia (RF18)</h2>
            <div class="user-info">
                Gerente: ${sessionScope.usuario.nombreCompleto}
            </div>
        </div>
        <div class="content-box">
            <h2>Publicar Nuevo Comunicado</h2>
            
            <form id="formComunicado" class="form-rf16" action="${pageContext.request.contextPath}/comunicado" method="POST" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="tituloComunicado">Título del Comunicado</label>
                    <input type="text" id="tituloComunicado" name="tituloComunicado" placeholder="Ingrese el título del comunicado" required>
                </div>

                <div class="form-group">
                    <label>Destinatarios</label>
                    <div class="custom-dropdown" id="dropdownDestinatarios">
                        <div class="dropdown-select" id="dropdownSelectText">Seleccionar destinatarios...</div>
                        <div class="dropdown-content" id="dropdownContent">
                            <label><input type="checkbox" id="selectAllDep" value="Todos los departamentos"> Todos los departamentos</label>
                            <label><input type="checkbox" name="destinatarios" value="Gerencia"> Gerencia</label>
                            <label><input type="checkbox" name="destinatarios" value="Médicos"> Médicos</label>
                            <label><input type="checkbox" name="destinatarios" value="Farmacia"> Farmacia</label>
                            <label><input type="checkbox" name="destinatarios" value="Mantenimiento"> Mantenimiento</label>
                            <label><input type="checkbox" name="destinatarios" value="Contable"> Contable</label>
                            <label><input type="checkbox" name="destinatarios" value="Legal"> Legal</label>
                            <label><input type="checkbox" name="destinatarios" value="IT"> IT</label>
                        </div>
                    </div>
                </div>

                <div class="form-row grid-2">
                    <div class="form-group">
                        <label for="fechaPublicacion">Fecha Publicación</label>
                        <input type="date" id="fechaPublicacion" name="fechaPublicacion" required>
                    </div>
                    <div class="form-group">
                        <label for="nivelImportancia">Nivel de Importancia</label>
                        <select id="nivelImportancia" name="nivelImportancia" class="filter-select" required>
                            <option value="">Seleccione...</option>
                            <option value="Informativo">Informativo</option>
                            <option value="Importante">Importante</option>
                            <option value="Crítico">Crítico</option>
                            <option value="Urgente">Urgente</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="contenidoComunicado">Contenido del Comunicado</label>
                    <textarea id="contenidoComunicado" name="contenidoComunicado" rows="4" placeholder="Escriba el contenido del comunicado" required></textarea>
                </div>

                <div class="form-group checkbox-group">
                    <label><input type="checkbox" id="incluirAdjuntos" name="incluirAdjuntos"> Incluir Adjuntos</label>
                </div>

                <div class="form-group" id="fileUploadContainer" style="display: none;">
                    <label for="archivoAdjunto">Subir Adjuntos</label>
                    <input type="file" id="archivoAdjunto" name="archivoAdjunto" multiple>
                </div>

                <div class="form-buttons">
                    <button type="submit" id="btnPublicar" class="btn">PUBLICAR COMUNICADO</button>
                </div>
            </form>

            <h2 style="margin-top: 40px;">Comunicados Publicados Recientemente</h2>
            <div class="pendientes-container">
                <table id="tablaComunicados" class="table-rf16">
                    <thead>
                        <tr>
                            <th>Título</th>
                            <th>Destinatarios</th>
                            <th>Fecha Publicación</th>
                            <th>Visible</th>
                            <th>Editar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="5" style="text-align: center;">No existen comunicados publicados.</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <style>
        /* Estilos específicos para el dropdown multiselección nativo manteniendo cohesión con stylegerencia.css */
        .custom-dropdown {
            position: relative;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 4px;
            background: #fff;
            cursor: pointer;
        }
        .dropdown-select {
            padding: 10px;
            font-size: 0.95rem;
            color: #333;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            background: #fff;
            border: 1px solid #ccc;
            border-top: none;
            z-index: 100;
            max-height: 200px;
            overflow-y: auto;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .dropdown-content.show {
            display: block;
        }
        .dropdown-content label {
            display: block;
            padding: 8px 12px;
            font-weight: normal;
            cursor: pointer;
        }
        .dropdown-content label:hover {
            background: #f1f1f1;
        }
    </style>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Dropdown multiselección
            const dropdown = document.getElementById("dropdownDestinatarios");
            const dropdownContent = document.getElementById("dropdownContent");
            const dropdownSelectText = document.getElementById("dropdownSelectText");
            const selectAllDep = document.getElementById("selectAllDep");
            const checkboxes = dropdownContent.querySelectorAll("input[name='destinatarios']");

            dropdown.addEventListener("click", function (e) {
                e.stopPropagation();
                dropdownContent.classList.toggle("show");
            });

            document.addEventListener("click", function () {
                dropdownContent.classList.remove("show");
            });

            dropdownContent.addEventListener("click", function (e) {
                e.stopPropagation();
            });

            function updateDropdownText() {
                const selected = [];
                if (selectAllDep.checked) {
                    dropdownSelectText.textContent = "Todos los departamentos";
                    return;
                }
                checkboxes.forEach(cb => {
                    if (cb.checked) selected.push(cb.value);
                });
                dropdownSelectText.textContent = selected.length > 0 ? selected.join(", ") : "Seleccionar destinatarios...";
            }

            selectAllDep.addEventListener("change", function () {
                checkboxes.forEach(cb => {
                    cb.checked = selectAllDep.checked;
                    cb.disabled = selectAllDep.checked;
                });
                updateDropdownText();
            });

            checkboxes.forEach(cb => {
                cb.addEventListener("change", updateDropdownText);
            });

            // Mostrar/Ocultar input de archivos adjuntos
            const incluirAdjuntos = document.getElementById("incluirAdjuntos");
            const fileUploadContainer = document.getElementById("fileUploadContainer");

            incluirAdjuntos.addEventListener("change", function () {
                fileUploadContainer.style.display = this.checked ? "block" : "none";
            });
        });
    </script>
</body>
</html>