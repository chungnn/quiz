<?php 

class HomeController {

    public function index() {
        $q1 = "SELECT q.*,u.name as fname from quiz_list q ";
        $q1 .=" left join users u on q.user_id = u.id order by q.title asc ";
        $stmt = Database::getConnection()->prepare($q1);
        $stmt->execute();
        $rows = $stmt->fetchAll();
        $name = $_SESSION['login_name'] ?? '';
        require_once APP_DIR . DS . 'views' . DS . 'home.php';  
    }

}
