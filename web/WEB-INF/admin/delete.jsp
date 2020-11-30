<%-- 
    Document   : delete
    Created on : 11-nov-2020, 0:08:19
    Author     : Alexis
--%>

<%@page import="JavaBeans.Producto"%>
<%@page import="cad.ProductoCad"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Eliminar artículo</title>
        <%@include file="../../WEB-INF/css.jsp" %>
    </head>
    <body>
        <%@include file="../../WEB-INF/header.jsp" %>
        <div class="container">
            <form action="ControlDeleteProducto" method="post">
                <h3>Eliminar artículo</h3>
                <select name="allProducts">
                    <option>Seleccione el artículo a eliminar</option>
                    <% for (Producto p : ProductoCad.listarTodosLosProductos()) {%>
                    <option value="<%= p.getWebId()%>"><%=p.getNombre()%></option>
                    <%}%>
                </select><br>
                <input class="btn btn-danger" name="accion" type="submit" value="Eliminar">
                <a href="PanelAdmin" class="btn btn-default"><i class="fa fa-caret-left"></i> Volver</a>
            </form>            
        </div>
    </body>
</html>
