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
    <title>Buscar Usuario</title>
</head>
<body>
<h2>Buscar Usuario por ID</h2>

<form action="../usuario" method="get">
    <input type="hidden" name="accion" value="buscar">

    <label>ID del usuario:</label><br>
    <input type="number" name="id" required><br><br>

    <label>Acción después de buscar:</label><br>
    <select name="redir">
        <option value="buscar">Solo ver</option>
        <option value="modificar">Modificar</option>
        <option value="eliminar">Eliminar</option>
    </select><br><br>

    <input type="submit" value="Buscar">
    <a href="../index.jsp">Cancelar</a>
</form>
</body>
</html>