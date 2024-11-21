<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Show Student Details</title>
    <style>
       body {
            font-family: Times New Roman;
            background-color: #f0f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            
            background-image: url('https://i.pinimg.com/736x/b3/32/f7/b332f73fc8261caf033fdd35b5dd99d2.jpg'); 
            /* Replace with your background image URL */
            background-size: cover;
            background-position: center;
       }

       .container {
        font-family: Times New Roman;
            background-color: rgba(255, 255, 255, 0.6);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 400px;
            text-align: center;
            
       }

       h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 1.8em;
            text-decoration: underline;
             font-family: Times New Roman;
       }

       .student-details {
            text-align: left;
            margin-bottom: 20px;
       }

       .detail {
            margin-bottom: 10px;
            font-size: 1em;
            color: #333;
       }

       .detail-label {
            font-weight: bold;
            color: #E0ffff;
             font-family: Times New Roman;
       }

       .detail-value {
            color: #000;
       }

       .back-button {
        font-family: Times New Roman;
            background-color: #4169E1;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 1em;
            border-radius: 7px;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s;
       }

       .back-button:hover {
            background-color: #333;
       }
    </style>
</head>
<body>
    <div class="container">
        <h2>Student Details</h2>

        <%
            ResultSet student = (ResultSet) request.getAttribute("student");

            if (student != null) {
        %>
        <div class="student-details">
            <div class="detail">
                <span class="detail-label">Student ID:</span>
                <span class="detail-value"><%= student.getString("stid") %></span>
            </div>
            <div class="detail">
                <span class="detail-label">Student Name:</span>
                <span class="detail-value"><%= student.getString("username") %></span>
            </div>
            <div class="detail">
                <span class="detail-label">Email:</span>
                <span class="detail-value"><%= student.getString("email") %></span>
            </div>
            <div class="detail">
                <span class="detail-label">Phone No:</span>
                <span class="detail-value"><%= student.getString("phoneno") %></span>
            </div>
        </div>
        <%
            } else {
                out.println("No details available for this student.");
            }
        %>

        <button class="back-button" onclick="location.href='homepage.jsp'">Back to Home</button>
    </div>
</body>
</html>
