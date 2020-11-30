
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Gestion de productos</title>
    <%@include file="../../WEB-INF/css.jsp" %>
</head><!--/head-->
    <body>
        
        <%@include file="../../WEB-INF/header.jsp" %>
        <form action="IniciarSesion" method="post">
            <label> Nombre: </label>
            <input type="text" name="usuario"><br>
            <label> Contraseña: </label>
            <input type="password" name="clave"><br>
            <input type="submit" value="Iniciar Sesion">
        </form>
    </body>
</html>
