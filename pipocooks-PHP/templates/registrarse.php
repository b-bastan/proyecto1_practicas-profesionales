<?php
include ("../conf/conf.pipocooks");

// Se guarda los valores ingresados en los inputs
$nombreReg = trim($_REQUEST["nombreReg"]);
$apellidoReg = trim($_REQUEST["apellidoReg"]);
$correoReg = trim($_REQUEST["correoReg"]);
$contraReg = trim($_REQUEST["contraReg"]);


// Se inserta una fila con los datos ingresados anteriormente, guardando un nuevo usuario en la base de datos
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
?>