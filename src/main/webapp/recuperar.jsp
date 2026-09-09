<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Recuperar Clave</title>
</head>
<body>
<h2>Recuperar Clave</h2>
<p>Ingresa el correo electrónico registrado:</p>

<form action="usuario" method="post">
    <input type="hidden" name="accion" value="recuperarClave">

    <label>Email:</label><br>
    <input type="email" name="email" required><br><br>

    <input type="submit" value="Enviar clave a mi correo">
</form>

<br>
<a href="login.jsp">Volver al Login</a>
</body>
</html>