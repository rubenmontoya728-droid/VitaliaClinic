<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Crear Cuenta - Vitalia Clínica</title>
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
                    <small>Registro de Usuario</small>
                </div>
            </div>
            <h2>Crear Cuenta Nueva</h2>
            <form action="${pageContext.request.contextPath}/registro" method="post" id="registerForm">
                <label>Nombre Completo</label>
                <input type="text" name="nombreCompleto" placeholder="Juan Pérez" required>
                
                <label>Correo electrónico</label>
                <input type="email" name="correo" placeholder="usuario@correo.com" required>
                
                <label>Contraseña</label>
                <input type="password" name="clave" placeholder="Min. 8 caracteres" required>
                
                <button class="btn" type="submit">Crear Cuenta</button>
            </form>
            <p class="footer-text">
                ¿Ya tienes cuenta? 
                <a class="link" href="${pageContext.request.contextPath}/jsp/login.jsp">Iniciar sesión</a>
            </p>
        </div>
    </div>
</body>
</html>