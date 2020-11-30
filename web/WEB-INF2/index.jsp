
<%@page import="cad.ProductoCad"%>
<%@page import="cad.CategoriaCad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cad.MarcaCad"%>
<%@page import="JavaBeans.Marca"%>
<%@page import="JavaBeans.Categoria"%>
<%@page import="JavaBeans.Producto"%>

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
  

        <section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
                                    <%@include file="../WEB-INF/izquierda.jsp" %>
				</div>
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
                                                <%! ArrayList<Producto> datos; 
                                                String titulo;%>
                                                <% if (session.getAttribute("category")!=null && Integer.parseInt(session.getAttribute("category").toString())>0){
                                                    titulo = CategoriaCad.obtenerCategoria(Integer.parseInt(session.getAttribute("category").toString()));
                                                    datos = ProductoCad.listarProductoPorCategoria(Integer.parseInt(session.getAttribute("category").toString()));
                                                    session.setAttribute("category", null);
                                                }else if (session.getAttribute("brand")!=null && Integer.parseInt(session.getAttribute("brand").toString())>0){
                                                    datos = ProductoCad.listarProductoPorMarca(Integer.parseInt(session.getAttribute("brand").toString()));
                                                    titulo = MarcaCad.obtenerMarca(Integer.parseInt(session.getAttribute("brand").toString()));
                                                    session.setAttribute("brand", null);
                                                }else{
                                                    titulo = "Productos destacados";
                                                     datos = ProductoCad.listarProductosRecomendados();
                                                } %>
                                                <h2 class="title text-center"><%=titulo %></h2>
                                                <% for (Producto p : datos){%>
                                                <div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<img src="foto/<%=p.getImg()%>" alt="" />
                                                                                        <h2 <%if (p.getStock()==0) {%>
                                                                                                class="gris"
                                                                                            <%}
                                                                                            %>>$<%= p.getPrecio()%> </h2>
											<p> <%= p.getNombre() %></p>
											<span class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Agregar al carrito</span>
										</div>
										<div class="product-overlay <%if (p.getStock()==0) {%>
                                                                                                grisfondo
                                                                                            <%}%> ">
											<div class="overlay-content">
												<h2>$<%= p.getPrecio()%></h2>
												<p><%= p.getNombre() %></p>
												<a href="Cart?id=<%= p.getWebId()%>&action=order" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Agregar al carrito</a>
											</div>
										</div>
                                                                                                <%if (p.isNuevo()) {%>
                                                                                                <img src="images/home/new.png" class="new" alt="producto nuevo" />
                                                                                                <%}%>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href=""><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></a></li>
										<%if (p.getStock()==0) {%>
                                                                                                <li><a href="#"><i class="fa fa-check-circle"></i>Agotado</a></li>
                                                                                            <%} else {%>  <li><a href="#"><i class="fa fa-check-circle"></i>(<%= p.getStock()%>)Disponible</a></li> <%}%>
                                                                                            
                                                                                
									</ul>
								</div>
							</div>
						</div>
                                        <%}%>
					</div><!--features_items-->
				</div>
			</div>
		</div>
	</section>
                                    <%@include file="../WEB-INF/footer.jsp" %>
                                    <%@include file="../WEB-INF/js.jsp" %>                                    
</body>
</html>
