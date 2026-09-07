<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.Usuario" %>
<%
    Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario.login");
    if (usuarioLogueado == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    Usuario u = (Usuario) session.getAttribute("usuario.buscar");
    if (u == null) {
        response.sendRedirect("buscar.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Modificar Usuario</title>
</head>
<body>
<h2>Modificar Usuario</h2>

<form action="../usuario" method="post">
    <input type="hidden" name="accion" value="modificar">
    <input type="hidden" name="id" value="<%= u.getId() %>">

    <label>ID:</label><br>
    <input type="text" value="<%= u.getId() %>" disabled><br><br>

    <label>Nombre:</label><br>
    <input type="text" name="nombre" value="<%= u.getNombre() %>" required><br><br>

    <label>Clave:</label><br>
    <input type="text" name="clave" value="<%= u.getClave() %>" required><br><br>

    <label>Rol:</label><br>
    <select name="rol" required>
        <option value="admin" <%= "admin".equals(u.getRol()) ? "selected" : "" %>>admin</option>
        <option value="usuario" <%= "usuario".equals(u.getRol()) ? "selected" : "" %>>usuario</option>
    </select><br><br>

    <label>Email:</label><br>
    <input type="email" name="email" value="<%= u.getEmail() %>"><br><br>

    <input type="submit" value="Guardar cambios">
    <a href="../index.jsp">Cancelar</a>
</form>
</body>
</html>