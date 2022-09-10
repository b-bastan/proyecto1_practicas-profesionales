<?php
include ("../conf/conf.pipocooks");

$datos_usuario = trim($_REQUEST["datos_usuario"]);
$datos_password = trim($_REQUEST["datos_password"]);

// buscar datos de usuario y password en la tabla usuarios

$dbh = new PDO("mysql:host=$host;dbname=$dbname", $user, $pwd);
$consulta = $dbh->prepare("select * from usuario 
					where email_usuario='".$datos_usuario."' and password='".$datos_password."'");
$consulta->execute();

$resultado = $consulta->fetch(PDO::FETCH_ASSOC);
$filas = $consulta->rowCount();

if ($filas > 0){
    $idUsuario = $resultado['idUsuario'];
    header("Location: ../index.php?idUsuario=$idUsuario");
} else {
    header("Location: login.php?mensaje=Este usuario no existe");
}
?>