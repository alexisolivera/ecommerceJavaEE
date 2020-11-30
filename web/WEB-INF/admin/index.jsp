<%-- 
    Document   : header
    Created on : 18-ene-2019, 0:02:20
    Author     : Alexis
--%>
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
        <title>Nuevo artículo</title>
        <%@include file="../../WEB-INF/css.jsp" %>
    </head><!--/head-->
    <body>
        <%@include file="../../WEB-INF/header.jsp" %>            
            <div class="container">
                <h3>Nuevo artículo</h3>
                ${mensaje}
                <form action="ControlProducto" enctype="multipart/form-data" method="post">
                    <div class="form-one">
                        <label>Nombre</label>
                        <input type="text" class="form-control" name="nombre" placeholder="Nombre Producto" value="" required /><br>
                        <label>Precio</label>
                        <input type="number" class="form-control" name="precio" placeholder="Precio" value="0" min="0" /><br>
                        <label>Precio promocional</label>
                        <input type="number" class="form-control" name="precionuevo" placeholder="Precio" value="0" min="0" /><br>
                        <label>Stock</label>
                        <input type="number" class="form-control" name="cantidad" placeholder="Cantidad" value="1" min="1" /><br>
                        <label>Marca</label>
                        <select name="marca" class="form-control">
                            <option>Seleccionar Marca</option>
                            <% for (Marca m: MarcaCad.listarTodoDeMarcas()){%>
                            <option value="<%= m.getCodigo() %>"><%=m.getNombre()%></option>
                            <%}%>
                        </select><br>
                        <label>Categoría:</label>
                        <select name="categoria" class="form-control">
                            <option>Seleccionar Categoría</option>
                            <% for (Categoria c: CategoriaCad.listarTodoDeCategoria()){%>
                            <option value="<%= c.getCodigo() %>"><%=c.getNombre()%></option>
                             <%}%>
                        </select><br>
                        <label>Descripción detallada:</label>
                        <textarea
                            name="descripcion" class="form-control" rows="4" cols="20" placeholder="Descripcion" required >
                        </textarea><br>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="nuevo" value="ON" checked="checked"/>Nuevo
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="recomendado" value="ON"/>Recomendado
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="visible" value="ON" checked="checked"/>Visible
                        </label>
                        <br><br>
                            <input type="file" name="imagen" required />
                        <hr/>
                        <input class="btn btn-success" name="accion" type="submit" value="Cargar" />
                        <a href="PanelAdmin" class="btn btn-default"><i class="fa fa-caret-left"></i> Volver</a><br><br>
                    </div>
                </form>
            </div>
    </body>
</html>
