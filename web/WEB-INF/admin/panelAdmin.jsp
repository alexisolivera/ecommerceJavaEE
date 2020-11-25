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
        <a href="EditProduct" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>VER / EDITAR</a>
        <a href="Delete" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>ELIMINAR</a>
        <a href="admin" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>NUEVO</a>
        <a href="CerrarSesion" class="btn btn-default add-to-cart"><i class="fa fa-lock"></i>CERRAR SESION</a>
    </body>
</html>