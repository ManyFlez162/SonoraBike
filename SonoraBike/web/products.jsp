<%-- 
    Document   : products
    Author     : Brandon Figueroa Ugalde - 00000233295
    Author     : Manuel Francisco Flores Velazquez - 00000233301
--%>

<%@page import="Modelo.ControladorProducto"%>
<%@page import="Modelo.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.ModeloProducto"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Controlador.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <% request.getSession().removeAttribute("carrito");
        String correo = (String) request.getSession().getAttribute("correo");
        if (correo != null) {
            Usuario usuario = new Consultas().obtenerUsuario(correo);
            if (usuario.getEstado() != null) {
                response.sendRedirect("products2.jsp");
            } else {
                response.sendRedirect("administracion.jsp");
            }
        }
    %>
    <%
        ModeloProducto mp = new ModeloProducto();
        ArrayList<Producto> productos = mp.getAllProductos();
        System.out.println("Número de productos: " + productos.size());
        ControladorProducto cp = new ControladorProducto();
    %>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
              rel="stylesheet">

        <script src="assets/js/botones.js" type="text/javascript"></script>
        <title>Sonora Bike - Productos</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
        <link rel="stylesheet" href="assets/css/owl.css">

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
                    <a class="navbar-brand logo" href="index.jsp"><img class="logo" src="assets/images/logotipo.png"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                            aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp">Inicio
                                </a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="products.jsp">Productos
                                    <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="about.jsp">Conócenos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.jsp">Contáctanos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="loginButton" href="#" onclick="openLoginForm()">Iniciar Sesión</a>
                            </li>
                        </ul>
                        <!--Formulario emergente de inicio de sesion-->
                        <div class="w3-container">

                            <div id="id01" class="w3-modal" style="display:none">
                                <div class="w3-modal-content">
                                    <div class="w3-container">
                                        <!-- Modal body -->
                                        <form action="iniciarSesion" method="post">
                                            <h2>Inicio de sesión</h2>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
                                                <input type="email" class="form-control" placeholder="Ingresa tu email" id="correo" name="correo" required>
                                            </div>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fa fa-key" aria-hidden="true"></i></span>
                                                <input type="password" class="form-control" placeholder="Ingresa tu contraseña" id="pass" name="pass" required>
                                            </div>
                                            <br>
                                            <button type="submit" class="modalIniciar"><i class="fa fa-user-circle"
                                                                                          aria-hidden="true"></i>Iniciar Sesión</button>
                                        </form>
                                        <br>
                                        <p>¿No tienes una cuenta?</p>
                                        <a class="nav-link" href="registro.jsp">-- Haz click aquí para registrarte --</a>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger"
                                                    onclick="document.getElementById('id01').style.display = 'none'"
                                                    class="w3-button w3-display-topright"">Cerrar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </header>

        <!-- Page Content -->
        <div class=" page-heading products-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-content">
                            <br>
                            <br>
                            <br>
                            <h2>Productos de Sonora Bike</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="products">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="filters">
                            <ul>
                                <li class="active" data-filter="*">Todos</li>
                                <li data-filter="Montana">Bicicletas de Montaña</li>
                                <li data-filter="Ruta">Bicicletas de Ruta</li>
                                <li data-filter="Accesorio">Accesorios</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <%=cp.getProductos()%>
            </div>
        </div> 

        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="inner-content">
                            <p>Copyright &copy; 2023 - Sonora Bike - ITSON ISW
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
                                <!-- Puedes agregar campos ocultos para enviar información al servidor -->
                                <input type="hidden" name="idProducto" id="idProducto" value="1">
                                <input type="hidden" name="stock" id="stock">
                                <div class="form-group">
                                    <label for="quantity">Cantidad:</label>
                                    <input type="number" class="form-control" id="cantidad" name="cantidad" value="1" min="1" oninput="validarCantidad(this, document.getElementById('stock').value)" required>
                                </div>
                                <button type="submit" class="agregarCarrito" onclick="mostrarAlerta()">Agregar al carrito</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>

</html>
