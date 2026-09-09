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
    <title>Reportes de Carreras</title>
</head>
<body>
<h2>Reportes de Carreras Académicas</h2>
<p><a href="../index.jsp">Volver al menú</a></p>

<h3>1. Buscar por Universidad + Nivel de Formación</h3>
<form action="../carrera" method="get">
    <input type="hidden" name="accion" value="reporteUniversidadNivel">

    <label>Universidad (parcial):</label><br>
    <input type="text" name="universidad" required><br><br>

    <label>Nivel de Formación:</label><br>
    <input type="text" name="nivelFormacion" placeholder="Ej: Pregrado" required><br><br>

    <input type="submit" value="Generar reporte">
</form>

<br><hr><br>

<h3>2. Carreras Acreditadas por rango de valor de semestre</h3>
<form action="../carrera" method="get">
    <input type="hidden" name="accion" value="reporteAcreditadasRango">

    <label>Valor mínimo:</label><br>
    <input type="number" step="0.01" name="valorMin" required><br><br>

    <label>Valor máximo:</label><br>
    <input type="number" step="0.01" name="valorMax" required><br><br>

    <input type="submit" value="Generar reporte">
</form>
</body>
</html>