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
    <title>Eliminar Carrera Académica</title>
</head>
<body>
<h2>Eliminar Carrera Académica</h2>

<p>¿Estás seguro de que deseas eliminar esta carrera?</p>

<p>
    <strong>ID:</strong> <%= c.getId() %><br>
    <strong>Nombre:</strong> <%= c.getNombre() %><br>
    <strong>Universidad:</strong> <%= c.getUniversidad() %><br>
    <strong>Título:</strong> <%= c.getTitulo() %><br>
    <strong>Nivel:</strong> <%= c.getNivelFormacion() %>
</p>

<form action="../carrera" method="post">
    <input type="hidden" name="accion" value="borrar">
    <input type="hidden" name="id" value="<%= c.getId() %>">
    <input type="submit" value="Sí, eliminar" style="background-color: #ff4444; color: white;">
    <a href="../index.jsp">Cancelar</a>
</form>
</body>
</html>