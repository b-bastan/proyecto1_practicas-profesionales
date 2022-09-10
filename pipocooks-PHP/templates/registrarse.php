<?php
include ("../conf/conf.pipocooks");

$nombreReg = trim($_REQUEST["nombreReg"]);
$apellidoReg = trim($_REQUEST["apellidoReg"]);
$correoReg = trim($_REQUEST["correoReg"]);
$contraReg = trim($_REQUEST["contraReg"]);

// buscar datos de usuario y password en la tabla usuarios

$dbh = new PDO("mysql:host=$host;dbname=$dbname", $user, $pwd);
$insercion = $dbh->prepare("insert into usuario 
								(nombre_usuario, apellido_usuario, email_usuario, password)
								values(:nombreReg,:apellidoReg, :correoReg, :contraReg)");
			$insercion->bindParam(':nombreReg', trim($nombreReg));
			$insercion->bindParam(':apellidoReg', trim($apellidoReg));
			$insercion->bindParam(':correoReg', trim($correoReg));
            $insercion->bindParam(':contraReg', trim($contraReg));
            if ($insercion->execute())
			{
				header("Location: login.php");		
			}
			else
			{
                echo "Ocurrio un error";
            }


/*$consulta = $dbh->prepare("select * from usuario 
					where email_usuario='".$datos_usuario."' and password='".$datos_password."'");
$consulta->execute();

$resultado = $consulta->fetch(PDO::FETCH_ASSOC);
$filas = $consulta->rowCount();

if ($filas > 0){
    $idUsuario = $resultado['idUsuario'];
    header("Location: ../index.php?idUsuario=$idUsuario");
} else {
    header("Location: login.php?mensaje=Este usuario no existe");
}*/
?>