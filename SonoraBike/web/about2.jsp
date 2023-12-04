<%-- 
    Document   : about2
    Author     : Brandon Figueroa Ugalde - 00000233295
    Author     : Manuel Francisco Flores Velazquez - 00000233301
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <title>Sonora Bike - Conócenos</title>

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
                    <a class="navbar-brand logo" href="index2.jsp"><img class="logo" src="assets/images/logotipo.png"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                            aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="index2.jsp">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="products2.jsp">Productos</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="about2.jsp">Conócenos
                                    <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact2.jsp">Contáctanos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="informacion_usuario.jsp"">Ver
                                    información del usuario</a>
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
        <div class="page-heading about-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-content">
                            <br>
                            <br>
                            <br>
                            <h2>Sobre Sonora Bike</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="best-features about-features">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>¿Quiénes somos?</h2>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="right-image">
                            <img src="assets/images/logotipo.png" alt="">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="left-content">
                            <p>
                                Sonora Bike
                            </p>
                            <p>
                                Hace unos años, en el árido y apasionante estado de Sonora, nació una empresa que 
                                cambiaría la forma en que los amantes del ciclismo disfrutan de su pasión: Sonora Bike. 
                                Fundada por un grupo de entusiastas sonorenses apasionados por el ciclismo, la empresa 
                                surgió con el objetivo de ofrecer productos de alta calidad y especializados para los 
                                amantes de las dos ruedas.
                            </p>
                            <p>
                                La historia de Sonora Bike comenzó en un pequeño local en la ciudad de Hermosillo, donde 
                                un grupo de amigos que compartían la misma pasión por el ciclismo decidió convertir su 
                                amor por las bicicletas en un negocio. Inspirados por la belleza y diversidad de los 
                                paisajes sonorenses, desde los desiertos áridos hasta las montañas escarpadas, sabían que
                                estaban en el lugar perfecto para fomentar una cultura ciclista vibrante.
                            </p>
                            <p>
                                Desde el principio, la empresa se comprometió a ofrecer no solo productos de alta calidad, 
                                sino también una experiencia personalizada para cada cliente. Se especializaron en la venta
                                de bicicletas de montaña, bicicletas de carretera, accesorios especializados y equipo de 
                                seguridad. La visión de Sonora Bike era ser mucho más que una tienda; querían ser un punto 
                                de encuentro para la comunidad ciclista local.
                            </p>
                            <p>
                                Con el tiempo, Sonora Bike ganó reputación por su servicio al cliente excepcional, 
                                asesoramiento experto y la cuidada selección de productos de las marcas más reconocidas en
                                la industria del ciclismo. Su compromiso con la comunidad local se tradujo en la organización
                                de eventos, competiciones y programas de capacitación para fomentar el amor por el ciclismo 
                                en todas sus formas.
                            </p>
                            <p>
                                A medida que la empresa creció, expandieron su presencia en línea, permitiendo que su dedicación 
                                y experiencia trascendieran las fronteras sonorenses. La marca Sonora Bike se convirtió en sinónimo 
                                de calidad y pasión por el ciclismo, atrayendo a clientes de todo México y más allá.
                            </p>
                            <p>
                                Hoy en día, Sonora Bike es mucho más que una tienda; es un referente en la comunidad ciclista, un
                                lugar donde los entusiastas pueden encontrar no solo productos de alta calidad, sino también el
                                apoyo y la camaradería de una comunidad que comparte su amor por las bicicletas. La empresa sigue 
                                creciendo, pero su espíritu sigue siendo fiel a sus raíces sonorenses, ofreciendo un oasis para 
                                los amantes del ciclismo en el corazón del desierto.
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
