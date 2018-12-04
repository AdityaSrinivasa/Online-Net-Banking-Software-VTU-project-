<?php
$Cust = $_POST['Cust'];
$ATMID = $_POST['ATMID'];
$Amount = $_POST['Amount'];
$CardLimit = $_POST['CardLimit'];
$Type = $_POST['Type'];
$CardNo = $_POST['CardNo'];
$ExpDate = $_POST['ExpDate'];

if(!empty($Cust) || !empty($ATMID) || !empty($Amount) || !empty($CardLimit) || !empty($Type) || !empty($CardNo) || !empty($ExpDate))
{
      $host = "localhost";
      $dbUsername = "root";
      $dbPassword = "";
      $dbname = "createaccount";

      $conn = new mysqli($host, $dbUsername, $dbPassword, $dbname);

      if (mysqli_connect_error()) {
        die('Connect Error('.mysqli_connect_errno().')'.mysqli_connect_error());
      } else {
           //$SELECT = "SELECT Cust From createaccount Where Cust = ? CardLimit=1";
           $INSERT = "INSERT Into ATM (Cust, ATMID, Amount, CardLimit, Type, CardNo, ExpDate) values(?, ?, ?, ?, ?, ?, ?)";

           //$stmt = $conn->prepare($SELECT);
           //$stmt->bind_param("s", $Amount);
           //$stmt->execute();
           //$stmt->bind_result($Amount);
           //$stmt->store_result();
          //$rnum = $stmt->num_rows;

           //if ($rnum==0)
          //{
           //$stmt->close();

           $stmt = $conn->prepare($INSERT);
           $stmt->bind_param("iiiisis", $Cust, $ATMID, $Amount, $CardLimit, $Type, $CardNo, $ExpDate);
           $stmt->execute();
           echo "new record inserted successfully";
           //}
           //else
           //{
            //  echo "Someone has registered using this ATMID number";
           //}
           $stmt->close();
           $conn->close();
      }

}
else
{
    echo "All field are required";
    die();
}



?>
