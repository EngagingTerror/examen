<?php 


$mysqli = new mysqli('localhost', 'root', '', 'taste1') or die (mysqli_error($mysqli));

$bestelling_id = 0;
$update = false;
$tafel_nr = '';
$Eten = '';
$drinken = '';
$Bestel_tijd = '';	

//save knop bestelling
if (isset($_POST['save'])){
    $tafel_nr= $_POST['tafel_nr'];
    $Eten= $_POST['Eten'];
    $drinken= $_POST['drinken'];
    $Bestel_tijd= $_POST['bestel_tijd'];

    $mysqli->query("INSERT INTO bestelling (tafel_nr, Eten, drinken, bestel_tijd) VALUES( '$tafel_nr', '$Eten', '$drinken', '$Bestel_tijd')") or die ($mysqli->error());

    header("location: bestelling.php");

}
//delete knop bestelling
if (isset($_GET['delete'])) {
    $bestelling_id = $_GET['delete'];
    $mysqli->query("DELETE FROM bestelling WHERE bestelling_id=$bestelling_id") or die ($mysqli->error());

    header("location: bestelling.php");
}

//edit data bestelling
if (isset($_GET['edit'])) {
    $bestelling_id = $_GET['edit'];
    $update = true;
    $result = $mysqli->query("SELECT * FROM bestelling WHERE $bestelling_id=bestelling_id") or die ($mysqli->error());
    if ($result->num_rows){
        $row = $result->fetch_array();
        $tafel_nr= $row['tafel_nr'];
        $Eten= $row['Eten'];
        $drinken= $row['drinken'];
        $Bestel_tijd= $row['bestel_tijd'];
    }
    
    }
    //update data bestelling
    if (isset($_POST['update'])) {
        $bestelling_id = $_POST['bestelling_id'];
        $tafel_nr= $_POST['tafel_nr'];
        $Eten= $_POST['Eten'];
        $drinken= $_POST['drinken'];
        $Bestel_tijd= $_POST['bestel_tijd'];
    
        $mysqli->query("UPDATE bestelling SET tafel_nr='$tafel_nr', Eten='$Eten', drinken='$drinken', bestel_tijd'='$Bestel_tijd' WHERE bestelling_id=$bestelling_id") or die ($mysqli->error());
    
    
        header("location: bestelling.php");
    }
