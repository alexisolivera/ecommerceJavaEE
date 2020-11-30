<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Panel de Admin</title>
    <%@include file="../../WEB-INF/css.jsp" %>
</head><!--/head-->
    <body>
        <%@include file="../../WEB-INF/header.jsp" %>
        <div class="text-center">
            <div class="btn-group btn-group-lg">
                <h3>Panel de administrador</h3> <br>
                <a href="admin" class="btn btn-default"><i class="fa fa-plus"></i> Nuevo artículo</a>
                <a href="EditProduct" class="btn btn-default"><i class="fa fa-edit"></i> Editar / Consultar</a>
                <a href="Delete" class="btn btn-default"><i class="fa fa-trash-o"></i> Eliminar</a>
                <a href="CerrarSesion" class="btn btn-default"><i class="fa fa-lock"></i> Cerrar sesión</a>
            </div>
        </div>
    </body>
</html>