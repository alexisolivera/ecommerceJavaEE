<%@page import="JavaBeans.Producto"%>
<%@page import="cad.ProductoCad"%>
<%@page import="cad.MarcaCad"%>
<%@page import="JavaBeans.Marca"%>
<%@page import="cad.CategoriaCad"%>
<%@page import="JavaBeans.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Consulta de artículos</title>
        <%@include file="../../WEB-INF/css.jsp" %>
    </head><!--/head-->
    <body>
        <%@include file="../../WEB-INF/header.jsp" %>
            <div class="container">
                <h3>Consulta de artículos</h3><br>
                <table class="table table-hover">
                    <thead>
                      <tr>
                        <th scope="col">Codigo</th>
                        <th scope="col">Descripción</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Stock</th>
                        <th scope="col">Descripcion detallada</th>
                        <th scope="col">Editar</th>
                      </tr>
                    </thead>
                    <tbody>
                      <% for (Producto p : ProductoCad.listarTodosLosProductosIncluyeEliminados()) {%>
                      <tr>
                        <th scope="row"><%=p.getWebId()%></th>
                        <td><%=p.getNombre()%></td>
                        <td><%=p.getPrecio()%></td>
                        <td><%=p.getStock()%></td>
                        <td><%=p.getDescripcion()%></td>
                        <td><a href="ControlEditarProducto?id=<%= p.getWebId()%>&value=aEditar" class="btn btn-default"><i class="fa fa-edit"></i> Editar</a></td>
                      </tr>
                      <%}%>
                    </tbody>
                  </table>
                  <a href="PanelAdmin" class="btn btn-default"><i class="fa fa-caret-left"></i> Volver</a><br><br>
            </div>
    </body>
</html>
