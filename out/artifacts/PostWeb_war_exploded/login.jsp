<%--
  Created by IntelliJ IDEA.
  User: antonruban
  Date: 24.05.17
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en-Us">
<head>

    <meta charset="utf-8">

    <title>Login Twitter</title>
    <link rel="stylesheet" href="styles/login.css"/>
</head>
<body>
<div id="login">
    <h1>Login</h1>
    <form method="post" action="log.jsp">
        <fieldset>
            <p><input type="text" name="login" value="" placeholder="Usrname"></p>
            <p><input type="password" name="password" value="" placeholder="Password"></p>
            <p><input type="submit" value="Login" name="commit" class="btn" ></p>
            <p><input type="submit" name="commit" value="Sign Up" class="btn">
        </fieldset>
    </form>
</div>
</body>
</html>
