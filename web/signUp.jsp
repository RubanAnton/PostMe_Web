<%@ page import="sun.rmi.transport.Connection" %>
<%@ page import="java.beans.Statement" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: antonruban
  Date: 24.05.17
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%request.setCharacterEncoding("UTF-8");%>

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
    <form method="post" action="sign.jsp">
        <fieldset>
            <p><input type="text" name="login" value="" placeholder="Username"></p>
            <p><input type="password" name="password" value="" placeholder="Password"></p>
            <p><input type="text" name="email" value="" placeholder="Email"></p>
            <p><input type="submit" name="commit" value="Sign Up" class="btn">
        </fieldset>
    </form>
</div>
</body>
</html>
