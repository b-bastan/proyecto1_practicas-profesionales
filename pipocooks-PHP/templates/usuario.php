<?php
// Se trae el valor de mensaje_recibido y de Usuarios solicitados previamente en login.php

$idUsuario = $_REQUEST["idUsuario"];
$error = $_REQUEST["error"];

// Se incluye las variables para entrar en la base de datos en conf.pipocooks
include("../conf/conf.pipocooks");

// Se entra en la base de datos con el usuario y contraseña guardados en el conf.pipocooks
$dbh = new PDO("mysql:host=$host;dbname=$dbname", $user, $pwd);
$consulta = $dbh->prepare("select * from usuario 
					where idUsuario=" . $idUsuario);
// Se hace una consulta donde trae unicamente los datos del usuario que coincida con el idUsuario que tenga nuestro usuario, si no tenemos uno va a ser igual a ""
$consulta->execute();
$resultado = $consulta->fetch(PDO::FETCH_ASSOC);
$nombre = $resultado['nombre_usuario'];
$apellido = $resultado['apellido_usuario'];
$email = $resultado['email_usuario'];
$NyA = $nombre . " " . $apellido;
// La variable NyA contiene los datos del nombre y del apellido juntos para luego mostrarlo posteriormente
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuario</title>
    <link rel="stylesheet" href="../css/styles-usuario.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">    
</head>

<body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<header class="header">
        <img src="../img/logoTransparente.png" width="150px" alt="">
        <a href="../index.php?idUsuario=<?php echo $idUsuario; ?>" style="color: aliceblue !important; text-decoration: none !important;"><h1>Pipo Cook's</h1></a>
        <div class="dropdown" style="width: 163px;">
            <button class="btn" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 50px; text-align: end;"><i style="color: white;" class="fa-solid fa-circle-user"></i>
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                <li style="padding: 0.25rem 1rem;">
                    <?php

                    // Si no estas logueado va a aparecer un boton para iniciar sesion
                    if ($NyA == " ") {
                        echo "<li><a class='dropdown-item' href='./templates/login.php' style='display: flex; justify-self: right;'><i class='bi bi-person-plus-fill'></i>&nbsp&nbsp&nbspIniciar sesión</a></li>";
                        // Si estas logueado van a aparecer un boton para cerrar sesion y otro para ver mi Perfil
                    } else if (trim($NyA) != "") {
                        echo $NyA;
                        echo "<li><a class='dropdown-item' href='./usuario.php?idUsuario=" . $idUsuario . "'><i class='fa-solid fa-user'></i>&nbsp&nbsp&nbspTu perfil</a></li>
                                <li><a class='dropdown-item' href='./login.php' style='display: flex; justify-self: right;'><i class='fa-solid fa-arrow-right-from-bracket' style='padding-top: 5px ;'></i>&nbsp&nbsp&nbspCerrar sesión</a></li>";
                    }
                    // Si clickea cerrar sesión volver al login y desloguearse

                    ?>
                </li>
            </ul>
        </div>
    </header>
    <main class="contenedor-todo">
        <section class="vh-100" style="background-color: #f4f5f7;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-lg-6 mb-4 mb-lg-0">
                        <div class="card mb-3" style="border-radius: .5rem;">
                            <div class="row g-0">
                                <div class="col-md-4 gradient-custom text-center text-white" style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body p-4">
                                        <h6>Información</h6>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Nombre y Apellido</h6>
                                                <p class="text-muted"><?php echo $NyA; ?></p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Email</h6>
                                                <p class="text-muted"><?php echo $email; ?></p>
                                            </div>
                                        </div>
                                        <h6>Seguridad</h6>
                                        <hr class="mt-0 mb-4">
                                        <form action="cambiar_password.php" class="row pt-1">
                                        <div class="input-group mb-3 ">
                                            <span class="input-group-text" id="basic-addon1"><i class="bi bi-key"></i></span>
                                            <input type="password" name="pwd_viejo" class="form-control" placeholder="Ingrese su password actual"
                                                id="pwd_viejo" required>
                                            <div class="input-group-append">
                                            <span class="input-group-text" onclick="password_show_hide('pwd_viejo','show_eye_1','hide_eye_1');">
                                                <i class="bi bi-eye" id="show_eye_1"></i>
                                                <i class="bi bi-eye-slash d-none" id="hide_eye_1"></i>
                                            </span>
                                            </div>  
                                        </div>
                                        <div class="input-group mb-3 ">
                                            <span class="input-group-text" id="basic-addon1"><i class="bi bi-key-fill"></i></span>
                                            <input type="password" name="pwd_nuevo" class="form-control" placeholder="Ingrese su nuevo password"
                                                id="pwd_nuevo" required>
                                            <div class="input-group-append">
                                            <span class="input-group-text" onclick="password_show_hide('pwd_nuevo','show_eye_2','hide_eye_2');">
                                                <i class="bi bi-eye" id="show_eye_2"></i>
                                                <i class="bi bi-eye-slash d-none" id="hide_eye_2"></i>
                                            </span>
                                            </div>  
                                        </div>
                                        <div class="mb-3 d-grid gap-2">                                                
                                                <input type="submit" class="btn btn-primary btn-warning" value="Cambiar Contraseña">
                                        </div>
                                        <input type="hidden" name="idUsuario" value="<?php echo $idUsuario;?>">
                                        <?php 
                                        if ( $error==1){  
                                            echo '<script> Swal.fire("PipoCooks", "La contraseña ingresada no coincide con la de la BBDD", "error"); 
                                                </script>';
                                        }
                                        elseif ( $error==2){  
                                            echo '<script> Swal.fire("PipoCooks", "La contraseña se cambió exitosamente", "success"); 
                                                </script>';
                                        }  
                                        elseif ( $error==3){  
                                            echo '<script> Swal.fire("PipoCooks", "No se pudo sincronizar con la base de datos", "error"); 
                                                </script>';
                                        }                                         
                                        ?>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <footer class="text-center text-white" style="background-color: #ff946c;">
        <!-- Grid container -->
        <div class="container pt-4">
            <section class="mb-4">
                <!-- Facebook -->
                <a class="btn btn-link btn-floating btn-lg text-dark m-1" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-facebook-f"></i></a>

                <!-- Twitter -->
                <a class="btn btn-link btn-floating btn-lg text-dark m-1" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-twitter"></i></a>

                <!-- Google -->
                <a class="btn btn-link btn-floating btn-lg text-dark m-1" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-google"></i></a>

                <!-- Instagram -->
                <a class="btn btn-link btn-floating btn-lg text-dark m-1" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-instagram"></i></a>

                <!-- Linkedin -->
                <a class="btn btn-link btn-floating btn-lg text-dark m-1" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-linkedin"></i></a>
                <!-- Github -->
                <a class="btn btn-link btn-floating btn-lg text-dark m-1" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-github"></i></a>
            </section>
        </div>

        <div class="text-center text-light p-3 footer" style="background-color: chocolate;">
            © 2022 Copyright: CCP Corp.
        </div>

    </footer>
</body>
<script src="../js/pwd-eye.js"></script>
<script src="https://kit.fontawesome.com/359e1b0e60.js" crossorigin="anonymous"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</html>