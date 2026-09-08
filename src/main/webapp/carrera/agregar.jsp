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
    <title>Agregar Carrera Académica</title>
</head>
<body>
<h2>Agregar Nueva Carrera Académica</h2>

<form action="../carrera" method="post">
    <input type="hidden" name="accion" value="agregar">

    <label>Nombre:</label><br>
    <input type="text" name="nombre" required><br><br>

    <label>Número de Créditos:</label><br>
    <input type="number" name="numCreditos" required><br><br>

    <label>Número de Asignaturas:</label><br>
    <input type="number" name="numAsignaturas" required><br><br>

    <label>Número de Semestres:</label><br>
    <input type="number" name="numSemestres" required><br><br>

    <label>Nivel de Formación:</label><br>
    <input type="text" name="nivelFormacion" required><br><br>

    <label>Título:</label><br>
    <input type="text" name="titulo" required><br><br>

    <label>Valor del Semestre:</label><br>
    <input type="number" step="0.01" name="valorSemestre" required><br><br>

    <label>Universidad:</label><br>
    <input type="text" name="universidad" required><br><br>

    <label>¿Es Acreditada?</label>
    <input type="checkbox" name="esAcreditada" value="true"><br><br>

    <label>Perfiles:</label><br>
    <textarea name="perfiles" rows="3" cols="40"></textarea><br><br>

    <label>Área de Conocimiento:</label><br>
    <input type="text" name="areaConocimiento"><br><br>

    <input type="submit" value="Guardar">
    <a href="../index.jsp">Cancelar</a>
</form>
</body>
</html>