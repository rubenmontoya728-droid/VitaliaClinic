<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión - Vitalia Clínica</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <div class="auth-container">
        <div class="auth-box">
            <div class="logo">
                <div class="logo-icon">V</div>
                <div class="logo-text">
                    <span>Vitalia Clínica</span>
                    <small>Plataforma de Gestión</small>
                </div>
            </div>
            <h2>Iniciar Sesión</h2>
            <form action="${pageContext.request.contextPath}/login" method="post">
                <label>Correo electrónico</label>
                <input type="email" name="correo" placeholder="usuario@correo.com" required>
                <label>Contraseña</label>
                <input type="password" name="clave" placeholder="••••••••" required>
                <button class="btn" type="submit">Iniciar Sesión</button>
            </form>
            <p class="footer-text">
                <a class="link" href="${pageContext.request.contextPath}/jsp/recuperar.jsp">¿Olvidaste tu contraseña?</a>
            </p>
            <p class="footer-text">
                ¿No tienes cuenta? 
                <a class="link" href="${pageContext.request.contextPath}/jsp/crearcuenta.jsp">Crear cuenta nueva</a>
            </p>
        </div>
    </div>
</body>
</html>