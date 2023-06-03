<?php
require "dbconnect.php";
$result = $conn->query("SELECT * FROM respondents") ;
echo "<h2>Варианты выбора</h2>";
while ($row = $result->fetch()) {
    echo $row['name']."<br>" ;
}