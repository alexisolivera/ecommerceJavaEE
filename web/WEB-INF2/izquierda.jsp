<%-- 
    Document   : izquierda
    Created on : 18-ene-2019, 0:08:58
    Author     : Alexis
--%>

					<%@page import="JavaBeans.Marca"%>
<%@page import="cad.MarcaCad"%>
<div class="left-sidebar">
						<h2>Categorías</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
                                                    <%!
                                                        ArrayList<Categoria> lista=CategoriaCad.listar();
                                                        int codigo =0;
                                                    %>
                                                    <% 
                                                        for(int i=0;lista.size()>i;i++){ 
                                                        codigo=lista.get(i).getCodigo();
                                                    %>
                                                    <div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
                                                                            <a <% if(CategoriaCad.esSuperior(codigo)) {%>data-toggle="collapse" data-parent="#accordian" <% } %> href="#<%= codigo %>">
											 <% if(CategoriaCad.esSuperior(codigo)){ %><span class="badge pull-right"> <i class="fa fa-plus"></i></span> <% } %>
                                                                                         <a href="?category=<%=codigo%>"><%= lista.get(i).getNombre() %></a>
										</a>
									</h4>
								</div>
								<div id="<%= codigo %>" class="panel-collapse collapse">
									<div class="panel-body">
                                                                            <ul>
                                                                                <% ArrayList<Categoria> listaSub=CategoriaCad.listarSubCategorias(codigo); %>
                                                                                <% 
                                                                                    for(int isub=0;listaSub.size()>isub;isub++){ 
                                                                                    codigo=listaSub.get(isub).getCodigo();
                                                                                %>                                            
                                                                                    <li><a href="?category=<%=codigo%>"><%= listaSub.get(isub).getNombre() %> </a></li>
                                                                            <% } %>
                                                                            </ul>
									</div>
								</div>
							</div>
                       <% } %>
						
						</div><!--/category-products-->
					
						<div class="brands_products"><!--brands_products-->
							<h2>Marcas</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
                                                                    <%for(Marca m : MarcaCad.listarTodoDeMarcas()){ %>
                                                                    
                                                                    <% %>
                                                                    <li><a href="?brand=<%=m.getCodigo()%>"> <span class="pull-right">(<%=MarcaCad.contarMarcas(m.getCodigo())%>)</span><%=m.getNombre()%></a></li>
                                                                        <%}%>
								</ul>
							</div>
						</div><!--/brands_products-->
					</div>