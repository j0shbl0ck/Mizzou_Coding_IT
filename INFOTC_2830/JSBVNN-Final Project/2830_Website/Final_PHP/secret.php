<?php
    //set the session on the login page
    $_SESSION['loggedIn'] = true;  

    //on the second page you check if that session is true, else redirect to the login page  
    if($_SESSION['loggedIn'])
        //allow
    else
        //redirect to the login page
        header('Location: portal.html');

?>