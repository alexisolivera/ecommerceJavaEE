<%-- 
    Document   : header
    Created on : 18-ene-2019, 0:02:20
    Author     : Alexis
--%>
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
    <title>Gestion de productos |  e-Commerce desarrollado por Alexis Olivera</title>
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
                                <form action="ControlProducto" method="post">
                                    <div class="form-one">
                                        Nombre:<input type="text" name="nombre" placeholder="Nombre Producto" value="" required />
                                        Precio:<input type="number" name="precio" placeholder="Precio" value="0" min="0" />
                                        Precio promo:<input type="number" name="precionuevo" placeholder="Precio" value="0" min="0" />
                                        Stock:<input type="number" name="cantidad" placeholder="Cantidad" value="1" min="1" />
                                        Marca:<select name="marca">
                                            <option></option>
                                            <option></option>
                                        </select>
                                        Categoria:<select name="categoria">
                                            <option></option>
                                            <option></option>
                                        </select>
                                        Descripcion:<textarea name="descripcion" rows="4" cols="20" placeholder="Descripcion" required >
                                        </textarea>
                                        Nuevo?<input type="checkbox" name="nuevo" value="ON" checked="checked" />
                                        Recomendado?<input type="checkbox" name="recomendado" value="OFF" />
                                        Visible?<input type="checkbox" name="visible" value="ON" checked="checked" />
                                        <input type="file" name="imagen" value="Seleccionar una imagen" required />
                                        <input class="btn btn-success" name="accion" type="submit" value="Registrar" />
                                        <input class="btn btn-default" name="accion" type="submit" value="Consultar" />
                                        <input class="btn btn-warning" name="accion" type="submit" value="Actualizar" />
                                        <input class="btn btn-danger" name="accion" type="submit" value="Borrar" />
                                        
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
