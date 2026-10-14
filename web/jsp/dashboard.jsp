<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession sesion =
            request.getSession(false);

    if (sesion == null ||
        sesion.getAttribute("usuario") == null) {

        response.sendRedirect(
                request.getContextPath()
                + "/jsp/login.jsp");

        return;
    }
%>
<!DOCTYPE html>

<html>

<head>
    <title>Dashboard</title>
</head>

<body>

    <h1>
        Bienvenido a VitaliaClinic
    </h1>
    <p>
    <a href="${pageContext.request.contextPath}/logout">Cerrar Sesión</a>
    </p>
</body>

</html>