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
    <title>Reportes de Usuario</title>
</head>
<body>
<h2>Reportes de Usuarios</h2>
<p><a href="../index.jsp">Volver al menú</a></p>

<h3>1. Buscar por Rol</h3>
<form action="../usuario" method="get">
    <input type="hidden" name="accion" value="reporteRol">
    <label>Rol:</label>
    <select name="rol" required>
        <option value="admin">admin</option>
        <option value="usuario">usuario</option>
    </select>
    <input type="submit" value="Generar reporte">
</form>

<br><hr><br>

<h3>2. Buscar por Nombre (parcial)</h3>
<form action="../usuario" method="get">
    <input type="hidden" name="accion" value="reporteNombre">
    <label>Nombre contiene:</label>
    <input type="text" name="nombre" required>
    <input type="submit" value="Generar reporte">
</form>
</body>
</html>