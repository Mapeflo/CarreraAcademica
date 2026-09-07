<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.Usuario" %>
<%
    Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario.login");
    if (usuarioLogueado == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Agregar Usuario</title>
</head>
<body>
<h2>Agregar Nuevo Usuario</h2>

<form action="../usuario" method="post">
    <input type="hidden" name="accion" value="agregar">

    <label>Nombre:</label><br>
    <input type="text" name="nombre" required><br><br>

    <label>Clave:</label><br>
    <input type="text" name="clave" required><br><br>

    <label>Rol:</label><br>
    <select name="rol" required>
        <option value="admin">admin</option>
        <option value="usuario">usuario</option>
    </select><br><br>

    <label>Email:</label><br>
    <input type="email" name="email"><br><br>

    <input type="submit" value="Guardar">
    <a href="../index.jsp">Cancelar</a>
</form>
</body>
</html>