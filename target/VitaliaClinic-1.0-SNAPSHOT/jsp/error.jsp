<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         isErrorPage="true" %>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Error – Vitalia Clínica</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <style>
    body {
      margin: 0;
      padding: 0;
      background: #eaf4f8;
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .error-box {
      background: white;
      padding: 40px;
      border-radius: 12px;
      width: 90%;
      max-width: 600px;
      text-align: center;
      box-shadow: 0 10px 25px rgba(0,0,0,0.1);
      border-top: 8px solid #0a3d62; /* Azul institucional */
    }

    .error-title {
      font-size: 26px;
      color: #0a3d62;
      margin-bottom: 20px;
      font-weight: bold;
    }

    .error-text {
      font-size: 16px;
      color: #333;
      margin-bottom: 25px;
      line-height: 1.5;
    }

    .image-placeholder {
      width: 100%;
      height: 180px;
      background: #d9e8ef;
      border: 2px dashed #0a3d62;
      border-radius: 10px;
      margin-bottom: 25px;
      display: flex;
      justify-content: center;
      align-items: center;
      color: #0a3d62;
      font-size: 14px;
    }

    .btn {
      background: #0a3d62;
      color: white;
      padding: 12px 20px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      font-size: 15px;
      font-weight: bold;
    }

    .btn:hover {
      background: #062a44;
    }
	.image-placeholder img {
	  max-width: 100%;
	  max-height: 100%;
	  object-fit: contain;
	  display: block;
	}
  </style>
</head>
<body>

  <div class="error-box">

    <div class="error-title">Página no disponible</div>

    <div class="image-placeholder">
      <img src="${pageContext.request.contextPath}/img/Vitalia.jpg" alt="Vitalia Clínica">
    </div>

    <div class="error-text">
        Lo sentimos, ha ocurrido un error inesperado. Por favor, inténtelo de nuevo más tarde o contacte al soporte técnico si el problema persiste. 
    </div>

    <button class="btn" onclick="location.href='${pageContext.request.contextPath}/jsp/dashboard.jsp'">
      Volver al Panel Principal
    </button>

  </div>

</body>
</html>