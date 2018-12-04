<?php
$Cust = $_POST['Cust'];
$FDid = $_POST['FDid'];
$Tenure = $_POST['Tenure'];
$Interest = $_POST['Interest'];
$PrincipalAmount = $_POST['PrincipalAmount'];

if(!empty($Cust) || !empty($FDid) || !empty($Tenure) || !empty($Interest) || !empty($PrincipalAmount))
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
           $INSERT = "INSERT Into FD (Cust, FDid, Tenure, Interest, PrincipalAmount) values(?, ?, ?, ?, ?)";

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
           $stmt->bind_param("iiiii", $Cust, $FDid, $Tenure, $Interest, $PrincipalAmount);
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
