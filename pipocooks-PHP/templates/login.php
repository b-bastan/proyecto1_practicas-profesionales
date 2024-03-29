<?php
$mensaje_recibido = $_REQUEST["mensaje"];
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ingresar</title>
        <link rel="stylesheet" href="../css/styles.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
        <link rel="shortcut icon" href="../img/logoTransparente.png" type="image/x-icon">
        
    </head>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <main>
            <div class="contenedor_todo">
                <div class="caja_trasera">
                    <div class="caja_trasera_login">
                        <h3>¿Ya tienes una cuenta?</h3>
                        <p>Inicia sesión para entrar en la página</p>
                        <button id="boton_iniciar_sesion">Iniciar sesión</button>
                        O ir al <a href="../index.php">Home</a>
                    </div>
                    <div class="caja_trasera_register">
                        <h3>¿Aún no tienes una cuenta?</h3>
                        <p>Regístrate para que puedas iniciar sesión</p>
                        <button id="boton_registrarse">Registrarse</button>
                        O ir al <a href="../index.php">Home</a>
                        
                    </div>
                </div>

                <!--Formulario de Login y register-->
                <div class="contenedor_login_register">
                    <!--Login-->
                    <form action="valida_login.php" class="formulario_login" method="post">
                        <h2>Iniciar sesión</h2>
                        <input class="contenedor_login_register-input" type="email" placeholder="Correo electrónico" name="datos_usuario" required>
                        <input class="contenedor_login_register-input" type="password" placeholder="Contraseña" style="margin-bottom: 30px;" name="datos_password" required>
                        <input class="contenedor_login_register-submit" type="submit" value="Entrar">
                        <?php
                            // Si es erroneo los datos ingresados tira un mensaje de sweet alerts de error
                            if ( trim($mensaje_recibido)<>""){  
                                echo '<script>  Swal.fire("PipoCooks", "Email o contraseña incorrectos", "error") </script>';
                            }
                        ?> 
                        
                    </form>

                    

                    <!--Register-->
                    <form action="registrarse.php" class="formulario_register" method="post">
                        <h2>Registrarse</h2>
                        <input class="contenedor_login_register-input" type="text" placeholder="Nombre" name="nombreReg" required>
                        <input class="contenedor_login_register-input" type="text" placeholder="Apellido" name="apellidoReg" required>
                        <input class="contenedor_login_register-input" type="email" placeholder="Correo electrónico" name="correoReg" required>
                        <input class="contenedor_login_register-input" type="password" placeholder="Contraseña" style="margin-bottom: 30px;" name="contraReg" required>
                        <input class="contenedor_login_register-submit" type="submit" value="Registrarse">
                    </form>

                    
                </div>
            </div>
        </main>
        
        
        <script src="../js/script.js"></script>
    </body>
</html>