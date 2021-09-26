<?php

define('DS', DIRECTORY_SEPARATOR);
define('APP_DIR', dirname(__FILE__));
require_once APP_DIR . DS . "vendor" . DS . "autoload.php";

$dotenv = Dotenv\Dotenv::createImmutable(APP_DIR);
$dotenv->load();

$host = $_SERVER["DB_HOST"];
$username = $_SERVER["DB_USERNAME"];
$password = $_SERVER["DB_PASSWORD"];
$dbname = $_SERVER["DB_NAME"];

$conn = new mysqli($host, $username, $password, $dbname) or die("Could not connect to mysql".mysqli_error($con));

