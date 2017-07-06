<%--
  Created by IntelliJ IDEA.
  User: antonruban
  Date: 24.05.17
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>

<!doctype html>
<html lang="en-Us">
<head>

    <meta charset="utf-8">

    <title>Login Twitter</title>
    <link rel="stylesheet" href="styles/login.css"/>
</head>
<body>

<div id="login">
    <div id="profile-info"> </div>
    <form method="post" action="postTwit.jsp">
        <fieldset>

            <p><input type="text" name="twit" value="" placeholder="Type your post ..."></p>
            <p><input type="submit" name="commit" value="POST" class="btn">
        </fieldset>
    </form>
</div>
</body>
</html>