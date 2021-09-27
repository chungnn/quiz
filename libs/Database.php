<?php


class Database {
    
    private $conn;
    
    private static $instance;
    
    private function __construct() {
        $host = $_SERVER["DB_HOST"];
        $username = $_SERVER["DB_USERNAME"];
        $password = $_SERVER["DB_PASSWORD"];
        $dbname = $_SERVER["DB_NAME"];
        
        $this->conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $this->conn->exec("SET NAMES utf8");
    }
    
    public static function getConnection() {
        
        if(self::$instance == null) {
            self::$instance = new static();
        }
        
        return self::$instance->conn;
    }
    
}