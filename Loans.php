<?php
$Cust = $_POST['Cust'];
$LoanID = $_POST['LoanID'];
$Amount = $_POST['Amount'];
$Interest = $_POST['Interest'];
$Mortgage = $_POST['Mortgage'];
$Payments = $_POST['Payments'];
$Surity = $_POST['Surity'];

if(!empty($Cust) || !empty($LoanID) || !empty($Amount) || !empty($Interest) || !empty($Mortgage) || !empty($Payments) || !empty($Surity))
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
           $INSERT = "INSERT Into Loans (Cust, LoanID, Amount, Interest, Mortgage, Payments, Surity) values(?, ?, ?, ?, ?, ?, ?)";

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
           $stmt->bind_param("iiiisis", $Cust, $LoanID, $Amount, $Interest, $Mortgage, $Payments, $Surity);
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
