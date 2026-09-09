<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.Usuario" %>
<%
    Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario.login");
    if (usuarioLogueado == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Menú Principal</title>
</head>
<body>
<h2>Bienvenido, <%= usuarioLogueado.getNombre() %> (<%= usuarioLogueado.getRol() %>)</h2>

<h3>Usuarios</h3>
<ul>
    <li><a href="usuario?accion=listartodo">Listar Usuarios</a></li>
    <li><a href="usuario/agregar.jsp">Agregar Usuario</a></li>
    <li><a href="usuario/buscar.jsp">Buscar / Modificar / Eliminar Usuario</a></li>
    <li><a href="usuario/reportes.jsp">Reportes de Usuarios</a></li>
</ul>

<h3>Carreras Académicas</h3>
<ul>
    <li><a href="carrera?accion=listartodo">Listar Carreras</a></li>
    <li><a href="carrera/agregar.jsp">Agregar Carrera</a></li>
    <li><a href="carrera/buscar.jsp">Buscar / Modificar / Eliminar Carrera</a></li>
    <li><a href="carrera/reportes.jsp">Reportes de Carreras</a></li>
</ul>

<br>
<a href="usuario?accion=salir">Cerrar Sesión</a>
</body>
</html>

