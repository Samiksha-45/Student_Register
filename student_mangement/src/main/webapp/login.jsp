<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Login</title>
    <style>
        /* Basic body styling */
        body {
            font-family: Times New Roman;
            background-image: url('https://i.pinimg.com/736x/b3/32/f7/b332f73fc8261caf033fdd35b5dd99d2.jpg'); /* Replace with your background image URL */
            background-size: cover;
            background-position: center;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Container styling with blur and opacity */
        .container {
           background-color: rgba(255, 255, 255, 0.8); /* White with opacity */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 400px;
            text-align: left;
            border: 2px solid white;
             
          
        }

        /* Heading and error/message styling */
        .container h2 {
            color: black;
            margin-bottom: 20px;
            text-decoration: underline;
           text-align: center;
           
        }

        .container h3 {
            color: #566D7E; 
           text-align: center;
        }

        /* Label styling */
        .container label {
            display: block;
            text-align: left;
            font-size: 18px;
            color: black;
            margin-top: 15px;
        }

        /* Input field styling */
        .container input[type="email"],
        .container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        /* Submit button styling */
        .container input[type="submit"] {
            width: 100%;
            padding: 10px;
           background-color: #1569C7;
            border: none;
            color: black;
            font-size: 20px;
           font-family: Times New Roman;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
        }

        .container input[type="submit"]:hover {
            background-color: #4169E1;
            color: whitesmoke;
        }

        /* Form footer styling */
        .form-footer {
            margin-top: 15px;
            font-size: 18px;
            color: #333;
        }

        .form-footer a {
            color: darkblue;
            text-decoration: none;
            font-size: 14px;
        }

        .form-footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>${Message}</h3><br>
        <h3>${error}</h3>
        <h2>Student Login</h2>
       
        <form action="LoginServlet" method="post">
            <label for="email">Email:</label>
            <input type="email" name="email"  placeholder="Email"required>
            
            <label for="password">Password:</label>
            <input type="password" name="password" placeholder="Password" required>
            
            <input type="submit" value="Login">
        </form>
       
        <div class="form-footer">
            Don't have an account? <a href="register.jsp">Register here</a>.
        </div>
    </div>
</body>
</html>
