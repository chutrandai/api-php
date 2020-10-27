<?php
    require_once './criteriaDAO.php';
  session_start();
  if (isset($_SESSION['username']) && isset($_COOKIE['user'])) {
    $criteriaId = $_POST['criteriaId'];
    $criteriaName = $_POST['criteriaName'];
    $minScore = $_POST['minScore'];
    $maxScore = $_POST['maxScore'];
    if(isset($_POST['criteriaId'])) {
      // update
      $active = new criteriaDAO();
      $active.updateCriteria($criteriaId, $criteriaName, $minScore, $maxScore);
    } else {
      // insert
      $active = new criteriaDAO();
      $active->createCriteria($criteriaName, $minScore, $maxScore);
    }
  }
?>