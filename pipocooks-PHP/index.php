<?php
// Se trae el valor de mensaje_recibido y de Usuarios solicitados previamente en login.php
$mensaje_recibido = $_REQUEST["mensaje"];
$idUsuario = $_REQUEST["idUsuario"];
// Se incluye las variables para entrar en la base de datos en conf.pipocooks
include("./conf/conf.pipocooks");

// Se entra en la base de datos con el usuario y contraseña guardados en el conf.pipocooks
$dbh = new PDO("mysql:host=$host;dbname=$dbname", $user, $pwd);
$consulta = $dbh->prepare("select * from usuario 
					where idUsuario=" . $idUsuario);
// Se hace una consulta donde trae unicamente los datos del usuario que coincida con el idUsuario que tenga nuestro usuario, si no tenemos uno va a ser igual a ""
$consulta->execute();
$resultado = $consulta->fetch(PDO::FETCH_ASSOC);
$nombre = $resultado['nombre_usuario'];
$apellido = $resultado['apellido_usuario'];
$NyA = $nombre . " " . $apellido;
// La variable NyA contiene los datos del nombre y del apellido juntos para luego mostrarlo posteriormente

// Se hace una consulta donde trae todas las recetas de la base de datos
$consultaReceta = $dbh->prepare("select * from recetas order by nombre_receta");
$consultaReceta->execute();
while ($resultadoReceta = $consultaReceta->fetch(PDO::FETCH_ASSOC)) {
    //Se guardan en un array para poder almacenar todas individualmente
    $idReceta[] = $resultadoReceta['idReceta'];
    $nombreReceta[] =  $resultadoReceta['nombre_receta'];
    $descripcionReceta[] =  $resultadoReceta['descripcion_receta'];
    $imagenReceta[] = $resultadoReceta['imagen_receta'];
}

// Se hace una consulta donde trae todas las recetas de la base de datos
$consultaIngredientes = $dbh->prepare("SELECT DISTINCT(nombre_ingrediente) FROM ingredientes order by nombre_ingrediente");
$consultaIngredientes->execute();
while ($resultadoIngredientes = $consultaIngredientes->fetch(PDO::FETCH_ASSOC)) {
    //Se guardan en un array para poder almacenar todas individualmente
    $nombreIngrediente[] =  trim($resultadoIngredientes['nombre_ingrediente']);
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pipo Cook's</title>
    <link rel="stylesheet" href="css/styles-index.css">
    <script src="https://kit.fontawesome.com/359e1b0e60.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="icon" href="img/gatoxd.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>

<body>
    <header class="header">
        <img src="img/logoTransparente.png" width="150px" alt="">
        <h1>Pipo Cook's</h1>
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
                        echo "<li><a class='dropdown-item' href='templates/usuario.php?idUsuario=" . $idUsuario . "'><i class='fa-solid fa-user'></i>&nbsp&nbsp&nbspTu perfil</a></li>
                                <li><a class='dropdown-item' href='./templates/login.php' style='display: flex; justify-self: right;'><i class='fa-solid fa-arrow-right-from-bracket' style='padding-top: 5px ;'></i>&nbsp&nbsp&nbspCerrar sesión</a></li>";
                    }
                    // Si clickea cerrar sesión volver al login y desloguearse

                    ?>
                </li>
            </ul>
        </div>
    </header>
    <main>
        <section>
            <form name="form" class="buscador" action="templates/buscar.php" method="post">
                <input type="hidden" name="idUsuario" value="<?php echo  $idUsuario; ?>">
                <select class="buscador-input" name="datos_busqueda">
                    <?php for ($i = 0; $i < sizeof($nombreIngrediente); $i++) {
                    ?>
                        <option value="<?php echo $nombreIngrediente[$i]; ?>"><?php echo $nombreIngrediente[$i]; ?></option>
                    <?php
                    }
                    ?>
                </select>
                <input class="input-search" type="submit" value="">
            </form>
            <div>
                <h3 class="text-center m-4">Recetas más buscadas</h3>
                <div class="contenedor-recetas">
                    <?php
                    // Se recorre todas las recetas y por cada una genera una "tarjeta" con la imagen, nombre y descripcion de receta
                    for ($i = 0; $i < sizeof($nombreReceta); $i++) {
                    ?>
                        <div class="card img" style="width: 18rem;">

                            <a href="./templates/receta.php?idUsuario=<?php echo  $idUsuario; ?>&idReceta=<?php echo $idReceta[$i]; //* Esto Funciona para poder navegar entre las paginas y se quede guardado el usuario con el que estas logueado
                                                                                                            ?>" class="a">
                                <img src="./img/<?php echo $imagenReceta[$i]; ?>" class="card-img-top" height="200px" alt="...">
                                <div class="card-body">
                                    <h2 class="card-title"><?php echo  $nombreReceta[$i]; ?></h2>
                                    <p class="card-text"><?php echo $descripcionReceta[$i]; ?></p>
                                </div>
                            </a>

                        </div>
                    <?php } ?>
                </div>
            </div>
        </section>
    </main>
    <footer class="text-center text-white" style="background-color: #ff946c;">
        <!-- Grid container -->
        <div class="container pt-4">
            <section class="mb-4">
                <a class="btn btn-link btn-floating btn-lg text-dark m-1 tx-dec" href="https://github.com/SantinoVitale" role="button" data-mdb-ripple-color="dark"><i class="fab fa-github"></i> S.Vitale</a>
                <a class="btn btn-link btn-floating btn-lg text-dark m-1 tx-dec" href="https://github.com/camila-grilletti" role="button" data-mdb-ripple-color="dark"><i class="fab fa-github"></i> C.Grilletti</a>
                <a class="btn btn-link btn-floating btn-lg text-dark m-1 tx-dec" href="https://github.com/b-bastan" role="button" data-mdb-ripple-color="dark"><i class="fab fa-github"></i> B.Bastan</a>
                <!-- Github -->
                <a class="btn btn-link btn-floating btn-lg text-dark m-1 tx-dec" href="https://github.com/Ch1nolas" role="button" data-mdb-ripple-color="dark"><i class="fab fa-github"></i> N.Martinez</a>
            </section>
        </div>

        <div class="text-center text-light p-3 footer" style="background-color: chocolate;">
            © 2022 Copyright: CCP Corp.
        </div>

    </footer>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</html>