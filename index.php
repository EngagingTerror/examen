<?php
if (isset($_POST["submit3"])) {

// Hier haalt de data van index.php, wanneer er op login geklikt word.
$userid = $_POST["userid"];
$pwd = $_POST["pwd"];

// Neemt functie voor login.
include "database.php";
include "login-database.php";
include "login-checker.php";
//linked to signup-checker.
$login = new LoginChecker($userid, $pwd);

//Error checker linked to login-checker.php
$login->loginUser();

/*gaat terug naar login.php
header("location: login.php?error=none");*/
}
?>
<center>
    <img src="img\logo.png" width="120" height="120">
    <p>Welkom bij Taste</p>
        <h4>Log in</h4>
        <form action="login.php" method="post">
            <input type="text" name="userid" placeholder="Username">
            <input type="password" name="pwd" placeholder="Password">
            <br></br>
            <button type="submit" name="submit3">Login</button>
            <p>Nog geen account klik dan sign in</p>
            <p><a href="signin.php">Sign In</a></p>
        </form>
    </center>