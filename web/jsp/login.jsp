<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Iniciar Sesión</title>
</head>
<body>

    <h2>Iniciar Sesión</h2>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <input
            type="email"
            name="correo"
            required>

        <br><br>

        <label>Contraseña</label>
        <input
            type="password"
            name="clave"
            required>

        <br><br>

        <button type="submit">
            Ingresar
        </button>

    </form>

</body>
</html>