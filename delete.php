<?php
$Cust = $_POST['Cust'];

if(!empty($Cust))
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
           $DELETE = " DELETE FROM customer WHERE Cust = $Cust ";

           $stmt = $conn->prepare($DELETE);
           //$stmt->bind_param("iisis", $Cust, $TransferID, $TypeOfTransfer, $Amount, $Beneficiary);
           $stmt->execute();
           echo "record deleted successfully";
           header("Location:AccountDetails.php");
           $stmt->close();
           $conn->close();
      }

}
else
{
    echo "Customer field is required";
    die();
}
?>
