<?php 
define('DS', DIRECTORY_SEPARATOR);
define('APP_DIR', dirname(__FILE__));
require_once APP_DIR . DS . "vendor" . DS . "autoload.php";

$dotenv = Dotenv\Dotenv::createImmutable(APP_DIR);
$dotenv->load();

require_once APP_DIR . DS . 'libs' . DS . 'Database.php';

extract($_POST);

if(empty($id)){
	$q1 = "SELECT * FROM questions where qid = :qid order by order_by desc limit 1";
	$stmt = Database::getConnection()->prepare($q1);
	$stmt->bindParam(":qid", $qid);
	$stmt->execute();
	$result = $stmt->fetchObject();
	$last_order = $result->order_by ?? 0;
	$order_by = $last_order > 0 ? $last_order + 1 : 1;

	$q2 = "INSERT INTO questions set question = :question, order_by = :order_by ";
	$q2 .= ', qid = :qid ';

	$stmt = Database::getConnection()->prepare($q2);
	$stmt->bindParam(":question", $question);
	$stmt->bindParam(":qid", $qid, PDO::PARAM_INT);
	$stmt->bindParam(":order_by", $order_by, PDO::PARAM_INT);
	$stmt->execute();
	$question_id = Database::getConnection()->lastInsertId();

	if($question_id){
		$insert = array();
		for($i = 0 ; $i < count($question_opt);$i++) {
			$is_right = isset($is_right[$i]) ? $is_right[$i] : 0;
			$option_text = $question_opt[$i];
			$qi = "INSERT INTO question_opt set question_id = :question_id";
			$qi .= ", option_txt = :option_txt, `is_right` = :is_right ";
			$stmt = Database::getConnection()->prepare($qi);
			$stmt->bindParam(":question_id", $question_id, PDO::PARAM_INT);
			$stmt->bindParam(":option_txt", $option_text);
			$stmt->bindParam(":is_right", $is_right, PDO::PARAM_INT);
			$stmt->execute();
			$insert[] = Database::getConnection()->lastInsertId();
		}
		if(count($insert) == 4){
			echo 1;
		} else {
			$q3 = "DELETE FROM questions where id = :id";
			$stmt = Database::getConnection()->prepare($q3);
			$stmt->bindParam(":id", $qid, PDO::PARAM_INT);
			$stmt->execute();
			$q3 = "DELETE FROM question_opt where question_id = :question_id";
			$stmt = Database::getConnection()->prepare($q3);
			$stmt->bindParam(":question_id", $question_id, PDO::PARAM_INT);
			$stmt->execute();
			echo 2;
			
		}

	}
}else{
	// note: qid = question list_id
	// id = question_id
	$q2 = "UPDATE questions set question = :question ";
	$q2 .= ', qid = :qid WHERE id = :id';

	$stmt = Database::getConnection()->prepare($q2);
	$stmt->bindParam(":question", $question);
	$stmt->bindParam(":qid", $qid, PDO::PARAM_INT);
	$stmt->bindParam(":id", $id, PDO::PARAM_INT);
	$update = $stmt->execute();
	
	if($update){
		$q3 = "DELETE FROM question_opt where question_id = :question_id";
		$stmt = Database::getConnection()->prepare($q3);
        $stmt->bindParam(":question_id", $id, PDO::PARAM_INT);
        $stmt->execute();

		$insert = array();
		for($i = 0 ; $i < count($question_opt);$i++){
			$is_right = isset($is_right[$i]) ? $is_right[$i] : 0;
			$option_text = $question_opt[$i];
			$qi = "INSERT INTO question_opt set question_id = :question_id";
			$qi .= ", option_txt = :option_txt, `is_right` = :is_right ";
			$stmt = Database::getConnection()->prepare($qi);
			$stmt->bindParam(":question_id", $id, PDO::PARAM_INT);
			$stmt->bindParam(":option_txt", $option_text);
			$stmt->bindParam(":is_right", $is_right, PDO::PARAM_INT);
			$stmt->execute();
			$insert[] = Database::getConnection()->lastInsertId();
		}
		if(count($insert) == 4){
			echo 1;
		}else{
			$q3 = "DELETE FROM questions where id = :id";
			$stmt = Database::getConnection()->prepare($q3);
			$stmt->bindParam(":id", $id, PDO::PARAM_INT);
			$stmt->execute();
			$q3 = "DELETE FROM question_opt where question_id = :question_id";
			$stmt = Database::getConnection()->prepare($q3);
			$stmt->bindParam(":question_id", $id, PDO::PARAM_INT);
			$stmt->execute();
			echo 2;
			
		}
	}
}
