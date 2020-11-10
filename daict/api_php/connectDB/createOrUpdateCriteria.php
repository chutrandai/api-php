<?php
    require_once './criteriaDAO.php';
  session_start();
  if (isset($_SESSION['username']) && isset($_COOKIE['user'])) {
    $assessmentCriteriaId = isset($_POST['assessmentCriteriaId']) ? $_POST['assessmentCriteriaId'] : null;
    $assessmentCriteriaName = isset($_POST['assessmentCriteriaName']) ? $_POST['assessmentCriteriaName'] : null;
    $defaultScore = isset($_POST['defaultScore']) ? $_POST['defaultScore'] : null;
    $minScore = isset($_POST['minScore']) ? $_POST['minScore'] : null;
    $maxScore = isset($_POST['maxScore']) ? $_POST['maxScore'] : null;
    $assessmentCriteriaType = isset($_POST['assessmentCriteriaType']) ? $_POST['assessmentCriteriaType'] : null;
    $assessmentCriteriaContent = isset($_POST['assessmentCriteriaContent']) ? $_POST['assessmentCriteriaContent'] : null;
    if($assessmentCriteriaId) {
      // update
      $active = new criteriaDAO();
      $active.updateCriteria($assessmentCriteriaId, $assessmentCriteriaName, $defaultScore, $minScore, $maxScore,
      $assessmentCriteriaType, $assessmentCriteriaContent);
    } else {
      // insert
      $active = new criteriaDAO();
      $active->createCriteria($assessmentCriteriaName, $defaultScore, $minScore, $maxScore,
      $assessmentCriteriaType, $assessmentCriteriaContent);
    }
  }
?>