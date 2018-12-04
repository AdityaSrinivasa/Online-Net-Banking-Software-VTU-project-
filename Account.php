<?php
$Cust = $_POST['Cust'];
$AccountNo = $_POST['AccountNo'];
$AccountType = $_POST['AccountType'];
$Name = $_POST['Name'];
$Nominee = $_POST['Nominee'];

if(!empty($Cust) || !empty($AccountNo) || !empty($AccountType) || !empty($Name) || !empty($Nominee))
{
      $host = "localhost";
      $dbUsername = "root";
      $dbPassword = "";
      $dbname = "createaccount";

      $conn = new mysqli($host, $dbUsername, $dbPassword, $dbname);

      if (mysqli_connect_error()) {
        die('Connect Error('.mysqli_connect_errno().')'.mysqli_connect_error());
      } else {
           //$SELECT = "SELECT Cust From createaccount Where Cust = ? Limit=1";
           $INSERT = "INSERT Into account (Cust, AccountNo, AccountType, holder, Nominee) values(?, ?, ?, ?, ?)";

           //$stmt = $conn->prepare($SELECT);
           //$stmt->bind_param("s", $Address);
           //$stmt->execute();
           //$stmt->bind_result($Address);
           //$stmt->store_result();
          //$rnum = $stmt->num_rows;

           //if ($rnum==0)
          //{
           //$stmt->close();

           $stmt = $conn->prepare($INSERT);
           $stmt->bind_param("iisss", $Cust, $AccountNo, $AccountType, $Name, $Nominee);
           $stmt->execute();
           echo "new record inserted successfully";
           //}
           //else
           //{
            //  echo "Someone has registered using this aadhar number";
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
