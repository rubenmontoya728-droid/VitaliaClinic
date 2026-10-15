<%@ page contentType="text/html;charset=UTF-8" language="java" import="jakarta.servlet.http.HttpSession" %>
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
    <title>Panel Principal - Vitalia Clínica</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Styles2.css">
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
            <li><a href="${pageContext.request.contextPath}/jsp/dashboard.jsp" class="active menu-button menu-button-active">Inicio</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/gerencia.jsp" class="menu-button">Gerencia</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/errorvitalia.jsp" class="menu-button">Portal Médico</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/errorvitalia.jsp" class="menu-button">Farmacia</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/errorvitalia.jsp" class="menu-button">Contable</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/errorvitalia.jsp" class="menu-button">Legal</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/errorvitalia.jsp" class="menu-button">Soporte</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/errorvitalia.jsp" class="menu-button">IT</a></li>
            <li><a href="${pageContext.request.contextPath}/logout" class="menu-button">Salir</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="topbar">
            <h2>Bienvenido al Panel Principal</h2>
            <div class="user-info">
                Usuario: ${sessionScope.usuario.correo}
            </div>
        </div>
        <div class="content-box">
            <h2>Resumen General</h2>
            <p>Este es el panel principal de Vitalia Clínica.</p>
            <p>Desde aquí se podrá acceder a todos los módulos funcionales de la plataforma.</p>
            <p>Seleccione una opción del menú lateral para comenzar.</p>
        </div>
    </div>
</body>
</html>