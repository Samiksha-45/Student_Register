<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        /* Basic styling */
        body {
          font-family: Times New Roman;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-image: url('https://i.pinimg.com/736x/b3/32/f7/b332f73fc8261caf033fdd35b5dd99d2.jpg'); /* Replace with the actual URL of your background image */
            background-size: cover;
            background-position: center;
            
        }

        /* Semi-transparent overlay */
        .register-form {
            background-color: rgba(255, 255, 255, 0.8); /* White with opacity */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            height: 92vh;
            width: 450px;
            text-align: left;
             
         
        }

        .register-form h2 {
        font-family: Times New Roman;
            margin-bottom: 20px;
            color: #333;
            text-align: center;
           text-decoration: underline;
           font-size: 25px
        }

        /* Flex container for label and input */
        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }

        .form-group label {
            color: black;
            margin-bottom: 5px;
            font-size: 18px;
            
        }

        /* Align input fields and labels */
        .register-form input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        /* Button styling */
        .register-form button {
            width: 100%;
            padding: 10px;
            background-color: #1569C7;
            border: none;
            color: black;
            font-size: 20px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            font-family: Times New Roman;
           
        }

        .register-form button:hover {
            background-color: blue;
            color: whitesmoke
        }

        /* Login link styling */
        .login-link {
            margin-top: 15px;
            text-align: center;
        }

        .login-link a {
            color: darkblue;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
 
        }
    </style>
</head>
<body>
    <div class="register-form">
        <h2>Student Register</h2>
        <h3>${message}</h3>  
        <form action="registerServlet" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" name="username" placeholder="Username" required />
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" name="email" placeholder="Email" required />
            </div>
            <div class="form-group">
                <label for="phoneno">Phone Number:</label>
                <input type="text" name="phoneno" placeholder="Phone Number" required />
            </div>
            <div class="form-group">
                <label for="stid">Student ID:</label>
                <input type="text" name="stid" placeholder="Student ID" required />
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" name="password" placeholder="Password" required />
            </div>
            <button type="submit">Register</button>
        </form>
        <div class="login-link">
            <a href="login.jsp">Already have an account? Login here</a>
        </div>
    </div>
</body>
</html>
