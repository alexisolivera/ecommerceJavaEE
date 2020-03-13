

<%@page import="JavaBeans.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Inicio |  e-Commerce desarrollado por Alexis Olivera</title>
    <%@include file="../WEB-INF/css.jsp" %>
    
    
</head><!--/head-->

<body>
    <%@include file="../WEB-INF/header.jsp" %>


<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Carrito</a></li>
				  <li class="active">Lista de productos</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Producto</td>
							<td class="description"></td>
							<td class="price">Precio</td>
							<td class="quantity">Cantidad</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
                                            <% ArrayList<Item> itemsList = (ArrayList<Item>)session.getAttribute("cart"); 
                                            float asd = 0;
                                             for (Item i : itemsList){
                                                asd = asd + i.getP().getPrecio() * i.getCantidad();%>
                                                <tr> 
							<td class="cart_product">
                                                            <a href=""><img src="foto/<%=i.getP().getImg()%>" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href=""><%=i.getP().getNombre()%></a></h4>
								<p>ID Referencia Web: <%=i.getP().getWebId()%></p>
							</td>
							<td class="cart_price">
								<p>$<%=i.getP().getPrecio()%></p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href="Cart?id=<%= i.getP().getWebId()%>&action=order"> + </a>
									<input class="cart_quantity_input" type="text" name="quantity" value="<%=i.getCantidad()%>" autocomplete="off" size="2">
									<a class="cart_quantity_down" href="Cart?id=<%= i.getP().getWebId()%>&action=resta"> - </a>
								</div>
							</td>
							<td class="cart_total">
								<p id="precio_1" class="cart_total_price">$<%=i.getP().getPrecio() * i.getCantidad() %></p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href="?action=delete&id=<%=i.getP().getWebId()%>"><i class="fa fa-times"></i></a>
							</td>
						</tr>
                                                <%}%>
                                              
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			<div class="heading">
				<h3>¿Qué te gustaría hacer ahora?</h3>
				<p>Te gustaría pagar o seguir comprando?</p>
			</div>
			<div class="row">
				
				<div class="col-sm-10">
					<div class="total_area">
						<ul>
                                                    <li>Sub Total <span>$<%=asd%></span></li>
							<li>Tax/IVA(21%) <span><%=asd*0.21%></span></li>
                                                        <li><h3>Total <span>$<%=asd*1.21%></span></h3></li>
						</ul>
                                            <a class="btn btn-default update" href="Home">Seguir comprando</a>
                                            <a class="btn btn-default check_out" href="Checkout">Realizar pago</a>
					</div>
				</div>
			</div>
		</div>
	</section><!--/#do_action-->
                                            <%@include file="../WEB-INF/footer.jsp" %>
                                    <%@include file="../WEB-INF/js.jsp" %>                                    
</body>
</html>
