<?php 
session_start();

require_once 'constant.php';
require_once 'env_loader.php';
require_once APP_DIR . DS . 'libs' . DS . 'Database.php';

class Application {
    
    public function run() {
        $controller = strtolower($_GET['c'] ?? 'home');
        $action = strtolower($_GET['a'] ?? 'index');
        $controllerName = ucfirst($controller) . 'Controller';
        $load = APP_DIR . DS . 'controllers'. DS . $controllerName .'.php';
        require_once $load;
        $controller = new $controllerName();
        $controller->$action();       
    }
    
}

$app = new Application();
$app->run();
