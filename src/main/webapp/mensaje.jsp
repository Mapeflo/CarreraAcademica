<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mensaje</title>
</head>
<body>
<h2>Mensaje del sistema</h2>
<p><%= request.getParameter("mensaje") != null ? request.getParameter("mensaje") : "Operación realizada" %></p>
<br>
<a href="index.jsp">Volver al menú</a>
<br>
<a href="login.jsp">Ir al login</a>
</body>
</html>