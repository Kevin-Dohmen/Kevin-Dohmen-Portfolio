<?php
include_once "includes/header.php";

$DB = new DB();

var_dump($DB->query("SELECT * FROM projects"));

?>



<?php
include_once "includes/footer.php";
?>