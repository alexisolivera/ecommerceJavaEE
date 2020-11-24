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
        <title>Gestion de productos</title>
        <%@include file="../../WEB-INF/css.jsp" %>
    </head><!--/head-->

    <body>
        <%@include file="../../WEB-INF/header.jsp" %>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                    </div>
                    <div class="col-sm-10 clearfix">
                        
                        <h3>Gestionar producto</h3>
                        <form action="ControlEditarProducto" method="post">
                            <div class="form-one">
                                <table>
                                    <thead>
                                        <tr>
                                            <td>Codigo</td>
                                            <td>Nombre<td>
                                            <td>Precio</td>
                                            <td>Disponible</td>
                                            <td>Descripcion</td>
                                            <td>Editar</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%! ArrayList<Producto> productos = ProductoCad.listarTodosLosProductosIncluyeEliminados();%>
                                        <% for (Producto p : productos) {%>
                                        <tr>
                                            <td><%=p.getWebId()%></td>
                                            <td><%=p.getNombre()%><td>
                                            <td><%=p.getPrecio()%></td>
                                            <td><%=p.getStock()%></td>
                                            <td><%=p.getDescripcion()%></td>
                                            <td><a href="ControlEditarProducto?id=<%= p.getWebId()%>&value=aEditar" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Editar</a></td>
                                            <td></td>
                                        </tr>
                                        <%}%> 
                                    </tbody>
                                </table>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </section>
        <%@include file="../../WEB-INF/footer.jsp" %>
        <%@include file="../../WEB-INF/js.jsp" %>                                    
    </body>
</html>
