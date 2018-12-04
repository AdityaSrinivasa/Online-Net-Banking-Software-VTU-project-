<?php
$Cust = $_POST['Cust'];
$Aadhar = $_POST['Aadhar'];
$Address = $_POST['Address'];
$Age = $_POST['Age'];
$Pan = $_POST['Pan'];
$Mobile = $_POST['Mobile'];
$DOB = $_POST['DOB'];

if(!empty($Cust) || !empty($Aadhar) || !empty($Address) || !empty($Age) || !empty($Pan) || !empty($Mobile) || !empty($DOB))
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
           $INSERT = "INSERT Into customer (Cust, Aadhar, Address, Age, Pan, Mobile, DOB) values(?, ?, ?, ?, ?, ?, ?)";

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
           $stmt->bind_param("iisisis", $Cust, $Aadhar, $Address, $Age, $Pan, $Mobile, $DOB);
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
