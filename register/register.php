<?php include('server.php') ?>
<!DOCTYPE html>
<html>
<head>
  <title>Registration</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div id="bcgcr">
  <div class="header">
  	<h2>Register</h2>
  </div>
	
  <form method="post" action="register.php">
  	<?php include('errors.php'); ?>
  	<div class="input-group">
  	  
  	  <input type="text" name="username" placeholder="Your Username" value="<?php echo $username; ?>">
  	</div>
  	<div class="input-group">
  
  	  <input type="email" name="email" placeholder="Your email" value="<?php echo $email; ?>">
      </div>
      <div class="input-group">
  
        <input type="date" name="age" placeholder="Birth Day"  value="<?php echo $age; ?>">
  	</div>
  	<div class="input-group">
  	 
  	  <input type="password" name="password_1" placeholder="Password" value="<?php echo $password_1 ?>">
  	</div>
  	<div class="input-group">
  	
  	  <input type="password" name="password_2" placeholder="Confirm your password" value="<?php echo $password_2 ?>">
  	</div>
  	<div class="input-group">
  	  <button type="submit" class="btn" name="reg_user">Register</button>
  	</div>
  	<p>
  		Already a member? <a href="login.php">Sign in</a>
      </p>
  </form>

  </div>
</body>
</html>
 