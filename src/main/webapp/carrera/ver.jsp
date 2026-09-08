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
    <title>Ver Carrera Académica</title>
</head>
<body>
<h2>Detalle de la Carrera Académica</h2>

<p>
    <strong>ID:</strong> <%= c.getId() %><br>
    <strong>Nombre:</strong> <%= c.getNombre() %><br>
    <strong>Número de Créditos:</strong> <%= c.getNumCreditos() %><br>
    <strong>Número de Asignaturas:</strong> <%= c.getNumAsignaturas() %><br>
    <strong>Número de Semestres:</strong> <%= c.getNumSemestres() %><br>
    <strong>Nivel de Formación:</strong> <%= c.getNivelFormacion() %><br>
    <strong>Título:</strong> <%= c.getTitulo() %><br>
    <strong>Valor del Semestre:</strong> <%= c.getValorSemestre() %><br>
    <strong>Universidad:</strong> <%= c.getUniversidad() %><br>
    <strong>¿Es Acreditada?:</strong> <%= c.isEsAcreditada() ? "Sí" : "No" %><br>
    <strong>Perfiles:</strong> <%= c.getPerfiles() != null ? c.getPerfiles() : "" %><br>
    <strong>Área de Conocimiento:</strong> <%= c.getAreaConocimiento() != null ? c.getAreaConocimiento() : "" %>
</p>

<br>
<a href="buscar.jsp">Buscar otra</a> |
<a href="../index.jsp">Volver al menú</a>
</body>
</html>