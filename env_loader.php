<?php 

require_once APP_DIR . DS . "vendor" . DS . "autoload.php";

$dotenv = Dotenv\Dotenv::createImmutable(APP_DIR);
$dotenv->load();
