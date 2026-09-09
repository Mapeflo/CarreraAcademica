<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Usuario" %>
<%
    Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario.login");
    if (usuarioLogueado == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    List<Usuario> lista = (List<Usuario>) session.getAttribute("usuario.reporte");
    String titulo = (String) session.getAttribute("titulo.reporte");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Reporte de Usuarios</title>
</head>
<body>
<h2><%= titulo != null ? titulo : "Reporte de Usuarios" %></h2>
<p><a href="../index.jsp">Volver al menú</a></p>

<% if (lista == null || lista.isEmpty()) { %>
<p>No se encontraron resultados.</p>
<% } else { %>
<table border="1" cellpadding="8">
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Rol</th>
        <th>Email</th>
    </tr>
    <% for (Usuario u : lista) { %>
    <tr>
        <td><%= u.getId() %></td>
        <td><%= u.getNombre() %></td>
        <td><%= u.getRol() %></td>
        <td><%= u.getEmail() %></td>
    </tr>
    <% } %>
</table>
<% } %>
</body>
</html>