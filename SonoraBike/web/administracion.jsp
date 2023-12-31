<%-- 
    Document   : administracion
    Author     : Brandon Figueroa Ugalde - 00000233295
    Author     : Manuel Francisco Flores Velazquez - 00000233301
--%>

<%@page import="Controlador.Consultas"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.ModeloUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Producto"%>
<%@page import="Modelo.ModeloProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion = request.getSession(true);
    ModeloProducto mp = new ModeloProducto();
    ArrayList<Producto> productos = mp.getAllProductos();
    ModeloUsuario mu = new ModeloUsuario();
    ArrayList<Usuario> usuarios = mu.getAllUsuarios();
%>

<% request.getSession().removeAttribute("carrito");
    String correo = (String) request.getSession().getAttribute("correo");
    if (correo != null) {
        Usuario usuario = new Consultas().obtenerUsuario(correo);
        if (usuario.getEstado() != null) {
            response.sendRedirect("index2.jsp");
        }
    } else {
        response.sendRedirect("index.jsp");
    }
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <script src="assets/js/botones.js" type="text/javascript"></script>
        <title>Sonora Bike - Inicio</title>

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
            <% request.getSession().removeAttribute("mensaje"); %>
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
                    <a class="navbar-brand logo" href="administracion.jsp"><img class="logo" src="assets/images/logotipo.png"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                            aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#" onclick="openAgregarProductoForm()">Agregar Producto
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" onclick="openActualizarProductoForm()">Actualizar Producto</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" onclick="openEliminarProductoForm()">Eliminar Producto</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" onclick="openEliminarUsuarioForm()">Eliminar Usuario</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="informacion_administrador.jsp"">Información</a>
                            </li>
                            <li class=" nav-item">
                                <a class="nav-link" href="cerrarSesion">Cerrar Sesión</a>
                            </li>
                        </ul>

                        <div class="w3-container">
                            <div id="agregarProducto" class="w3-modal" style="display:none">
                                <div class="w3-modal-content">
                                    <div class="w3-container">
                                        <!-- Modal body -->
                                        <form action="agregarProducto" method="post">
                                            <h2>Agregar Producto</h2>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-font"></i></span>
                                                <input type="text" class="form-control" placeholder="Ingrese el nombre del producto" id="nombreProducto" name="nombreProducto" required>
                                            </div>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-image"></i></span>
                                                <input type="text" class="form-control" placeholder="Ingrese la ruta de la imagen" id="img" name="img" required>
                                            </div>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                                                <input type="text" class="form-control" placeholder="Ingrese el precio" id="precio" name="precio" oninput="validarPrecio(this)" required>
                                            </div>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-tags"></i></span>
                                                <select class="form-select" id="tipo" name="tipo" required>
                                                    <option value="" disabled selected>Selecciona el tipo</option>
                                                    <option value="Montana">Bicicleta de Montaña</option>
                                                    <option value="Ruta">Bicicletas de Ruta</option>
                                                    <option value="Accesorio">Accesorios</option>
                                                    <!-- Agrega más opciones según sea necesario -->
                                                </select>
                                            </div>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-list-ol"></i></span>
                                                <input type="text" class="form-control" placeholder="Ingrese el stock" id="stock" name="stock" oninput="validarNumero(this)" required>
                                            </div>
                                            <br>
                                            <button type="submit" class="modalIniciar">Agregar Producto</button>
                                        </form>
                                        <br>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger"
                                                    onclick="document.getElementById('agregarProducto').style.display = 'none'"
                                                    class="w3-button w3-display-topright"">Cerrar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="w3-container">
                            <div id="actualizarProducto" class="w3-modal" style="display:none">
                                <div class="w3-modal-content">
                                    <div class="w3-container">
                                        <!-- Modal body -->
                                        <form action="actualizarProducto" method="post">
                                            <h2>Actualizar Producto</h2>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                                                <input type="number" class="form-control" placeholder="Ingrese el id del producto" id="idProducto" name="idProducto" oninput="validarNumero(this)" required>
                                            </div>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-font"></i></span>
                                                <input type="text" class="form-control" placeholder="Ingrese el nombre del producto" id="nombreProducto" name="nombreProducto" required>
                                            </div>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-image"></i></span>
                                                <input type="text" class="form-control" placeholder="Ingrese la ruta de la imagen" id="img" name="img" required>
                                            </div>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                                                <input type="number" class="form-control" placeholder="Ingrese el precio" id="precio" name="precio" oninput="validarPrecio(this)" required>
                                            </div>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-tags"></i></span>
                                                <select class="form-select" id="tipo" name="tipo" required>
                                                    <option value="" disabled selected>Selecciona el tipo</option>
                                                    <option value="Montana">Bicicleta de Montaña</option>
                                                    <option value="Ruta">Bicicleta de Ruta</option>
                                                    <option value="Accesorio">Accesorio</option>
                                                </select>
                                            </div>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-list-ol"></i></span>
                                                <input type="number" class="form-control" placeholder="Ingrese el stock" id="stock" name="stock" oninput="validarNumero(this)" required>
                                            </div>
                                            <br>
                                            <button type="submit"  class="modalIniciar"></i>Actualizar Producto</button>
                                        </form>
                                        <br>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger"
                                                    onclick="document.getElementById('actualizarProducto').style.display = 'none'"
                                                    class="w3-button w3-display-topright"">Cerrar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="w3-container">
                            <div id="eliminarProducto" class="w3-modal" style="display:none">
                                <div class="w3-modal-content">
                                    <div class="w3-container">
                                        <!-- Modal body -->
                                        <form action="eliminarProducto" method="post">
                                            <h2>Eliminar Producto</h2>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                                                <input type="number" class="form-control" placeholder="Ingrese el id del producto" id="idProducto" name="idProducto" oninput="validarNumero(this)" required>
                                            </div>
                                            <br>
                                            <button type="submit" class="modalIniciar">Eliminar Producto</button>
                                        </form>
                                        <br>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger"
                                                    onclick="document.getElementById('eliminarProducto').style.display = 'none'"
                                                    class="w3-button w3-display-topright"">Cerrar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="w3-container">
                            <div id="eliminarUsuario" class="w3-modal" style="display:none">
                                <div class="w3-modal-content">
                                    <div class="w3-container">
                                        <!-- Modal body -->
                                        <form action="eliminarUsuario" method="post">
                                            <h2>Eliminar Usuario</h2>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                                                <input type="number" class="form-control" placeholder="Ingrese el id del usuario" id="idProducto" name="idUsuario" oninput="validarNumero(this)" required>
                                            </div>
                                            <br>
                                            <button type="submit" class="modalIniciar">Eliminar Usuario</button>
                                        </form>
                                        <br>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger"
                                                    onclick="document.getElementById('eliminarUsuario').style.display = 'none'"
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

        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <h2>Productos</h2>
                    <br>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID Producto</th>
                                <th>Nombre</th>
                                <th>Ruta de la Imagen</th>
                                <th>Precio</th>
                                <th>Tipo</th>
                                <th>Stock</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Producto producto : productos) {%>
                            <tr>
                                <td><%= producto.getId()%></td>
                                <td><%= producto.getNombre()%></td>
                                <td><img src="<%= producto.getImg()%>" alt="Imagen de Producto" style="max-width: 100px; max-height: 100px;"></td>
                                <td><%= producto.getPrecio()%></td>
                                <td><%= producto.getTipo()%></td>
                                <td><%= producto.getStock()%></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <h2>Usuarios</h2>
                    <br>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID Usuario</th>
                                <th>Nombre</th>
                                <th>Pass</th>
                                <th>Correo</th>
                                <th>Telefono</th>
                                <th>Tipo</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Usuario usuario : usuarios) {%>
                            <tr>
                                <td><%= usuario.getId_usuario()%></td>
                                <td><%= usuario.getNombre()%></td>
                                <td><%= usuario.getPass()%></td>
                                <td><%= usuario.getCorreo()%></td>
                                <td><%= usuario.getTelefono()%></td>
                                <td><%= usuario.getTipo()%></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
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

    </body>

</html>
