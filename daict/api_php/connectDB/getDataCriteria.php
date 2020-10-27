<?php
    require_once './criteriaDAO.php';
  session_start();
//   $cookie_name = "user";
  $page = $_GET["page"];
  $limit = $_GET["limit"];
  if (isset($_SESSION['username']) && isset($_COOKIE['user'])) {
      $viva = new criteriaDAO();
      $viva->getData($limit, $page);
  } else {
      echo "Please log in first to see this page.";
  }
?>