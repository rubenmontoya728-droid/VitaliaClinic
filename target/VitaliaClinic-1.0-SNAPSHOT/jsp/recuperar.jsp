<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Recuperar Contraseña - Vitalia Clínica</title>
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
                    <small>Recuperación de Acceso</small>
                </div>
            </div>
            <h2>Recuperar Contraseña</h2>
            <p class="subtitle">Ingresa tu correo para recibir un enlace de recuperación.</p>
            <form id="recoverForm" action="${pageContext.request.contextPath}/recuperar" method="post">
                <label for="correo">Correo electrónico</label>
                <input type="email" id="correo" name="correo" placeholder="usuario@correo.com" required>
                
                <button id="btnEnviar" class="btn" type="submit">Enviar Enlace</button>
            </form>
            <p class="footer-text">
                <a class="link" href="${pageContext.request.contextPath}/jsp/login.jsp">Volver al inicio</a>
            </p>
        </div>
    </div>
</body>
</html>