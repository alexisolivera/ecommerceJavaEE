<%@page import="cad.CategoriaCad"%>
<%@page import="JavaBeans.Categoria"%>
<%@page import="cad.MarcaCad"%>
<%@page import="JavaBeans.Marca"%>
<%@page import="JavaBeans.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Editar artículo</title>
        <%@include file="../../WEB-INF/css.jsp" %>
    </head><!--/head-->
    <body>
        <%@include file="../../WEB-INF/header.jsp" %>
        <div class="container">
            <h3>Editar artículo</h3>
            <% Producto producto = (Producto) session.getAttribute("productoAeditar");%>
            <form action="ControlmandaDatosParaEditar" class="form-group" method="post">
                <div class="form-one">
                    <hr/>
                    <label>Código:</label>
                    <input type="text" class="form-control" name="codigo" value="<%=producto.getWebId()%>" readonly="" /><br>
                    <label>Nombre:</label>
                    <input type="text" class="form-control" name="nombre" placeholder="Nombre Producto" value="<%=producto.getNombre()%>" required /><br>
                    <label>Precio:</label>
                    <input type="text" class="form-control" name="precio" placeholder="Precio" value="<%=producto.getPrecio()%>"/><br>
                    <label>Precio promocional:</label>
                    <input type="text" class="form-control" name="precionuevo" placeholder="Precio" value="<%=producto.getPrecionuevo()%>" /><br>
                    <label>Stock:</label>
                    <input type="text" class="form-control" name="cantidad" placeholder="Cantidad" value="<%=producto.getStock()%>" /><br>
                    <label>Marca:</label>
                    <select name="marca" class="form-control">
                        <% for (Marca m : MarcaCad.listarTodoDeMarcas()) {%>
                        <option value="<%= m.getCodigo()%>" <%if(producto.getCodigo_marca()==(m.getCodigo())){%>
                          selected
                        <%}%> ><%=m.getNombre()%></option>
                        <%}%>
                    </select><br>
                    <label>Categoría:</label>
                    <select name="categoria" class="form-control">
                        <% for (Categoria c : CategoriaCad.listarTodoDeCategoria()) {%>
                        <option value="<%= c.getCodigo()%>" <%if(producto.getCodigo_marca()==(c.getCodigo())){%>
                          selected  
                        <%}%>><%=c.getNombre()%></option>
                        <%}%>
                    </select><br>
                    <label>Descripción detallada:</label>
                    <textarea name="descripcion" class="form-control" rows="4" cols="20" required >
                        <%=producto.getDescripcion()%>
                    </textarea><br>                  
                    <label class="checkbox-inline">
                        <input type="checkbox" name="nuevo" value="ON" <% if(producto.isNuevo()) { %> checked="checked"<%}%>/>Nuevo
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="recomendado" value="ON" <% if(producto.isRecomendado()) { %> checked="checked"<%}%>/>Recomendado
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="visible" value="ON" checked="checked"/>Visible
                    </label>
                    <hr/>
                    <input class="btn btn-success" name="confirmaEdicion" type="submit" value="Guardar" />
                    <a href="PanelAdmin" class="btn btn-default"><i class="fa fa-caret-left"></i> Volver</a><br><br>
                </div>
            </form>
        </div>                
    </body>
</html>
