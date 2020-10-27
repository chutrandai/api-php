<?php
  require_once './systemConfig.php';
  class authDao {
    private $dbReference;
    var $dbConnect;
    var $result;

    function __construct(){
    }
    function __destruct(){
    }
    
    function mysql_fix_string($conn, $strQuery) {
      if(get_magic_quotes_gpc()) { // bat che do them dau escape truoc các ký tự đặc biệt 
        $strQuery = stripcslashes($strQuery); // xoa dau /.
        return $conn->real_escape_string($strQuery); // bo di nhung phan tu dac biet.
      }
    }

    function login() {
      $this->dbReference= new systemConfig();
      $this->dbConnect = $this->dbReference->connectDB();
      if($this->dbConnect == NULL) {
        $this->dbReference->sendResponse(503, '{"error_message":'.$this->dbReference->getStatusCodeMeeage(503).'}');
      } else {
        $username= $_POST['username'];
        $password= $_POST['password'];
        // $username= mysql_fix_string($this->dbConnect, $_POST['username']);
        // $password= mysql_fix_string($this->dbConnect, $_POST['password']);
        $cookie_name = "user";
        setcookie($cookie_name, $username, time() + (60*60), "/");
        $sql = 'SELECT 
                  employee_code AS userName,
                  password AS passWord
                FROM `employee` 
                WHERE 1 = 1
                  AND employee_code =\''.$username.'\''.
                  'AND password =\''.$password.'\'';
        $this->result = $this->dbConnect->query($sql);
        // Mysql_num_row is counting table row
        $count=$this->result->num_rows;
        if($count > 0) {
          session_start();
          $_SESSION['loggedin'] = true;
          $_SESSION['username'] = $username;
          $this->dbReference->sendResponse(200,'{"items":'.json_encode($count).'}');
        } else {
          $this->dbReference->sendResponse(404,'{"items":null}');
        }
      }
    }
    
  }
?>
<?php
  $viva = new authDao();
  $viva->login();
?>