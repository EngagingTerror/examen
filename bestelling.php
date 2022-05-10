<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>bestellingen</title>
    <center>
    <img src="img\logo.png" width="120" height="120">
        <p>Welkom op de medewerkers dashboard</p>
        <a href="bestelling.php">bestellingen</a>
        <a href="reservering.php">reserveren</a>
        <a href="logout.php">Loguit</a>
</center>
</head>
<body>
    <br></br>
    <?php require_once 'b_process.php' ?>

    <?php 
    $mysqli = new mysqli('localhost', 'root', '','taste1') or die (mysqli_error($mysqli));
    $result = $mysqli->query("SELECT * FROM bestelling") or die ($mysqli->error);
    ?>
    <center>
    <Table>
        <thead>
        </thead>
        <?php 
        while ($row = $result->fetch_assoc()):?>
        <tr>
            <th>Tafel Nummer:</th>
            <td><?php echo $row['tafel_nr'];?></td>
            <th>eten:</th>
            <td><?php echo $row['Eten'];?></td>
            <th>drinken:</th>
            <td><?php echo $row['drinken'];?></td>
            <th>bestel tijd:</th>
            <td><?php echo $row['bestel_tijd'];?></td>
            <th colspan="2">Action</th>
            <td>
                <a href="bestelling.php?edit=<?php echo $row['bestelling_id']; ?>">edit</a>
                <a href="b_process.php?delete=<?php echo $row['bestelling_id']; ?>">delete</a>
            </td>
        </tr>
        <?php endwhile; ?>
        </Table>
        </center>
    <form action="b_process.php" method="post">
        <input type="hidden" name="bestelling_id" value="<?php echo $bestelling_id;?>">
    <center>
        <label>Tafel Nummer</label>
        <input type="text" name="tafel_nr" value="<?php echo $tafel_nr;?>" placeholder="tafel Nummer">
        <label>Eten</label>
        <select name="Eten">
                <option value="Hamburger">Hamburger</option>
                <option value="Patat">Patat</option>
                <option value="Patat">sla</option>
            </select>
            <label>Drinken</label>
            <select name="drinken">
                <option value="Cola">Cola</option>
                <option value="Fanta">Fanta</option>
                <option value="Water">Water</option>
            </select>
        <label>bestel tijd</label>
        <input type="text" name="bestel_tijd" value="<?php echo $Bestel_tijd;?>" placeholder="tijd- 00:00:00">
        <?php
        if ($update == true) :
        ?>
        <button type="submit" name="update">Update</button>
        <?php else : ?>
        <button type=" submit" name="save">save</button>
        <?php endif; ?>
    </center>
    </form>
   
</body>
</html>