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
        <title>ff</title>
        <%@include file="../../WEB-INF/css.jsp" %>


    </head><!--/head-->

    <body>
        <%@include file="../../WEB-INF/header.jsp" %>
        <% Producto producto = (Producto) session.getAttribute("productoAeditar");%>
        <form action="ControlmandaDatosParaEditar" method="post">
            <div class="form-one">
                <hr/>
                Codigo:<input type="text" name="codigo" value="<%=producto.getWebId()%>" readonly="" />
                <hr/>
                Nombre:<input type="text" name="nombre" placeholder="Nombre Producto" value="<%=producto.getNombre()%>" required />
                <hr/>
                Precio:<input type="text" name="precio" placeholder="Precio" value="<%=producto.getPrecio()%>"/>
                <hr/>
                Precio promo:<input type="text" name="precionuevo" placeholder="Precio" value="<%=producto.getPrecionuevo()%>" />
                <hr/>
                Stock:<input type="text" name="cantidad" placeholder="Cantidad" value="<%=producto.getStock()%>" />
                <hr/>
                Marca:<select name="marca">
                    <% for (Marca m : MarcaCad.listarTodoDeMarcas()) {%>
                    <option value="<%= m.getCodigo()%>" <%if(producto.getCodigo_marca()==(m.getCodigo())){%>
                      selected  
                    <%}%> ><%=m.getNombre()%></option>
                    <%}%>
                </select>
                Categoria:<select name="categoria">
                    <% for (Categoria c : CategoriaCad.listarTodoDeCategoria()) {%>
                    <option value="<%= c.getCodigo()%>" <%if(producto.getCodigo_marca()==(c.getCodigo())){%>
                      selected  
                    <%}%>><%=c.getNombre()%></option>
                    <%}%>
                </select>
                Descripcion:<textarea name="descripcion" rows="4" cols="20" required >
                    <%=producto.getDescripcion()%>
                </textarea>
                <hr/>
                Nuevo?<input type="checkbox" name="nuevo" value="ON" <% if(producto.isNuevo()){ %>
                    checked="checked"
                <%}%> style="margin-right: 10px"/>
                Recomendado?<input type="checkbox" name="recomendado" value="ON"  <% if(producto.isRecomendado()){ %>
                    checked="checked"
                <%}%> style="margin-right: 10px"/>
                Visible?<input type="checkbox" name="visible" value="ON"  <% if(producto.isVisible()){ %>
                    checked="checked"
                <%}%> />
                <input class="btn btn-success" name="confirmaEdicion" type="submit" value="" />
            </div>
        </form>
    </body>
</html>
