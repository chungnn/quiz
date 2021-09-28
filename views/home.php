<!DOCTYPE html>
<html lang="en">
<head>
    <?php include('header.php') ?>
    <title>ToiLamDev | Online Quiz System</title>
</head>
<body>
    <?php 
    include 'nav_bar.php';
    ?>
    <div class="container-fluid admin">
        <div class="card col-md-5 offset-2">
            <div class="card-body">
                <table class="table table-striped">
                    <thead>
                        <th>Quiz</th>
                        <th>Items</th>
                        <?php if($_SESSION['login_user_type'] == 3): ?>
                        <th>Status</th>
                        <?php else: ?>
                        <th>Had Taken</th>
                        <?php endif; ?>
                    </thead>
                    <tbody>
                        <?php 
                            foreach($rows as $row) {
                                $taken = 0;
                            ?>
                            <tr>
                                <td><?php echo $row['title'] ?></td>
                                <td class='text-center'>10</td>
                                <?php if($_SESSION['login_user_type'] == 3): ?>
                                <td class='text-center'><?php echo $taken > 1 ? 'Taken' : 'Pending' ?></td>
                                <?php else: ?>
                                <td class='text-center'><?php echo $taken ?></td>
                                <?php endif; ?>
                            </tr>
                            <?php
                        }

                        ?>
                    </tbody>  
                </table>
            </div>
        </div>
       </div>
</body>
</html>