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
                                   ${mensaje}
                                    <h3>Gestionar producto</h3>
                                    <form action="ControlProducto" enctype="multipart/form-data" method="post">
                                    <div class="form-one">
                                        Nombre:<input type="text" name="nombre" placeholder="Nombre Producto" value="" required />
                                        <hr/>
                                        Precio:<input type="number" name="precio" placeholder="Precio" value="0" min="0" />
                                        <hr/>
                                        Precio promo:<input type="number" name="precionuevo" placeholder="Precio" value="0" min="0" />
                                        <hr/>
                                        Stock:<input type="number" name="cantidad" placeholder="Cantidad" value="1" min="1" />
                                        <hr/>
                                        Marca:<select name="marca">
                                            <option>Seleccionar Marca</option>
                                            <% for (Marca m: MarcaCad.listarTodoDeMarcas()){%>
                                            <option value="<%= m.getCodigo() %>"><%=m.getNombre()%></option>
                                            <%}%>
                                        </select>
                                        Categoria:<select name="categoria">
                                            <option>Seleccionar categoria</option>
                                            <% for (Categoria c: CategoriaCad.listarTodoDeCategoria()){%>
                                            <option value="<%= c.getCodigo() %>"><%=c.getNombre()%></option>
                                            <%}%>
                                                
                                        </select>
                                        Descripcion:<textarea name="descripcion" rows="4" cols="20" placeholder="Descripcion" required >
                                        </textarea>
                                        <hr/>
                                        Nuevo?<input type="checkbox" name="nuevo" value="ON" checked="checked" style="margin-right: 10px"/>
                                        Recomendado?<input type="checkbox" name="recomendado" value="ON" style="margin-right: 10px"/>
                                        Visible?<input type="checkbox" name="visible" value="ON" checked="checked" />
                                        <hr/>
                                        <input type="file" name="imagen" required />
                                        <hr/>
                                        <input class="btn btn-success" name="accion" type="submit" value="Registrar" />
                                        <input class="btn btn-warning" name="update" type="submit" value="Actualizar" />
                                       <input class="btn btn-default" name="accion" type="submit" value="Consultar" />
                                        
                                       
                                    </div>
				</form>
                                            <form action="Delete" enctype="multipart/form-data" method="post">
                                                <input class="btn btn-warning" name="update" type="submit" value="Delete" />
                                            </form>
				</div>
			</div>
		</div>
	</section>
                                    <%@include file="../../WEB-INF/footer.jsp" %>
                                    <%@include file="../../WEB-INF/js.jsp" %>                                    
</body>
</html>
