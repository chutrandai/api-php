<?php
require_once './systemConfig.php';
 
class criteriaDAO { 
  private $dbReference;
  var $dbConnect;
  var $result;
  private $_limit;
  private $_page;
  private $_query;
  private $_total;
  public function __construct() {
    $this->dbReference= new systemConfig();
    $this->dbConnect = $this->dbReference->connectDB();
  }
  
  public function getData( $limit = 10, $page = 1 ) {
    $this->_limit = $limit;
    $this->_page = $page;
    // $criteriaName = $_GET['criteriaName'];
    // $score = $_GET['score'];
    $sql = ' SELECT * FROM criteria cri ';
    $condition = ' WHERE 1 = 1';
    // filter
    if(isset($_GET['criteriaName'])) {
      $condition .= ' AND cri.`criteria-name` LIKE \'%'. $_GET['criteriaName'] .'%\'';
    }
    if(isset($_GET['score'])) {
      $condition .= ' AND '. $_GET['score'].' BETWEEN cri.`min-score` AND cri.`max-score` ';
    }
    // paging
    $query = $sql . $condition . " LIMIT " . ( ( $this->_page - 1 ) * $this->_limit ) . ", $this->_limit";
    $this->result = $this->dbConnect->query($query);
    $this->_total = $this->result->num_rows;
    if($this->result->num_rows > 0) {
      $resultSet = array();
      while($row = $this->result->fetch_assoc()) {
        $resultSet[] = $row;
      }
      $result = new stdClass();
      $result->page = $this->_page;
      $result->limit = $this->_limit;
      $result->total = $this->_total;
      $result->data = $resultSet;
      $this->dbReference->sendResponse(200,'{"items":'.json_encode($result).'}');
    } else {
      $this->dbReference->sendResponse(200,'{"items":null}');
    }
  }

  public function createCriteria($criteriaName, $minScore, $maxScore) {
    $sqlInsert = 'INSERT INTO `criteria` (`criteria-name`, `min-score`, `max-score`)
       VALUES (\''.$criteriaName.'\','. $minScore .' ,'. $maxScore .')';
    $this->result = $this->dbConnect->query($sqlInsert);
    $this->dbReference->sendResponse(200,'{"items":'.json_encode($result).'}');
  }

  public function updateCriteria($criteriaId, $criteriaName, $minScore, $maxScore) {
    $sqlUpdate = 'UPDATE `criteria` 
        SET `criteria-name` = \''. $criteriaName .'\'
      , SET `min-score` = '. $minScore .'
      , SET `max-score` = '. $maxScore .'
      WHERE criteria-id = '.$criteriaId;
    $this->result = $this->dbConnect->query($sqlUpdate);
    $this->dbReference->sendResponse(200,'{"items":'.json_encode($result).'}');
  }
}
?>