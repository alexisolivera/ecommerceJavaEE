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
        <title>TODO cambiar titulo</title>
        <%@include file="../../WEB-INF/css.jsp" %>
    </head>
    <body>
        <form action="ControlDeleteProducto" method="post">

            Producto:<select name="allProducts">
                <option>Seleccionar producto a borrar</option>
                <% for (Producto p : ProductoCad.listarTodosLosProductos()) {%>
                <option value="<%= p.getWebId()%>"><%=p.getNombre()%></option>
                <%}%>
            </select>
            <input class="btn btn-danger" name="accion" type="submit" value="Borrar" />
            <a href="admin">volver </a>
        </form>
    </body>
</html>
