<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.CarreraAcademica" %>
<%@ page import="modelo.Usuario" %>
<%
    Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario.login");
    if (usuarioLogueado == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    List<CarreraAcademica> lista = (List<CarreraAcademica>) session.getAttribute("carrera.reporte");
    String titulo = (String) session.getAttribute("titulo.reporte");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Reporte de Carreras</title>
</head>
<body>
<h2><%= titulo != null ? titulo : "Reporte de Carreras" %></h2>
<p><a href="../index.jsp">Volver al menú</a></p>

<% if (lista == null || lista.isEmpty()) { %>
<p>No se encontraron resultados.</p>
<% } else { %>
<table border="1" cellpadding="6">
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Universidad</th>
        <th>Nivel</th>
        <th>Valor Semestre</th>
        <th>Acreditada</th>
        <th>Área</th>
    </tr>
    <% for (CarreraAcademica c : lista) { %>
    <tr>
        <td><%= c.getId() %></td>
        <td><%= c.getNombre() %></td>
        <td><%= c.getUniversidad() %></td>
        <td><%= c.getNivelFormacion() %></td>
        <td><%= c.getValorSemestre() %></td>
        <td><%= c.isEsAcreditada() ? "Sí" : "No" %></td>
        <td><%= c.getAreaConocimiento() %></td>
    </tr>
    <% } %>
</table>
<% } %>
</body>
</html>