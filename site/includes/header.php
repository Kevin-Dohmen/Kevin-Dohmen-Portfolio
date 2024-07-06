<?php
include_once "db.php";
$rootDir = $_SERVER['DOCUMENT_ROOT'];

$DB = new DB();

if (!isset($_SESSION)) {
    session_start();
}

$isloggedin = $DB->isLoggedIn(session_id());

?>

<!DOCTYPE html>
<html lang="nl">

<head>
    <meta charset="utf-8">
    <title>Kevin Projecten</title>
    <link rel="stylesheet" href="/css/master.css">

</head>

<body>
    <div id="wrapper">
        <div id="topBar">
            <a href="/index.php" class="menuButton">
                <img src="/img/icons/home.webp" alt="Pic" height="32px">
                <p class="menuText">Home</p>
            </a>
            <a href="/projects.php" class="menuButton">
                <img src="/img/icons/projects.webp" alt="Pic" height="32px">
                <p class="menuText">Projecten</p>
            </a>
            <a href="/contact.php" class="menuButton">
                <img src="/img/icons/contact.webp" alt="Pic" height="32px">
                <p class="menuText">Contact</p>
            </a>
            <a href="/cv.php" class="menuButton">
                <img src="/img/icons/cv.webp" alt="Pic" height="32px">
                <p class="menuText">CV</p>
            </a>
            <div class="LoginBtn">
                <?php

                if ($isloggedin) {
                    echo '<a href="/admin/adminPanel.php" class="menuButton">
                    <p class="menuText">Admin Panel</p>
                    </a>';
                } else {
                    echo '<a href="/admin/login.php" class="menuButton">
                    <p class="menuText">Login</p>
                    </a>';
                }
                ?>

            </div>

        </div>