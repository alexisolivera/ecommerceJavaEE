<%-- 
    Document   : header
    Created on : 18-ene-2019, 0:02:20
    Author     : Alexis
--%>

<header id="header"><!--header-->
    <div class="header_top"><!--header_top-->
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <li><a href="#"><i class="fa fa-phone"></i> 0341-4568928</a></li>
                            <li><a href="#"><i class="fa fa-envelope"></i> administracion@luisitosport.com</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="social-icons pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header_top-->

    <div class="header-middle"><!--header-middle-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="logo pull-left">
                        <a href="Home"><img src="images/home/logo.png" width="150px" /></a>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="shop-menu pull-right">
                        <ul class="nav navbar-nav">
                            <% Object isLogged = session.getAttribute("sesionExitosa");%>
                            <%if (isLogged != null && (Boolean) isLogged) {%>
                            <% String nombre = (String)session.getAttribute("nombreDeUsuario");%>
                            <li><a href="PanelAdmin"><i class="fa fa-user"></i>Mi cuenta (<%=nombre%>)</a></li>
                            <li><a href="CerrarSesion"><i class="fa fa-lock"></i> Salir</a></li>
                                <%} else {%>
                            <li><a href="Login"><i class="fa fa-lock"></i> Acceder</a></li>
                                <%}%>
                            <li><a href="Cart"><i class="fa fa-shopping-cart"></i> Ver carrito</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-middle-->

    <div class="header-bottom"><!--header-bottom-->
        <div class="container">

        </div>
    </div><!--/header-bottom-->
</header><!--/header-->