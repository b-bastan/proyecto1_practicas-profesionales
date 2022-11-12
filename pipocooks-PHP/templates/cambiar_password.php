<?php
// Se trae el valor de mensaje_recibido y de Usuarios solicitados previamente en login.php

$idUsuario = $_REQUEST["idUsuario"];
$pwd_viejo = trim($_REQUEST["pwd_viejo"]);
$pwd_nuevo = trim($_REQUEST["pwd_nuevo"]);
// Se incluye las variables para entrar en la base de datos en conf.pipocooks
include("../conf/conf.pipocooks");

// Se entra en la base de datos con el usuario y contraseña guardados en el conf.pipocooks
$dbh = new PDO("mysql:host=$host;dbname=$dbname", $user, $pwd);
$consulta = $dbh->prepare("select * from usuario 
					where idUsuario=" . $idUsuario);
// Se hace una consulta donde trae unicamente los datos del usuario que coincida con el idUsuario que tenga nuestro usuario, si no tenemos uno va a ser igual a ""
$consulta->execute();
$resultado = $consulta->fetch(PDO::FETCH_ASSOC);
$password_bbdd = $resultado['password'];

if ($password_bbdd<>$pwd_viejo)
{
    header("Location: usuario.php?error=1&idUsuario=$idUsuario");
}
else
{
    $upd = $dbh->query("update usuario set password='".$pwd_nuevo."' 
					where idUsuario=" . $idUsuario);
    if($upd)
        header("Location: usuario.php?error=2&idUsuario=$idUsuario");
    else
        header("Location: usuario.php?error=3&idUsuario=$idUsuario");
}

// La variable NyA contiene los datos del nombre y del apellido juntos para luego mostrarlo posteriormente
?>