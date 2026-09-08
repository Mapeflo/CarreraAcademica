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
    <title>Ver Usuario</title>
</head>
<body>
<h2>Detalle del Usuario</h2>

<p>
    <strong>ID:</strong> <%= u.getId() %><br>
    <strong>Nombre:</strong> <%= u.getNombre() %><br>
    <strong>Rol:</strong> <%= u.getRol() %><br>
    <strong>Email:</strong> <%= u.getEmail() %><br>
    <strong>Clave:</strong> <%= u.getClave() %>
</p>

<br>
<a href="buscar.jsp">Buscar otro</a> |
<a href="../index.jsp">Volver al menú</a>
</body>
</html>