<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Iniciar Sesión</title>
</head>
<body>
<h2>Iniciar Sesión</h2>

<% if (request.getParameter("error") != null) { %>
<p style="color:red;"><%= request.getParameter("error") %></p>
<% } %>

<form action="usuario" method="post">
    <input type="hidden" name="accion" value="login">

    <label>Nombre:</label><br>
    <input type="text" name="nombre" required><br><br>

    <label>Clave:</label><br>
    <input type="password" name="clave" required><br><br>

    <input type="submit" value="Ingresar">
</form>

<br><br>
<a href="recuperar.jsp">¿Olvidaste tu clave?</a>

</body>
</html>

