<?php
// Carrega os controllers responsáveis pelos endpoints.
require_once __DIR__ . '/app/Controllers/UsuarioController.php';
require_once __DIR__ . '/app/Controllers/PessoasController.php';
require_once __DIR__ . '/app/Controllers/TiposAtendimentosController.php';
require_once __DIR__ . '/app/Controllers/AtendimentosController.php';

// Define controller e action por query string.
// Exemplo: ?controller=usuarios&action=listar
$controller = $_GET['controller'] ?? 'home';
$action     = $_GET['action']     ?? 'index';

// ─── Usuários ───────────
if ($controller === 'usuarios') {
    $usuariosController = new UsuariosController();

    switch ($action) {
        case 'listar':
            $usuariosController->listar();
            break;
        case 'buscar':
            $usuariosController->buscarPorId();
            break;
        case 'criar':
            $usuariosController->criar();
            break;
        case 'atualizar':
            $usuariosController->atualizar();
            break;
        case 'excluir':
            $usuariosController->excluir();
            break;
        default:
            http_response_code(404);
            echo json_encode(['erro' => 'Ação de usuários não encontrada.']);
            break;
    }

// ─── Pessoas ──────────
} elseif ($controller === 'pessoas') {
    $pessoasController = new PessoasController();

    switch ($action) {
        case 'listar':
            $pessoasController->listar();
            break;
        case 'buscar':
            $pessoasController->buscarPorId();
            break;
        case 'criar':
            $pessoasController->criar();
            break;
        case 'atualizar':
            $pessoasController->atualizar();
            break;
        case 'inativar':
            $pessoasController->inativar();
            break;
        default:
            http_response_code(404);
            echo json_encode(['erro' => 'Ação de pessoas não encontrada.']);
            break;
    }

// ─── Tipos de Atendimentos ─────────
} elseif ($controller === 'tipos_atendimentos') {
    $tiposController = new TiposAtendimentosController();

    switch ($action) {
        case 'listar':
            $tiposController->listar();
            break;
        case 'buscar':
            $tiposController->buscarPorId();
            break;
        case 'criar':
            $tiposController->criar();
            break;
        case 'atualizar':
            $tiposController->atualizar();
            break;
        case 'inativar':
            $tiposController->inativar();
            break;
        default:
            http_response_code(404);
            echo json_encode(['erro' => 'Ação de tipos de atendimentos não encontrada.']);
            break;
    }

// ─── Atendimentos ─────────────
} elseif ($controller === 'atendimentos') {
    $atendimentosController = new AtendimentosController();

    switch ($action) {
        case 'listar':
            $atendimentosController->listar();
            break;
        case 'buscar':
            $atendimentosController->buscarPorId();
            break;
        case 'criar':
            $atendimentosController->criar();
            break;
        case 'atualizar':
            $atendimentosController->atualizar();
            break;
        case 'atualizarStatus':
            $atendimentosController->atualizarStatus();
            break;
        default:
            http_response_code(404);
            echo json_encode(['erro' => 'Ação de atendimentos não encontrada.']);
            break;
    }

// ─── Home ────────────────────────────────────────────────────────────────────
} else {
    echo '<h1>AtendeLab</h1>';
    echo '<p>Projeto em execução. Use ?controller=usuarios&action=listar para testar.</p>';
}