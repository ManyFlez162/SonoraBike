<%-- 
    Document   : contact
    Author     : Brandon Figueroa Ugalde - 00000233295
    Author     : Manuel Francisco Flores Velazquez - 00000233301
--%>

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
                response.sendRedirect("contact2.jsp");
            } else {
                response.sendRedirect("administracion.jsp");
            }
        }
    %>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
              rel="stylesheet">

        <script src="assets/js/botones.js" type="text/javascript"></script>
        <title>Sonora Bike - Contacto</title>

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
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp">Inicio
                                </a>
                            </li> 
                            <li class="nav-item">
                                <a class="nav-link" href="products.jsp">Productos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="about.jsp">Conócenos</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="contact.jsp">Contáctanos
                                    <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="userInfoLink" href="informacion_usuario.jsp" style="display: none">Ver información del usuario</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="loginButton" href="#" onclick="toggleCloseState()">Iniciar Sesión</a>
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
                                            <button type="button" class="btn btn-danger" onclick="document.getElementById('id01').style.display = 'none'" class="w3-button w3-display-topright"">Cerrar</button>
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
        <div class="page-heading contact-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-content">
                            <br>
                            <br>
                            <br>
                            <h2>Pongámonos en contacto</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="find-us">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>¿Dónde encontrarnos?</h2>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div>
                            <a href="https://www.google.com/maps/dir/?api=1&destination=27.504314397075%2C-109.93500383347" target="_blank">
                                <img src="assets/images/maps.jpg" width="500px" height="550px">
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="left-content">
                            <h4>Sobre nosotros</h4>
                            <p>
                                Si gustas visitarnos puedes encontrarnos en Chihuahua #535 entre Mayo y Yaqui Zona Norte, Ciudad Obregón, Mexico
                                en nuestra sucursal, estaremos encantandos de atenderte.
                                <br>
                                <br>
                                Recuerda que nuestro horario es de Lunes - Viernes de 9:00 AM a 7:00 PM y Sábados de 9:00 AM a 3:00 PM. 
                                <br>
                                <br>
                                ¡Te esperamos!
                                <br>
                                <br>
                                También se puede contactar llenando el formulario que se encuentra al final de esta página o por alguna de nuestras
                                redes sociales / correo electrónico.
                            </p>
                            <ul class="social-icons">
                                <li><a target="_blank" href="https://www.instagram.com/sonorabike/?hl=es-la"><i class="fa fa-instagram"></i></a></li>
                                <li><a target="_blank" href="https://www.facebook.com/SonoraBike?locale=es_LA"><i class="fa fa-facebook"></i></a></li>
                                <li><a target="_blank" href="https://www.google.com/maps/dir/?api=1&destination=27.504314397075%2C-109.93500383347"><i class="fa fa-map-marker"></i></a></li>
                                <li><a target="_blank" href="mailto:sonorabike@gmail.com"><i class="fa fa-envelope"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="send-message">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Envíanos un mensaje</h2>
                        </div>
                    </div>
                    <center>
                        <div class="col-md-8">

                            <div class="contact-form">
                                <form id="contact" action="index.jsp" method="post" onsubmit="return validarContacto()">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <fieldset>
                                                <input name="name" type="text" class="form-control" id="name" placeholder="Nombre completo" required="">
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <fieldset>
                                                <input name="email" type="text" class="form-control" id="email" placeholder="E-Mail" required="">
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <fieldset>
                                                <input name="subject" type="text" class="form-control" id="subject" placeholder="Asunto" required="">
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-12">
                                            <fieldset>
                                                <textarea name="message" rows="6" class="form-control" id="message" placeholder="Mensaje" required=""></textarea>
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-12">
                                            <fieldset>
                                                <button type="submit" id="form-submit" class="filled-button">Enviar mensaje</button>
                                            </fieldset>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </center>
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


        <script language = "text/Javascript">
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

