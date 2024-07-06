<?php
include_once "../includes/header.php";

$errorMessage = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = htmlspecialchars($_POST["email"]);
    $password = $_POST["password"];

    $DB = new DB();


    // var_dump($email);
    // var_dump($password);
    $valid = $DB->validateLogin($email, $password);
    // var_dump($valid);

    // var_dump(password_hash("Nimda123!", PASSWORD_DEFAULT));
    if ($valid) {
        $usr = $DB->userFromEmail($email);
        // var_dump($usr);
        if (password_verify($password, $usr["PW"])) {
            $DB->login($usr["ID"], session_id());
            header("Location: /admin/adminpanel.php");
        } else {
            $errorMessage = "Invalid email or password.";
        }
    } else {
        $errorMessage = $valid;
    }
}

?>

<div id="Header">
    <p class="Title">Login</p>
</div>

<div id="content">
    <div id="contentbox">
        <form action="login.php" method="post" class="loginForm">
            <?php if ($errorMessage != "") { ?>
                <div class="loginbox">
                    <p class="error"><?php echo $errorMessage; ?></p>
                </div>
            <?php } ?>
            <div class="loginbox">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" required>
            </div>
            <div class="loginbox">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="loginbox">
                <input type="submit" value="Login">
            </div>
        </form>
    </div>
</div>


<?php
include_once "../includes/footer.php";
?>