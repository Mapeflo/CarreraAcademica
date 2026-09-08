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

    List<CarreraAcademica> lista = (List<CarreraAcademica>) session.getAttribute("carrera.listar");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Listar Carreras Académicas</title>
</head>
<body>
<h2>Lista de Carreras Académicas</h2>
<p><a href="../index.jsp">Volver al menú</a> |
    <a href="agregar.jsp">Agregar nueva</a></p>

<% if (lista == null || lista.isEmpty()) { %>
<p>No hay carreras registradas.</p>
<% } else { %>
<table border="1" cellpadding="6">
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Créditos</th>
        <th>Asignaturas</th>
        <th>Semestres</th>
        <th>Nivel</th>
        <th>Título</th>
        <th>Valor Semestre</th>
        <th>Universidad</th>
        <th>Acreditada</th>
        <th>Área</th>
    </tr>
    <% for (CarreraAcademica c : lista) { %>
    <tr>
        <td><%= c.getId() %></td>
        <td><%= c.getNombre() %></td>
        <td><%= c.getNumCreditos() %></td>
        <td><%= c.getNumAsignaturas() %></td>
        <td><%= c.getNumSemestres() %></td>
        <td><%= c.getNivelFormacion() %></td>
        <td><%= c.getTitulo() %></td>
        <td><%= c.getValorSemestre() %></td>
        <td><%= c.getUniversidad() %></td>
        <td><%= c.isEsAcreditada() ? "Sí" : "No" %></td>
        <td><%= c.getAreaConocimiento() %></td>
    </tr>
    <% } %>
</table>
<% } %>
</body>
</html>