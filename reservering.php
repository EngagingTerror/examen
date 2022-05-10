<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reserveren</title>
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
    <?php require_once 'process.php' ?>

    <?php 
    $mysqli = new mysqli('localhost', 'root', '','taste1') or die (mysqli_error($mysqli));
    $result = $mysqli->query("SELECT * FROM reserveren") or die ($mysqli->error);
    ?>
    <center>
    <Table>
        <thead>
        </thead>
        <?php 
        while ($row = $result->fetch_assoc()):?>
        <tr>
            <th>dag:</th>
            <td><?php echo $row['dag'];?></td>
            <th>klantnaam:</th>
            <td><?php echo $row['klantnaam'];?></td>
            <th>klantemail:</th>
            <td><?php echo $row['klantemail'];?></td>
            <th>telefoon:</th>
            <td><?php echo $row['telefoon'];?></td>
            <th>aantal personen:</th>
            <td><?php echo $row['aantal_personen'];?></td>
            <th>reserver tijd:</th>
            <td><?php echo $row['reserver_tijd'];?></td>
            <th>jarige:</th>
            <td><?php echo $row['jarige'];?></td>
            <th colspan="2">Action</th>
            <td>
                <a href="reservering.php?edit=<?php echo $row['reserver_id']; ?>">edit</a>
                <a href="process.php?delete=<?php echo $row['reserver_id']; ?>">delete</a>
            </td>
        </tr>
        <?php endwhile; ?>
        </Table>
        </center>
    <form action="process.php" method="post">
        <input type="hidden" name="reserver_id" value="<?php echo $Klantid;?>">
    <center>
        <label>dag</label>
        <input type="date" name="dag" value="<?php echo $dag;?>">
        <label>klantnaam</label>
        <input type="text" name="klantnaam" value="<?php echo $klantnaam;?>" placeholder="Klantnaam">
        <label>email</label>
        <input type="text" name="klantemail" value="<?php echo $klantemail;?>" placeholder="email">
        <label>telefoon</label>
        <input type="text" name="telefoon" value="<?php echo $telefoon;?>" placeholder="telefoon">
        <label>aantal personen</label>
        <input type="text" name="aantal_personen" value="<?php echo $aantal_personen;?>" placeholder="aantal personen">
        <label>reserver tijd</label>
        <input type="text" name="reserver_tijd" value="<?php echo $reserver_tijd;?>" placeholder="tijd- 00:00:00">
        <label>Jarige?</label>
        <input type="text" name="jarige" value="<?php echo $jarige;?>" placeholder="Ja of Nee">
    
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