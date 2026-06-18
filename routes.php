<?php

require_once __DIR__ . '/app/Middleware/auth.php';
require_once __DIR__ . '/app/Controllers/AuthController.php';
require_once __DIR__ . '/app/Controllers/UsuarioController.php';
require_once __DIR__ . '/app/Controllers/PessoasController.php';
require_once __DIR__ . '/app/Controllers/TiposAtendimentosController.php';
require_once __DIR__ . '/app/Controllers/AtendimentosController.php';

$controller = $_GET['controller'] ?? 'auth';
$action     = $_GET['action']     ?? 'login';

// Rotas publicas (auth)
if ($controller === 'auth') {
    $auth = new AuthController();
    switch ($action) {
        case 'login':     $auth->exibirLogin(); break;
        case 'entrar':    $auth->entrar();      break;
        case 'dashboard': exigirAutenticacao(); $auth->dashboard(); break;
        case 'logout':    $auth->logout();      break;
        default: http_response_code(404); exit('Acao de autenticacao nao encontrada.');
    }
    exit;
}

// Todas as rotas abaixo exigem autenticacao
exigirAutenticacao();

switch ($controller) {
    case 'usuarios':
        $obj = new UsuarioController();
        break;
    case 'pessoas':
        $obj = new PessoasController();
        break;
    case 'tipos':
        $obj = new TiposAtendimentosController();
        break;
    case 'atendimentos':
        $obj = new AtendimentosController();
        break;
    default:
        http_response_code(404);
        exit('Controller nao encontrado.');
}

if (!method_exists($obj, $action)) {
    http_response_code(404);
    exit('Acao nao encontrada.');
}

$obj->$action();