<form action="${pageContext.request.contextPath}/registro" method="post">

    <label>Nombre Completo</label>
    <input
        type="text"
        name="nombreCompleto"
        required>

    <br><br>

    <label>Correo</label>
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
        Crear Cuenta
    </button>

</form>