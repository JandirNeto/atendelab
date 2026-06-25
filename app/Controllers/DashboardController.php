<?php
class DashboardController {
    public function resumo() {
        require_once __DIR__ . '/../../config/database.php';
        $pdo = (new Database())->getConexao();
        $dados = [
            'indicadores' => [
                'total_pessoas'      => $pdo->query("SELECT COUNT(*) FROM pessoas")->fetchColumn(),
                'total_tipos'        => $pdo->query("SELECT COUNT(*) FROM tipos_atendimentos")->fetchColumn(),
                'total_atendimentos' => $pdo->query("SELECT COUNT(*) FROM atendimentos")->fetchColumn(),
            ],
            'atendimentos_recentes' => $pdo->query(
                "SELECT a.id, p.nome AS pessoa, t.nome AS tipo, a.status, a.data_atendimento
                 FROM atendimentos a
                 JOIN pessoas p ON p.id = a.pessoa_id
                 JOIN tipos_atendimentos t ON t.id = a.tipo_atendimento_id
                 ORDER BY a.id DESC LIMIT 5"
            )->fetchAll(PDO::FETCH_ASSOC),
        ];
        http_response_code(200);
        echo json_encode($dados);
    }
}