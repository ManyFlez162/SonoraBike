let isLoggedIn = false;
var articulos = [];

function openLoginForm() {
    document.getElementById('id01').style.display = 'block';
}

function closeLoginForm() {
    document.getElementById('id01').style.display = 'none';
}


function openAgregarProductoForm() {
    document.getElementById('agregarProducto').style.display = 'block';
}

function closeAgregarProductoForm() {
    document.getElementById('agregarProducto').style.display = 'none';
}

function openActualizarProductoForm() {
    document.getElementById('actualizarProducto').style.display = 'block';
}

function closeActualizarProductoForm() {
    document.getElementById('actualizarProducto').style.display = 'none';
}

function openEliminarProductoForm() {
    document.getElementById('eliminarProducto').style.display = 'block';
}

function closeEliminarProductoForm() {
    document.getElementById('eliminarProducto').style.display = 'none';
}

function openEliminarUsuarioForm() {
    document.getElementById('eliminarUsuario').style.display = 'block';
}

function closeEliminarUsuarioForm() {
    document.getElementById('eliminarUsuario').style.display = 'none';
}

function toggleCloseState() {
    const loginButton = document.getElementById('loginButton');
    if (isLoggedIn) {
        // El usuario está cerrando la sesión
        isLoggedIn = false;
        loginButton.textContent = 'Iniciar Sesion';
        userInfoLink.style.display = 'none';
    } else {
        openLoginForm(); // Abre el formulario
    }
}

let cambiosPendientes = false;

function editarCampo(id) {
    const campo = document.getElementById(id);
    const botonEditar = document.getElementById('edit' + id);
    campo.disabled = !campo.disabled;
    botonEditar.textContent = campo.disabled ? 'Editar' : 'Cancelar';
    cambiosPendientes = true;
}


function restaurarCambios() {
    const form = document.getElementById('userForm');
    form.reset();
    cambiosPendientes = false;
    document.getElementById('confirmacion').style.display = 'none';
}

function restaurarCambiosAdministrador() {
    const form = document.getElementById('adminForm');
    form.reset();
    cambiosPendientes = false;
    document.getElementById('confirmacion').style.display = 'none';
}

// JavaScript para mostrar la ventana emergente y llenarla con detalles del producto
document.addEventListener("DOMContentLoaded", function () {
    const productLinks = document.querySelectorAll('[data-toggle="modal"]');
    const modal = document.getElementById('productModal');
    const modalTitle = modal.querySelector('.modal-title');
    const productImage = modal.querySelector('#productImage');
    const productDescription = modal.querySelector('#productDescription');
    const addToCartButton = modal.querySelector('#addToCartButton');
    const productPrice = modal.querySelector('#productPrice');
    const productStock = modal.querySelector('#stock');

    productLinks.forEach(function (productLink) {
        productLink.addEventListener('click', function (e) {
            e.preventDefault();

            modalTitle.textContent = productLink.getAttribute('data-nombre');
            productImage.src = productLink.getAttribute('data-imagen');
            productDescription.textContent = productLink.getAttribute('data-descripcion');
            productPrice.textContent ="$ " + productLink.getAttribute('data-precio');
            productStock.value = productLink.getAttribute('data-stock');
            addToCartButton.addEventListener('click', function () {
                const nombre = productLink.getAttribute('data-nombre');
                const precio = parseFloat(productLink.getAttribute('data-precio'));
                // Lógica para agregar el producto al carrito aquí
                agregarAlCarrito(nombre, precio);
                modal.style.display = 'none'; // Cierra la ventana emergente
            });

            modal.style.display = 'block'; // Muestra la ventana emergente
        });
    });
});

function guardarCambios() {
    var formulario = document.getElementById("userForm");

    var nombreUsuario = formulario.nombre.value.trim();
    var nombreUsuarioRegex = /^[a-zA-Z][a-zA-Z0-9-_]{2,14}$/;

    if (!nombreUsuarioRegex.test(nombreUsuario)) {
        alert("El nombre de usuario debe comenzar con una letra y tener entre 3 y 15 caracteres, permitiendo letras, números, guiones y guiones bajos.");
        formulario.nombre.classList.add("invalid-input");
        return false;
    } else {
        formulario.nombre.classList.remove("invalid-input");
    }

    var contraseña = formulario.pass.value.trim();
    var contraseñaRegex = /^.{6,}$/;

    if (!contraseñaRegex.test(contraseña)) {
        alert("La contraseña debe tener al menos 6 caracteres.");
        formulario.pass.classList.add("invalid-input");
        return false;
    } else {
        formulario.pass.classList.remove("invalid-input");
    }

    var correo = formulario.correo.value.trim();
    var correoRegex = /^[a-zA-Z][a-zA-Z0-9_]*(?:\.[a-zA-Z][a-zA-Z0-9_]*)*@[a-zA-Z][a-zA-Z0-9_]*(?:\.[a-zA-Z]+)+$/;

    if (!correoRegex.test(correo)) {
        alert("Por favor, ingrese un correo electrónico válido.");
        formulario.correo.classList.add("invalid-input");
        return false;
    } else {
        formulario.correo.classList.remove("invalid-input");
    }

    var telefono = formulario.telefono.value.trim();
    var telefonoRegex = /^\d{10}$/;

    if (!telefonoRegex.test(telefono)) {
        alert("Por favor, ingrese un número de teléfono válido con 10 dígitos.");
        formulario.telefono.classList.add("invalid-input");
        return false;
    } else {
        formulario.telefono.classList.remove("invalid-input");
    }

    var numeroCasa = formulario.numero_casa.value.trim();
    var numeroCasaRegex = /^[a-zA-Z0-9]+(?:-[a-zA-Z0-9]+)?$/;

    if (!numeroCasaRegex.test(numeroCasa)) {
        alert("Por favor, ingrese un número de casa válido que puede incluir números, letras y un guion en medio (no al principio ni al final).");
        formulario.numero_casa.classList.add("invalid-input");
        return false;
    } else {
        formulario.numero_casa.classList.remove("invalid-input");
    }

    var calle = formulario.calle.value.trim();
    var calleRegex = /^[a-zA-Z0-9]+(?:[.-\s][a-zA-Z0-9]+)*$/;

    if (!calleRegex.test(calle)) {
        alert("Por favor, ingrese una calle válida que puede incluir letras, números, el punto y el guion (con el punto inmediatamente después de una letra y el guion solo en el medio).");
        formulario.calle.classList.add("invalid-input");
        return false;
    } else {
        formulario.calle.classList.remove("invalid-input");
    }

    var colonia = formulario.colonia.value.trim();
    var coloniaRegex = /^[a-zA-Z0-9]+(?:[.-\s][a-zA-Z0-9]+)*$/;

    if (!coloniaRegex.test(colonia)) {
        alert("Por favor, ingrese una colonia válida que puede incluir letras, números, el punto y el guion (con el punto inmediatamente después de una letra y el guion solo en el medio).");
        formulario.colonia.classList.add("invalid-input");
        return false;
    } else {
        formulario.colonia.classList.remove("invalid-input");
    }

    var ciudad = formulario.ciudad.value.trim();
    var ciudadRegex = /^[a-zA-Z\s]+$/;

    if (!ciudadRegex.test(ciudad)) {
        alert("Por favor, ingrese un nombre de ciudad válido que solo contenga letras.");
        formulario.ciudad.classList.add("invalid-input");
        return false;
    } else {
        formulario.ciudad.classList.remove("invalid-input");
    }

    var estado = formulario.estado.value.trim();
    var estadoRegex = /^[a-zA-Z\s]+$/;
    if (!estadoRegex.test(estado)) {
        alert("Por favor, ingrese un nombre de estado válido que solo contenga letras.");
        formulario.estado.classList.add("invalid-input");
        return false;
    } else {
        formulario.estado.classList.remove("invalid-input");
    }

    var pais = formulario.pais.value.trim();
    var paisRegex = /^[a-zA-Z\s]+$/;

    if (!paisRegex.test(pais)) {
        alert("Por favor, ingrese un nombre de país válido que solo contenga letras.");
        formulario.pais.classList.add("invalid-input");
        return false;
    } else {
        formulario.pais.classList.remove("invalid-input");
    }

    var codigoPostal = formulario.codigo_postal.value.trim();
    var codigoPostalRegex = /^\d{5}$/;

    if (!codigoPostalRegex.test(codigoPostal)) {
        alert("Por favor, ingrese un código postal válido que consista en exactamente 5 números.");
        formulario.codigo_postal.classList.add("invalid-input");
        return false;
    } else {
        formulario.codigo_postal.classList.remove("invalid-input");
    }
    // Obtener los valores actualizados de los campos del formulario
    var nuevoNombre = document.getElementById('nombre').value;
    var nuevaPass = document.getElementById('pass').value;
    var nuevoCorreo = document.getElementById('correo').value;
    var nuevoTelefono = document.getElementById('telefono').value;
    var nuevaCalle = document.getElementById('calle').value;
    var nuevaColonia = document.getElementById('colonia').value;
    var nuevaCiudad = document.getElementById('ciudad').value;
    var nuevoEstado = document.getElementById('estado').value;
    var nuevoPais = document.getElementById('pais').value;
    var nuevoCodigo_postal = document.getElementById('codigo_postal').value;
    var nuevoNumero_casa = document.getElementById('numero_casa').value;

    // Agregar impresiones para depuración
    console.log("Nuevo nombre: " + nuevoNombre);
    console.log("Nueva contraseña: " + nuevaPass);
    console.log("Nuevo correo: " + nuevoCorreo);
    console.log("Nuevo teléfono: " + nuevoTelefono);
    console.log("Nueva calle: " + nuevaCalle);
    console.log("Nueva colonia: " + nuevaColonia);
    console.log("Nueva ciudad: " + nuevaCiudad);
    console.log("Nuevo estado: " + nuevoEstado);
    console.log("Nuevo país: " + nuevoPais);
    console.log("Nuevo código postal: " + nuevoCodigo_postal);
    console.log("Nuevo número de casa: " + nuevoNumero_casa);

    // Realizar una solicitud AJAX al servidor para guardar los cambios
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                // Manejar la respuesta del servidor si es necesario
                alert("Cambios guardados con éxito");
            } else {
                // Manejar errores en la respuesta del servidor
                alert("Error al guardar cambios");
            }
        }
    };

    // Configurar la solicitud
    xhr.open("POST", "actualizarUsuario", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    // Crear los datos a enviar en la solicitud
    var params = "nombre=" + encodeURIComponent(nuevoNombre) +
            "&pass=" + encodeURIComponent(nuevaPass) +
            "&correo=" + encodeURIComponent(nuevoCorreo) +
            "&telefono=" + encodeURIComponent(nuevoTelefono) +
            "&calle=" + encodeURIComponent(nuevaCalle) +
            "&colonia=" + encodeURIComponent(nuevaColonia) +
            "&ciudad=" + encodeURIComponent(nuevaCiudad) +
            "&estado=" + encodeURIComponent(nuevoEstado) +
            "&pais=" + encodeURIComponent(nuevoPais) +
            "&codigo_postal=" + encodeURIComponent(nuevoCodigo_postal) +
            "&numero_casa=" + encodeURIComponent(nuevoNumero_casa);

    console.log("Solicitud AJAX enviada con parámetros: " + params);
    // Enviar la solicitud
    xhr.send(params);
}

function guardarCambiosAdministrador() {
    var formulario = document.getElementById("adminForm");

    var nombreUsuario = formulario.nombre.value.trim();
    var nombreUsuarioRegex = /^[a-zA-Z][a-zA-Z0-9-_]{2,14}$/;

    if (!nombreUsuarioRegex.test(nombreUsuario)) {
        alert("El nombre de usuario debe comenzar con una letra y tener entre 3 y 15 caracteres, permitiendo letras, números, guiones y guiones bajos.");
        formulario.nombre.classList.add("invalid-input");
        return false;
    } else {
        formulario.nombre.classList.remove("invalid-input");
    }

    var contraseña = formulario.pass.value.trim();
    var contraseñaRegex = /^.{6,}$/;

    if (!contraseñaRegex.test(contraseña)) {
        alert("La contraseña debe tener al menos 6 caracteres.");
        formulario.pass.classList.add("invalid-input");
        return false;
    } else {
        formulario.pass.classList.remove("invalid-input");
    }

    var correo = formulario.correo.value.trim();
    var correoRegex = /^[a-zA-Z][a-zA-Z0-9_]*(?:\.[a-zA-Z][a-zA-Z0-9_]*)*@[a-zA-Z][a-zA-Z0-9_]*(?:\.[a-zA-Z]+)+$/;

    if (!correoRegex.test(correo)) {
        alert("Por favor, ingrese un correo electrónico válido.");
        formulario.correo.classList.add("invalid-input");
        return false;
    } else {
        formulario.correo.classList.remove("invalid-input");
    }

    var telefono = formulario.telefono.value.trim();
    var telefonoRegex = /^\d{10}$/;

    if (!telefonoRegex.test(telefono)) {
        alert("Por favor, ingrese un número de teléfono válido con 10 dígitos.");
        formulario.telefono.classList.add("invalid-input");
        return false;
    } else {
        formulario.telefono.classList.remove("invalid-input");
    }
    // Obtener los valores actualizados de los campos del formulario
    var nuevoNombre = document.getElementById('nombre').value;
    var nuevaPass = document.getElementById('pass').value;
    var nuevoCorreo = document.getElementById('correo').value;
    var nuevoTelefono = document.getElementById('telefono').value;

    // Agregar impresiones para depuración
    console.log("Nuevo nombre: " + nuevoNombre);
    console.log("Nueva contraseña: " + nuevaPass);
    console.log("Nuevo correo: " + nuevoCorreo);
    console.log("Nuevo teléfono: " + nuevoTelefono);

    // Realizar una solicitud AJAX al servidor para guardar los cambios
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                // Manejar la respuesta del servidor si es necesario
                alert("Cambios guardados con éxito");
                window.location.href = 'administracion.jsp';
            } else {
                // Manejar errores en la respuesta del servidor
                alert("Error al guardar cambios");
            }
        }
    };

    // Configurar la solicitud
    xhr.open("POST", "actualizarAdministrador", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    // Crear los datos a enviar en la solicitud
    var params = "nombre=" + encodeURIComponent(nuevoNombre) +
            "&pass=" + encodeURIComponent(nuevaPass) +
            "&correo=" + encodeURIComponent(nuevoCorreo) +
            "&telefono=" + encodeURIComponent(nuevoTelefono);

    console.log("Solicitud AJAX enviada con parámetros: " + params);
    // Enviar la solicitud
    xhr.send(params);
}

function validarFormulario() {
    var formulario = document.getElementById("registroForm");

    var nombreUsuario = formulario.nombre.value.trim();
    var nombreUsuarioRegex = /^[a-zA-Z][a-zA-Z0-9-_]{2,14}$/;

    if (!nombreUsuarioRegex.test(nombreUsuario)) {
        alert("El nombre de usuario debe comenzar con una letra y tener entre 3 y 15 caracteres, permitiendo letras, números, guiones y guiones bajos.");
        formulario.nombre.classList.add("invalid-input");
        return false;
    } else {
        formulario.nombre.classList.remove("invalid-input");
    }

    var contraseña = formulario.pass.value.trim();
    var contraseñaRegex = /^.{6,}$/;

    if (!contraseñaRegex.test(contraseña)) {
        alert("La contraseña debe tener al menos 6 caracteres.");
        formulario.pass.classList.add("invalid-input");
        return false;
    } else {
        formulario.pass.classList.remove("invalid-input");
    }

    var correo = formulario.correo.value.trim();
    var correoRegex = /^[a-zA-Z][a-zA-Z0-9_]*(?:\.[a-zA-Z][a-zA-Z0-9_]*)*@[a-zA-Z][a-zA-Z0-9_]*(?:\.[a-zA-Z]+)+$/;

    if (!correoRegex.test(correo)) {
        alert("Por favor, ingrese un correo electrónico válido.");
        formulario.correo.classList.add("invalid-input");
        return false;
    } else {
        formulario.correo.classList.remove("invalid-input");
    }

    var telefono = formulario.telefono.value.trim();
    var telefonoRegex = /^\d{10}$/;

    if (!telefonoRegex.test(telefono)) {
        alert("Por favor, ingrese un número de teléfono válido con 10 dígitos.");
        formulario.telefono.classList.add("invalid-input");
        return false;
    } else {
        formulario.telefono.classList.remove("invalid-input");
    }

    var numeroCasa = formulario.numero_casa.value.trim();
    var numeroCasaRegex = /^[a-zA-Z0-9]+(?:-[a-zA-Z0-9]+)?$/;

    if (!numeroCasaRegex.test(numeroCasa)) {
        alert("Por favor, ingrese un número de casa válido que puede incluir números, letras y un guion en medio (no al principio ni al final).");
        formulario.numero_casa.classList.add("invalid-input");
        return false;
    } else {
        formulario.numero_casa.classList.remove("invalid-input");
    }

    var calle = formulario.calle.value.trim();
    var calleRegex = /^[a-zA-Z0-9]+(?:[.-\s][a-zA-Z0-9]+)*$/;

    if (!calleRegex.test(calle)) {
        alert("Por favor, ingrese una calle válida que puede incluir letras, números, el punto y el guion (con el punto inmediatamente después de una letra y el guion solo en el medio).");
        formulario.calle.classList.add("invalid-input");
        return false;
    } else {
        formulario.calle.classList.remove("invalid-input");
    }

    var colonia = formulario.colonia.value.trim();
    var coloniaRegex = /^[a-zA-Z0-9]+(?:[.-\s][a-zA-Z0-9]+)*$/;

    if (!coloniaRegex.test(colonia)) {
        alert("Por favor, ingrese una colonia válida que puede incluir letras, números, el punto y el guion (con el punto inmediatamente después de una letra y el guion solo en el medio).");
        formulario.colonia.classList.add("invalid-input");
        return false;
    } else {
        formulario.colonia.classList.remove("invalid-input");
    }

    var ciudad = formulario.ciudad.value.trim();
    var ciudadRegex = /^[a-zA-Z\s]+$/;

    if (!ciudadRegex.test(ciudad)) {
        alert("Por favor, ingrese un nombre de ciudad válido que solo contenga letras.");
        formulario.ciudad.classList.add("invalid-input");
        return false;
    } else {
        formulario.ciudad.classList.remove("invalid-input");
    }

    var estado = formulario.estado.value.trim();
    var estadoRegex = /^[a-zA-Z\s]+$/;
    if (!estadoRegex.test(estado)) {
        alert("Por favor, ingrese un nombre de estado válido que solo contenga letras.");
        formulario.estado.classList.add("invalid-input");
        return false;
    } else {
        formulario.estado.classList.remove("invalid-input");
    }

    var pais = formulario.pais.value.trim();
    var paisRegex = /^[a-zA-Z\s]+$/;

    if (!paisRegex.test(pais)) {
        alert("Por favor, ingrese un nombre de país válido que solo contenga letras.");
        formulario.pais.classList.add("invalid-input");
        return false;
    } else {
        formulario.pais.classList.remove("invalid-input");
    }

    var codigoPostal = formulario.codigo_postal.value.trim();
    var codigoPostalRegex = /^\d{5}$/;

    if (!codigoPostalRegex.test(codigoPostal)) {
        alert("Por favor, ingrese un código postal válido que consista en exactamente 5 números.");
        formulario.codigo_postal.classList.add("invalid-input");
        return false;
    } else {
        formulario.codigo_postal.classList.remove("invalid-input");
    }

    return true;
}

function validarPrecio(input) {
    // Si el valor es menor que 0, establece el valor a 0
    var patron = /^\d+(\.\d*)?$/;
    
    if(!patron.test(input.value)){
        input.value=1;
    }
    if (input.value < 0) {
        input.value = 1;
    }
}

function validarNumero(input) {
    // Si el valor es menor que 0, establece el valor a 0
    var patron = /^\d+$/;
    
    if(!patron.test(input.value)){
        input.value=1;
    }
    
    if (input.value < 0 || tieneDecimal(input.value)) {
        input.value = 1;
    }
}

function tieneDecimal(valor) {
    // Verifica si el valor tiene un punto decimal
    return valor.includes('.');
}

document.addEventListener('DOMContentLoaded', function () {
    var quantityUpButtons = document.querySelectorAll('.cart_quantity_up');
    var quantityDownButtons = document.querySelectorAll('.cart_quantity_down');
    var quantityDeleteButtons = document.querySelectorAll('.cart_quantity_delete');

    quantityUpButtons.forEach(function (button) {
        button.addEventListener('click', function () {
            updateCartItem(button, 1);
        });
    });

    quantityDeleteButtons.forEach(function (button) {
        button.addEventListener('click', function () {
            deleteCartItem(button);
        });
    });

    quantityDownButtons.forEach(function (button) {
        button.addEventListener('click', function () {
            updateCartItem(button, -1);
        });
    });

    function updateCartItem(button, change) {
        var row = button.closest('tr');
        var productId = row.dataset.productid;
        var currentQuantity = parseInt(row.dataset.cantidad);
        var newQuantity = currentQuantity + change;

        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var responseJson = JSON.parse(xhr.responseText);

                if (responseJson.status === "success") {
                    row.dataset.cantidad = responseJson.newQuantity;
                    var quantityInput = row.querySelector('.cart_quantity_input');
                    quantityInput.value = responseJson.newQuantity;

                    // Elimina la fila si la cantidad es cero
                    if (responseJson.newQuantity === 0) {
                        row.remove();
                    }

                    updateSubtotalsAndTotals();
                } else {
                    // Maneja el caso de error si es necesario
                    console.error(responseJson.message);
                }
            }
        };
        xhr.open('POST', 'actualizarCantidad', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.send('productId=' + productId + '&newQuantity=' + newQuantity);
        location.reload(true);
    }

    function deleteCartItem(button) {
        var row = button.closest('tr');
        var productId = row.dataset.productid;

        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var responseJson = JSON.parse(xhr.responseText);

                if (responseJson.status === "success") {
                    row.remove();
                    updateSubtotalsAndTotals();
                } else {
                    console.error(responseJson.message);
                }
            }
        };
        xhr.open('POST', 'eliminarArticulo', true);  // Ajusta la URL según tu lógica del servidor
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.send('productId=' + productId);
        location.reload(true);
    }

    function updateSubtotalsAndTotals() {
        var total = 0;
        var iva = 0; // Nueva variable para el IVA
        var rows = document.querySelectorAll('tbody tr');

        rows.forEach(function (row) {
            var quantity = parseInt(row.dataset.cantidad);
            var price = parseFloat(row.querySelector('.cart_price p').innerText.substring(1));
            var subtotal = quantity * price;
            total += subtotal;

            // Actualiza el subtotal en la fila
            row.querySelector('.cart_total_price').innerText = '$' + subtotal.toFixed(2);
        });

        // Calcula el IVA (16% del total)
        iva = total * 0.16;

        // Actualiza los elementos HTML que muestran los totales
        document.getElementById('txt-subtotal').innerText = '$' + total.toFixed(2);
        document.getElementById('txt-iva').innerText = '$' + iva.toFixed(2);
        document.getElementById('txt-total').innerText = '$' + (total + iva).toFixed(2);
    }
});

function validarCantidad(input, stock) {
    var patron = /^\d+$/;
    
    if(!patron.test(input.value)){
        input.value=1;
    }
    // Si el valor es menor que 0, establece el valor a 0
    if (input.value < 0 || tieneDecimal(input.value)) {
        input.value = 1;
    }

    var newStock = parseInt(stock);
    if (input.value > newStock) {
        input.value = newStock;
    }
}

function mostrarAlerta(){
    alert("Para comprar productos debe iniciar sesión");
}

document.addEventListener('DOMContentLoaded', function () {
    var filters = document.querySelectorAll('.filters li');
    var products = document.querySelectorAll('.product-item');

    filters.forEach(function (filter) {
        filter.addEventListener('click', function () {
            // Remover la clase 'active' de todos los filtros
            filters.forEach(function (f) {
                f.classList.remove('active');
            });

            // Agregar la clase 'active' al filtro seleccionado
            filter.classList.add('active');

            // Obtener el tipo de filtro
            var filterType = filter.getAttribute('data-filter');

            // Mostrar u ocultar productos según el filtro
            products.forEach(function (product) {
                if (filterType === '*' || product.classList.contains(filterType)) {
                    product.style.display = 'block';
                } else {
                    product.style.display = 'none';
                }
            });
        });
    });
});

function validarContacto() {
  // Obtener los valores de los campos
  var nombre = document.getElementById("name").value;
  var email = document.getElementById("email").value;
  var asunto = document.getElementById("subject").value;
  var mensaje = document.getElementById("message").value;

  // Definir patrones de validación
  var nombrePattern = /^[a-zA-Z\s]+$/;
  var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

  // Validar cada campo
  if (!nombrePattern.test(nombre)) {
    alert("Por favor, introduzca un nombre válido.");
    return false;
  }

  if (!emailPattern.test(email)) {
    alert("Por favor, introduzca una dirección de correo electrónico válida.");
    return false;
  }

  // Si todas las validaciones pasan, mostrar un mensaje de éxito
  alert("Mensaje enviado correctamente.");
  return true;
}
