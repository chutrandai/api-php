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
    $sql = ' SELECT 
              cri.assessment_criteria_id AS assessmentCriteriaId,
              cri.assessment_criteria_name AS assessmentCriteriaName,
              cri.default_score AS defaultScore,
              cri.min_score AS minScore,
              cri.max_score AS maxScore,
              cri.assessment_criteria_type AS assessmentCriteriaType,
              cri.assessment_criteria_content AS assessmentCriteriaContent
             FROM assessment_criteria cri ';
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
      $dataResponse = new stdClass();
      $dataResponse->assessmentCriterias = $result;
      $this->dbReference->sendResponse(200, $dataResponse);
    } else {
      $this->dbReference->sendResponse(200,'{"items":null}');
    }
  }

  public function createCriteria($assessmentCriteriaName, $defaultScore, $minScore, $maxScore,
            $assessmentCriteriaType, $assessmentCriteriaContent) {
    $sqlInsert = 'INSERT INTO `criteria` (`assessment_criteria_name`, `default_score`, `min_score`, `max_score`,
      `assessment_criteria_type`, `assessment_criteria_content`)
       VALUES (\''.$assessmentCriteriaName.'\','. $defaultScore .' ,'. $minScore .' ,'.
       $maxScore .' ,'. $assessmentCriteriaType .' ,'. $assessmentCriteriaContent .')';
    $this->result = $this->dbConnect->query($sqlInsert);
    $this->dbReference->sendResponse(200,'{"items":'.json_encode($this->result).'}');
  }

  public function updateCriteria($assessmentCriteriaId, $assessmentCriteriaName, $defaultScore, $minScore, $maxScore,
            $assessmentCriteriaType, $assessmentCriteriaContent) {
    $sqlUpdate = 'UPDATE `criteria` 
        SET `assessment_criteria_name` = \''. $assessmentCriteriaName .'\'
      , SET `default_score` = '. $defaultScore .'
      , SET `min_score` = '. $minScore .'
      , SET `max_score` = '. $maxScore .'
      , SET `assessment_criteria_type` = '. $assessmentCriteriaType .'
      , SET `assessment_criteria_content` = '. $assessmentCriteriaContent .'
      WHERE assessment_criteria_id = '.$assessmentCriteriaId;
    $this->result = $this->dbConnect->query($sqlUpdate);
    $this->dbReference->sendResponse(200,'{"items":'.json_encode($result).'}');
  }
}
?>