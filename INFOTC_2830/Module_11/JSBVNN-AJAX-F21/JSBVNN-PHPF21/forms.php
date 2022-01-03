<?php 
$first_name = $_GET['first_name'];
$last_name = $_GET['last_name'];

echo "<br>Hello,"," ",$first_name," ",$last_name,", welcome to my PHP playground, designed to simulate the value of server-side development and pratical use in web development!<br>";
?>

<?php 
    if($_POST['username'] == 'test'
        && $_POST['password'] == pass)
        echo '<br>Credentials validated with POST<br>';
    else {
        echo 'Username or password is incorrect';
    }
?>

<?php
// This is for Hammering Function
    echo "<br>The provided number _ is a Hamming Number!\nThe provided number _ is not a Hamming Number!";
?>

<?php
// This is for List Creator Function
    echo "<br>This would output results for list creator Function<br>"
?>

<?php
$r = (float) $_POST['radius'];
$h = (float) $_POST['height'];
function surfaceCylinder($r,$h)
    {
        $pi = 3.141592653589;
        $area = 2*$pi*$r*$h+2*$pi*pow($r,2);
        $area_new = number_format($area,2);
        return $area_new;
    }
$area_n = $_GET[$area_new];
    echo "<br>The Cylinder Surface Area is <br>",$area_n;
?>
