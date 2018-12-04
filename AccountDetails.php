<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Account Details</title>
    <style type="text/css">

h1{
font-size: 30px;
color: #fff;
text-transform: uppercase;
font-weight: 300;
text-align: center;
margin-bottom: 15px;
}
table{
width:100%;
table-layout: fixed;
background-color: white;
border:1px solid black;
}
.tbl-header{
background-color: rgba(255,255,255,0.3);
}
.tbl-content{
height:300px;
overflow-x:auto;
margin-top: 0px;
border: 1px solid rgba(255,255,255,0.3);
}
th{
padding: 20px 15px;
text-align: left;
font-weight: 500;
font-size: 12px;
color: #101111;
text-transform: uppercase;
background-color:#e5e6e8;
}
td{
padding: 15px;
text-align: left;
vertical-align:middle;
font-weight: 300;
font-size: 12px;
color: #101111;
border-bottom: solid 1px rgba(255,255,255,0.1);
background-color: white;
}


/* demo styles */

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
body{
background-image: linear-gradient(125deg,#52eaf2,#16a2c9,#2980b9,#27ae60,#2c3e50);
background-size: 400% 400%;
animation: bganimation 20s infinite;
font-family:Arial;
}
section{
margin: 50px;
}
@keyframes bganimation {
  0%
  {
    background-position: 0% 50%;
  }
  50%
  {
    background-position: 100% 50%;
  }
  100%
  {
    background-position: 0% 50%;
  }

}

    </style>
  </head>
  <body>
    <h1>Customer Details</h1>
    <table>
      <tr class="tb1-header">
        <th>Customer ID</th>
        <th>Aadhar Number</th>
        <th>Address</th>
        <th>Age</th>
        <th>Pan Number</th>
        <th>Mobile Number</th>
        <th>DOB</th>
        <?php
              $conn = mysqli_connect("localhost", "root", "", "createaccount");
              if($conn-> connect_error) {
                die("Connection failed:". $conn->connect_error);
              }


              $sql = "Select Cust, Aadhar, Address, Age, Pan, Mobile, DOB from customer";
              $result = $conn->query($sql);

              if($result-> num_rows > 0)
              {
                  while ($row = $result-> fetch_assoc())
                  {
                      echo "<tr><td>" .$row["Cust"] ."</td><td>". $row["Aadhar"] ."</td><td>". $row["Address"] ."</td><td>". $row["Age"] ."</td><td>". $row["Pan"] ."</td><td>". $row["Mobile"] ."</td><td>". $row["DOB"] ."</td></tr>";
                  }
                  echo "</table>";
              }
              else
              {
                  echo "0 results in table";
              }
             $conn->close();
           ?>
       </tr>
    </table>









    <h1>Account Holders</h1>
    <table>
      <tr class="tb1-header">
        <th>Customer ID</th>
        <th>Account Number</th>
        <th>Account Type</th>
        <th>Name</th>
        <th>Nominee</th>
        <?php
              $conn = mysqli_connect("localhost", "root", "", "createaccount");
              if($conn-> connect_error) {
                die("Connection failed:". $conn->connect_error);
              }


              $sql = "Select Cust, AccountNo, AccountType, holder, Nominee from account";
              $result = $conn->query($sql);

              if($result-> num_rows > 0)
              {
                  while ($row = $result-> fetch_assoc())
                  {
                      echo "<tr><td>" .$row["Cust"] ."</td><td>". $row["AccountNo"] ."</td><td>". $row["AccountType"] ."</td><td>". $row["holder"] ."</td><td>". $row["Nominee"] ."</td></tr>";
                  }
                  echo "</table>";
              }
              else
              {
                  echo "0 results in table";
              }
             $conn->close();
           ?>
       </tr>
    </table>






  </body>
</html>
