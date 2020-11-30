
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Inicio de sesión</title>
    <%@include file="../../WEB-INF/css.jsp" %>
</head>
    <body>
        <%@include file="../../WEB-INF/header.jsp" %>
        <div class="container">
            <h3>Inicio de sesión</h3> <br>
            <form class="form-group" action="IniciarSesion" method="post">
                <label>Usuario:</label>
                <input type="text" class="form-control" name="usuario"><br>
                <label>Contraseña:</label>
                <input type="password" class="form-control" name="clave"><br>
                <input type="submit" class="btn btn-success" value="Iniciar Sesión">
            </form>
        </div>
    </body>
</html>