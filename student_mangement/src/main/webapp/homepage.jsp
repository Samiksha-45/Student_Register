<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <style>
        /* Basic body styling */
        body {
            font-family: Times New Roman;
            background-image: url('https://i.pinimg.com/736x/b3/32/f7/b332f73fc8261caf033fdd35b5dd99d2.jpg'); /* Replace with your background image URL */
            display: flex;
            background-size: cover;
            background-position: center;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            
        }

        /* Container styling with blur effect */
        .container {
            background-color: rgba(255, 255, 255, 0.6);
            padding: 50px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 400px;
            text-align: center;
            
        }

        /* Heading styling */
        .container h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 30px;
             text-decoration: underline;
        }

        /* Link styling */
        .container a {
            display: block;
            margin-top: 10px;
            color: #E0ffff;
            font-size: 25px;
            text-decoration: underlined;
        }

        .container a:hover {
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
   
    <h3>${message}</h3>
        <h2>Student Dashboard</h2>

        <!-- Plain links without button styling -->
        <a href="StudentDetailsServlet">Show Student Details</a>
        <a href="DeleteRecordServlet">Delete Record</a>
        <a href="update.jsp">Update Details</a>
        <a href="LogoutServlet">Logout</a>
    </div>
</body>
</html>
