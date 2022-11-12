<?php
// Se trae el valor de mensaje_recibido, el usuario ingresado y la receta a la que entró
$mensaje_recibido = $_REQUEST["mensaje"];
$idUsuario = $_REQUEST["idUsuario"];
$idReceta = $_REQUEST["idReceta"];

// Se incluye las variables para entrar en la base de datos en conf.pipocooks
include("../conf/conf.pipocooks");

// Se entra en la base de datos con el usuario y contraseña guardados en el conf.pipocooks
$dbh = new PDO("mysql:host=$host;dbname=$dbname", $user, $pwd);

// Se hace una consulta donde trae unicamente los datos del usuario que coincida con el idUsuario que tenga nuestro usuario, si no tenemos uno va a ser igual a ""
$consulta = $dbh->prepare("select * from usuario 
					where idUsuario=" . $idUsuario);
$consulta->execute();
$resultado = $consulta->fetch(PDO::FETCH_ASSOC);
$nombre = $resultado['nombre_usuario'];
$apellido = $resultado['apellido_usuario'];
$NyA = $nombre . " " . $apellido;
// La variable NyA contiene los datos del nombre y del apellido juntos para luego mostrarlo posteriormente

// Se hace una consulta donde trae unicamente la recetas a la que ingresamos
$consultaReceta = $dbh->prepare("select * from recetas where idReceta=" . $idReceta);
$consultaReceta->execute();
while($resultadoReceta = $consultaReceta->fetch(PDO::FETCH_ASSOC))
{
    // No hace falta que se guarde en un array ya que es una receta nada mas
    $nombreReceta =  $resultadoReceta['nombre_receta'];
    $descripcionReceta =  $resultadoReceta['descripcion_receta'];
    $imagenReceta = $resultadoReceta['imagen_receta'];
}

// Se hace una consulta donde trae los ingredientes de la receta a la que entramos
$consultaIngredientes = $dbh->prepare("select * from ingredientes where idRecetaFK=" . $idReceta);
$consultaIngredientes->execute();
while($resultadoIngrediente = $consultaIngredientes->fetch(PDO::FETCH_ASSOC))
{
    // Se guardan en un array ya que son varios ingredientes y cada uno tiene su cantidad y medida
    $idIngrediente[] = $resultadoIngrediente['idIngrediente'];
    $nombreIngrediente[] =  trim($resultadoIngrediente['nombre_ingrediente']);
    $cantidadIngrediente[] =  $resultadoIngrediente['cantidad'];
    $medidaIngrediente[] = $resultadoIngrediente['medida'];
}

//Se hace una consulta donde se traen los pasos de la receta a la que ingresamos
$consultaPasos = $dbh->prepare("select * from pasos where idRecetaFK=" . $idReceta);
$consultaPasos->execute();
while($resultadoPasos = $consultaPasos->fetch(PDO::FETCH_ASSOC))
{
    // Se guardan en un array ya que son varios pasos 
    $idPasos[] = $resultadoIngrediente['idIngrediente'];
    $descripcionPasos[] =  trim($resultadoPasos['descripcion_pasos']);
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Receta</title>
    <link rel="stylesheet" href="../css/styles-index.css">
    <link rel="stylesheet" href="../css/styles-receta.css">
    <script src="https://kit.fontawesome.com/359e1b0e60.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="icon" href="../img/gatoxd.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>

<body>
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
                                <li><a class='dropdown-item' href='./templates/login.php' style='display: flex; justify-self: right;'><i class='fa-solid fa-arrow-right-from-bracket' style='padding-top: 5px ;'></i>&nbsp&nbsp&nbspCerrar sesión</a></li>";
                    }
                    // Si clickea cerrar sesión volver al login y desloguearse

                    ?>
                </li>
            </ul>
        </div>
    </header>
    <main class="main espaciado">
        <div class="headerReceta">
            <h2><?php
            // Se empieza a cargar cada dato de la receta con los echo (Es como el DOM de js, pero individualmente)
            echo $nombreReceta; ?></h2>
        </div>
        <div class="receta">
            <img src="../img/<?php echo $imagenReceta; ?>" alt="<?php echo $nombreReceta; ?>" height="350px">
            <p class="descripcion"><?php echo $descripcionReceta; ?></p>
        </div>
        <hr>
        <section class="ingredientes">
            <h4 style="grid-area: ingredientes;">Ingredientes:</h4>
            <?php
            // Se recorre todos los ingredientes y por cada uno genera un div con el nombre del ingrediente, junto con la cantidad y la medida                 
            for($i = 0; $i < sizeof($nombreIngrediente); $i++){ 
                        ?>
            <div>- <?php echo $cantidadIngrediente[$i];
            if($medidaIngrediente[$i] != "unidad"){ 
                echo " ", $medidaIngrediente[$i], " de ";
                } 
                echo " ", $nombreIngrediente[$i];?></div>
            <?php } ?>
        </section>
        <section class="pasos">
            <h4>Pasos para la elaboración</h4>
            <ol style="font-size: 16px;">
            <?php
            // Se recorre todos los pasos y por cada uno genera un li con la descripcion del paso
            for($i = 0; $i < sizeof($idPasos); $i++){
                ?>
                <li><?php echo $descripcionPasos[$i]; ?></li>
                <?php } ?>
            </ol>
            
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>

</html>