<%-- 
    Document   : index2
    Author     : Brandon Figueroa Ugalde - 00000233295
    Author     : Manuel Francisco Flores Velazquez - 00000233301
--%>

<%@page import="Modelo.ControladorProducto"%>
<%@page import="Modelo.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.ModeloProducto"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    HttpSession objSesion = request.getSession(false);
    String correo = (String) objSesion.getAttribute("correo");
    if (correo == null || correo.isEmpty()) {
        // Si el correo no está presente en la sesión, redirige a la página de inicio de sesión
        response.sendRedirect("index.jsp");
    }
    objSesion.setAttribute("correo", correo);
    // Aquí puedes utilizar la variable 'correo' para cualquier propósito en tu página
%>
<%
    ModeloProducto mp = new ModeloProducto();
    ArrayList<Producto> productos = mp.getAllProductos();
    System.out.println("Número de productos: " + productos.size());
    ControladorProducto cp = new ControladorProducto();
%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
              rel="stylesheet">

        <script src="assets/js/botones.js" type="text/javascript"></script>
        <title>SonoraBike - Inicio</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
        <link rel="stylesheet" href="assets/css/owl.css">

        <%
            String mensaje = (String) request.getSession().getAttribute("mensaje");
            if (mensaje != null) {
        %>
        <script>
            alert("<%= mensaje%>");
            // Elimina el mensaje de la sesión después de mostrarlo
            <% session.removeAttribute("mensaje"); %>
        </script>
        <%
            }
        %>
    </head>

    <body>

        <!-- ***** Preloader Start ***** -->
        <div id="preloader">
            <div class="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
        <!-- ***** Preloader End ***** -->

        <!-- Header -->
        <header class="">
            <nav class="navbar navbar-expand-lg">
                <div class="container">
                    <!--  <a class="navbar-brand" href="index.html"><h2>Sixteen <em>Clothing</em></h2></a> -->
                    <a class="navbar-brand logo" href="index2.jsp"><img class="logo" src="assets/images/logotipo.png"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                            aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="index2.jsp">Inicio
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="products2.jsp">Productos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="about2.jsp">Conócenos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact2.jsp">Contáctanos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="informacion_usuario.jsp"">Información</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="carrito.jsp"">Carrito</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="compras.jsp"">Mis compras</a>
                            </li>
                            <li class=" nav-item">
                                <a class="nav-link" href="cerrarSesion">Cerrar Sesión</a>
                            </li>
                        </ul>
                    </div>
            </nav>
        </header>

        <!-- Page Content -->
        <!-- Banner Starts Here -->
        <div class=" banner header-text">
            <div class="owl-banner owl-carousel">
                <div class="banner-item-01">
                    <div class="text-content">
                        <h4>Eventos</h4>
                        <h2><strong>Asiste a la pedaleada nocturna</strong></h2>
                    </div>
                </div>
                <div class="banner-item-02">
                    <div class="text-content">
                        <h4>Concurso</h4>
                        <h2><strong>Concurso Anual 2023</strong></h2>
                    </div>
                </div>
                <div class="banner-item-03">
                    <div class="text-content">
                        <h4>Aparta tu bicicleta para Navidad</h4>
                        <h2><strong>Sistema de Aparatado Disponible</strong></h2>
                    </div>
                </div>
            </div>
        </div>
        <!-- Banner Ends Here -->


        <div class="latest-products">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Productos Recientes</h2>
                            <a href="products2.jsp">Ver todos<i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>
                    <div class="container-fluid">
                        <div class="row">
                            <%=cp.obtenerProductos()%>
                        </div>
                    </div> 
                </div>
            </div>
        </div>

        <div class="best-features">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>¿Qué es Sonora Bike?</h2>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="left-content">
                            <p>
                                Sunce-atelier es una empresa fundada por Sleepysuny, una artista y diseñadora gráfica de
                                Ciudad Obregón, Sonora, México. Comenzó en 2022 como respuesta a la necesidad de
                                impresiones de alta calidad a precios accesibles. 
                            </p>
                            <p>
                                Sleepysuny, una estudiante de diseño
                                gráfico, amplió su negocio para servir a una audiencia más amplia, manteniendo la calidad
                                y escuchando los comentarios de los clientes. Ofrecemos envíos locales y estamos
                                considerando la expansión a nivel nacional e internacional en el futuro.
                            </p>
                            <a href="about2.jsp" class="filled-button">Leer más</a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="right-image">
                            <img src="assets/images/logotipo.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="inner-content">
                            <p>Copyright &copy; 2023 - SonoraBike - ITSON ISW
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


        <!-- Additional Scripts -->
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>
        <script src="assets/js/slick.js"></script>
        <script src="assets/js/isotope.js"></script>
        <script src="assets/js/accordions.js"></script>


        <script language="text/Javascript">
            cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
            function clearField(t) {                   //declaring the array outside of the
                if (!cleared[t.id]) {                      // function makes it static and global
                    cleared[t.id] = 1;  // you could use true and false, but that's more typing
                    t.value = '';         // with more chance of typos
                    t.style.color = '#fff';
                }
            }
        </script>

        <div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="productModalLabel"></h2>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="text-center">
                                    <img id="productImage" src="" alt="" class="productoVentana img-fluid">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <h3 id="productDescription"></h3>
                                <br>
                                <h2 id="productPrice"></h2>
                                <form action="agregarCarrito" method="post" id="addToCartForm">
                                    <!-- Puedes agregar campos ocultos para enviar información al servidor -->
                                    <input type="hidden" name="idProducto" id="idProducto" value="1">
                                    <input type="hidden" name="stock" id="stock">
                                    <div class="form-group">
                                        <label for="quantity">Cantidad:</label>
                                        <input type="number" class="form-control" id="cantidad" name="cantidad" value="1" min="1" oninput="validarCantidad(this, document.getElementById('stock').value)" required>
                                    </div>
                                    <button type="submit" class="agregarCarrito">Agregar al carrito</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>
