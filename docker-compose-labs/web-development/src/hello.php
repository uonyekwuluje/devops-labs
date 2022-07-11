<!DOCTYPE HTML>
<html>
<head>
    <title>PHP Application</title>
</head>
<body>
   <?php
    # Assign value to variable
    $color = "blue";
    $num = 10;
 
    # Get the type of a variable
    echo gettype($color) . "<br>";
    echo GETTYPE($color) . "<br>";
    echo "The Text => " . $color . " Number " .$num;

    // Define Constant
    echo  "<br>";
    define("SITE_URL", "https://www.testcode.com/");
    echo 'Thank you for visiting - ' . SITE_URL;

    $colors = array("Red", "Green", "Blue");
    var_dump($colors);
    echo "<br>";
     
    $color_codes = array(
	"Red" => "#ff0000",
	"Green" => "#00ff00",
	"Blue" => "#0000ff"
    );
    var_dump($color_codes);
   
    echo "<br>";
    $x = 5;
    $y = 34;
    print $x . " + " . $y . " = " . $x+$y;

   ?>
</body>
</html>
