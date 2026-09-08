<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.CarreraAcademica" %>
<%@ page import="modelo.Usuario" %>
<%
    Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario.login");
    if (usuarioLogueado == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    CarreraAcademica c = (CarreraAcademica) session.getAttribute("carrera.buscar");
    if (c == null) {
        response.sendRedirect("buscar.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Modificar Carrera Académica</title>
</head>
<body>
<h2>Modificar Carrera Académica</h2>

<form action="../carrera" method="post">
    <input type="hidden" name="accion" value="modificar">
    <input type="hidden" name="id" value="<%= c.getId() %>">

    <label>ID:</label><br>
    <input type="text" value="<%= c.getId() %>" disabled><br><br>

    <label>Nombre:</label><br>
    <input type="text" name="nombre" value="<%= c.getNombre() %>" required><br><br>

    <label>Número de Créditos:</label><br>
    <input type="number" name="numCreditos" value="<%= c.getNumCreditos() %>" required><br><br>

    <label>Número de Asignaturas:</label><br>
    <input type="number" name="numAsignaturas" value="<%= c.getNumAsignaturas() %>" required><br><br>

    <label>Número de Semestres:</label><br>
    <input type="number" name="numSemestres" value="<%= c.getNumSemestres() %>" required><br><br>

    <label>Nivel de Formación:</label><br>
    <input type="text" name="nivelFormacion" value="<%= c.getNivelFormacion() %>" required><br><br>

    <label>Título:</label><br>
    <input type="text" name="titulo" value="<%= c.getTitulo() %>" required><br><br>

    <label>Valor del Semestre:</label><br>
    <input type="number" step="0.01" name="valorSemestre" value="<%= c.getValorSemestre() %>" required><br><br>

    <label>Universidad:</label><br>
    <input type="text" name="universidad" value="<%= c.getUniversidad() %>" required><br><br>

    <label>¿Es Acreditada?</label>
    <input type="checkbox" name="esAcreditada" value="true" <%= c.isEsAcreditada() ? "checked" : "" %>><br><br>

    <label>Perfiles:</label><br>
    <textarea name="perfiles" rows="3" cols="40"><%= c.getPerfiles() != null ? c.getPerfiles() : "" %></textarea><br><br>

    <label>Área de Conocimiento:</label><br>
    <input type="text" name="areaConocimiento" value="<%= c.getAreaConocimiento() != null ? c.getAreaConocimiento() : "" %>"><br><br>

    <input type="submit" value="Guardar cambios">
    <a href="../index.jsp">Cancelar</a>
</form>
</body>
</html>