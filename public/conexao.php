<?php

$host = "localhost";
$banco = "atendelab";
$usuario = "root";
//$porta = "3307";
$senha = "";
    try{
        $pdo = new PDO(
            "mysql:host=$host;dbname=$banco;charset=utf8",
            $usuario,
            $senha
        );
        echo "conexão realizada com sucesso!";
    } catch (PDOException $e) {
            echo "Erro: " . $e->getMessage();
    }