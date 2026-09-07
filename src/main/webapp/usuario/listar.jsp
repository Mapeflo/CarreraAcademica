<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Usuario" %>
<%
    Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario.login");
    if (usuarioLogueado == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    List<Usuario> lista = (List<Usuario>) session.getAttribute("usuario.listar");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Listar Usuarios</title>
</head>
<body>
<h2>Lista de Usuarios</h2>

<p><a href="../index.jsp">Volver al menú</a></p>

<% if (lista == null || lista.isEmpty()) { %>
<p>No hay usuarios registrados.</p>
<% } else { %>
<table border="1" cellpadding="8">
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Rol</th>
        <th>Email</th>
        <th>Clave</th>
    </tr>
    <% for (Usuario u : lista) { %>
    <tr>
        <td><%= u.getId() %></td>
        <td><%= u.getNombre() %></td>
        <td><%= u.getRol() %></td>
        <td><%= u.getEmail() %></td>
        <td><%= u.getClave() %></td>
    </tr>
    <% } %>
</table>
<% } %>
</body>
</html>