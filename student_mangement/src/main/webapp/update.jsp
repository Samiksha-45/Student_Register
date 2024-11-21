<!DOCTYPE html>
<html>
<head>
    <title>Update Details</title>
    <style>
        /* Body styling for full page center alignment and gradient background */
        body {
            font-family: Times New Roman;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
           background-image: url('https://i.pinimg.com/736x/b3/32/f7/b332f73fc8261caf033fdd35b5dd99d2.jpg');
           background-size: cover;
            background-position: center;
            /* Replace with your background image URL */
        }

        
        .container {
            background-color: rgba(255, 255, 255, 0.6); /* Semi-transparent white */
            padding: 30px;
             font-family: Times New Roman;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            width: 350px;
            text-align: left;
          
        }

        /* Heading styling */
        .container h2 {
            color: #333;
            font-family: Times New Roman;
            margin-bottom: 20px;
            text-align: center;
             text-decoration: underline;
        }

        /* Label styling for form elements */
        .container label {
            color: black;
            font-weight: bold;
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
        }

        /* Input styling for text fields */
        .container input[type="text"], .container input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        /* Styling for submit button */
        .container input[type="submit"] {
            background-color: #4a90e2;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 20px;
             font-family: Times New Roman;
             font-size: 18px
        }

        /* Hover effect for submit button */
        .container input[type="submit"]:hover {
            background-color: #357abd;
        }
           .back-button {
            background-color: #4a90e2;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 1em;
             width: 350px;
              font-family: Times New Roman;
             font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s;
       }

       .back-button:hover {
            background-color: #357abd;
       }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Your Details</h2>
        <form action="UpdateServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" name="username"  placeholder="username" required>

            <label for="phoneno">Phone Number:</label>
            <input type="text" name="phoneno"  placeholder="password" required>

          

            <input type="submit" value="Update">
        </form>
        <button class="back-button" onclick="location.href='homepage.jsp'">Back to Home</button>
    </div>
</body>
</html>
