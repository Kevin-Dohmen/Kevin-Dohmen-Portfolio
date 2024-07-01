<?php
include_once "includes/header.php";

$DB = new DB();

$projects = $DB->getProjects();

echo "<pre>";
print_r($projects);
echo "</pre>";

var_dump($projects);

?>



<?php
include_once "includes/footer.php";
?>


