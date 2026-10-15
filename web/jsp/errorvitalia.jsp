<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Error – Vitalia Clínica</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <div class="auth-container">
        <div class="auth-box error-box" style="text-align: center;">
            <div class="image-placeholder" style="margin-bottom: 20px;">
                <img src="${pageContext.request.contextPath}/img/Vitalia.jpg" alt="Vitalia Clínica" style="max-width: 80px; height: auto; border-radius: 50%;">
            </div>
            <h2>Página no disponible</h2>
            <p style="margin: 20px 0; color: #555; line-height: 1.5;">Excelente día. El módulo solicitado aún no se encuentra disponible en esta versión del sistema. Por favor utilice las opciones actualmente habilitadas desde el panel principal.</p>
            <a href="${pageContext.request.contextPath}/jsp/dashboard.jsp" class="btn" style="display: inline-block; text-decoration: none; text-align: center;">Volver al Panel Principal</a>
        </div>
    </div>
</body>
</html>