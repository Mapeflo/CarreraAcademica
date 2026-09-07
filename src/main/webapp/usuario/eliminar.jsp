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
    <title>Eliminar Usuario</title>
</head>
<body>
<h2>Eliminar Usuario</h2>

<p>¿Estás seguro de que deseas eliminar este usuario?</p>

<p>
    <strong>ID:</strong> <%= u.getId() %><br>
    <strong>Nombre:</strong> <%= u.getNombre() %><br>
    <strong>Rol:</strong> <%= u.getRol() %><br>
    <strong>Email:</strong> <%= u.getEmail() %>
</p>

<form action="../usuario" method="post">
    <input type="hidden" name="accion" value="borrar">
    <input type="hidden" name="id" value="<%= u.getId() %>">
    <input type="submit" value="Sí, eliminar" style="background-color: #ff4444; color: white;">
    <a href="../index.jsp">Cancelar</a>
</form>
</body>
</html>