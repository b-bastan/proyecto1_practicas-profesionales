<?php
$mensaje_recibido = $_REQUEST["mensaje"];
$idUsuario = $_REQUEST["idUsuario"];
include ("../conf/conf.pipocooks");

$dbh = new PDO("mysql:host=$host;dbname=$dbname", $user, $pwd);
$consulta = $dbh->prepare("select * from usuario 
					where idUsuario=".$idUsuario);
$consulta->execute();
$resultado = $consulta->fetch(PDO::FETCH_ASSOC);
$nombre = $resultado['nombre_usuario'];
$apellido = $resultado['apellido_usuario'];
$NyA = $nombre." ".$apellido;
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
            <div class="nav" style="display: flex; justify-content: space-between;">
                <button class="btn btn-primary quitacolor" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
                <i class="fa-solid fa-bars" style="font-size: 50px;"></i>
                </button>
                  <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
                    <div class="offcanvas-header" style="justify-content: right;">
                      <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body" style="margin-top: -30px;">
                        <ul class="menu-general">
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                  Recetas
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                  <li><a class="dropdown-item" href="#">Bebidas</a></li>
                                  <li><a class="dropdown-item" href="#">Arroces</a></li>
                                  <li><a class="dropdown-item" href="#">Ensaladas</a></li>
                                </ul>
                            </div>
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                  Recetas dulces
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                  <li><a class="dropdown-item" href="#">Tortas y budines</a></li>
                                  <li><a class="dropdown-item" href="#">Galletas</a></li>
                                  <li><a class="dropdown-item" href="#">Ensaladas</a></li>
                                </ul>
                            </div>
                            <li style="height: 31.5px;">Más recetas</li>
                            <li>Sobre nosotros</li>
                            <li>Contacto</li>
                        </ul>
                      </div>
                    </div>
                    <?php 
                     echo "<a href='../index.php?idUsuario=$idUsuario'><h1>Pipo Cook's</h1></a>"
                    ?>
                <div class="dropdown">
                    <button class="btn" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 50px; text-align: end;"><i class="fa-solid fa-circle-user"></i>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                      <li style="padding: 0.25rem 1rem;"><?php
                      
                      if ($NyA == " "){
                        echo "<li><a class='dropdown-item' href='./login.php' style='display: flex; justify-self: right;'><i class='bi bi-person-plus-fill'></i>&nbsp&nbsp&nbspIniciar sesión</a></li>";
                      } else if ($NyA != " "){
                        echo $NyA;
                        echo "<li><a class='dropdown-item' href='#'><i class='fa-solid fa-user'></i>&nbsp&nbsp&nbspTu perfil</a></li>
                        <li><a class='dropdown-item' href='./login.php' style='display: flex; justify-self: right;'><i class='fa-solid fa-arrow-right-from-bracket' style='padding-top: 5px ;'></i>&nbsp&nbsp&nbspCerrar sesión</a></li>";
                      }
                      // Si clickea cerrar sesión volver al login y desloguearse
                      
                      ?></li>
                    </ul>
                </div>
            </div>
        </header>
        <main class="main espaciado">
            <div>
                <h2>Receta de Ravioles</h2>
                <!--<div class="valoracion">
                    <img src="/img/happy-person.png" alt="happy person" class="perfil">
                    <div class="mas-info">
                        <div>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star-half"></i>
                        </div>
                        <hr>
                        <p>Por John Johnson, Cocinere de Pipo Cook's. Actualizado: 21 junio 2022</p>
                    </div>    
                </div>-->
            </div>
            <div class="receta">
                <img src="../img/ravioles.jpg" alt="Ravioles ricos">
                <p class="descripcion">Los ravioles o raviolis en salsa son ricos. Todo el mundo quiere unos buenos ravioles. Así en esta receta que les traemos desde Pipo Cook's, les vamos a enseñar como preparar unos ravioles caseros, haciendo nosotros mismos las pasta fresca, el relleno y el sofrito (kseso). ¡Una delicia de plato que no se pueden perder!</p>
            </div>
            <hr>
            <section class="ingredientes">
                <h4 style="grid-area: ingredientes;">Ingredientes:</h4>
                <div><input type="checkbox"> Tomate</div>
                <div><input type="checkbox"> Queso</div>
                <div><input type="checkbox"> Harina</div>
                <div><input type="checkbox"> Huevo</div>
                <div><input type="checkbox"> Jamon</div>
                <div><input type="checkbox"> Manteca</div>
            </section>
            <section class="pasos">
                <h4>Pasos para la elaboración</h4>
                <ol style="font-size: 16px;">
                    <li>Sacar los ingredientes</li>
                    <li>Mezclar la harina con el huevo</li>
                    <li>Batir la mezcla</li>
                    <li>Hacer cuadrados con la mezcla</li>
                    <li>Mezclar tomate, queso y jamon</li>
                    <li>Poner la mezcla de tomate, jamon y queso sobre la mitad de los cuadrados</li>
                    <li>Poner otro cuadrado encima</li>
                    <li>Hornear</li>
                </ol>
            </section>
            <section class="comentarios">
                <h3>Comentarios</h3>
                <!--<section class="comment">
                    <div class="usuario-comentario">
                        <img src="/img/happy-person.png" alt="happy person" class="perfil-small" style="grid-area: foto;">
                        <p style="grid-area: nombre;" >John Johnson</p>
                    </div>
                    <hr>
                    <p>This is the example text Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error aspernatur alias, ab ut nam maiores quod nesciunt nemo. Adipisci consectetur officia molestias laborum omnis necessitatibus sint ab sunt atque amet.</p>
                </section>-->
                <h4>Proximamente</h4>
            </section>
        </main>
        <footer></footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    </body>
</html>