<%--
  Created by IntelliJ IDEA.
  User: antonruban
  Date: 24.05.17
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html charset=UTF-8" pageEncoding="UTF-8"%>
    <title>Login</title>
</head>
<%request.setCharacterEncoding("UTF-8");%>
<body>

<%


    int col=0;
    String connectionURL2 = "jdbc:postgresql://localhost:5434/TWI_DB";
    Connection con2=null;
    try{

        Class.forName("org.postgresql.Driver").newInstance();
        con2=DriverManager.getConnection(connectionURL2,"postgres","zkap12qG");
        Statement stmt2=con2.createStatement();

        String strQuery2 = "select id_user,email from user_table ";
        ResultSet rs2 = stmt2.executeQuery(strQuery2);


        while(rs2.next())
        {
            col= rs2.getInt(1);
        }
        col++;
        rs2.close();
        con2.close();
        stmt2.close();
    }
    catch(Exception e)
    {
        e.getMessage();
    }


    String name_ = request.getParameter("login");
    String password_ = request.getParameter("password");
    String email_=request.getParameter("email");





        if((!(name_.equals(null) || name_.equals("")) && !(password_.equals(null) || password_.equals(""))) )
        {


            String driverName = "org.postgresql.Driver";
            String connectionUrl = "jdbc:postgresql://localhost:5434/";
            String dbName = "TWI_DB";
            String userId = "postgres";
            String password = "zkap12qG";
            try {
                Class.forName(driverName);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            java.sql.Connection connection = null;
            java.sql.Statement statement = null;
            try {
                connection = DriverManager.getConnection(
                        connectionUrl + dbName, userId, password);
                statement = connection.createStatement();

                String sql = "INSERT INTO user_table (id_user,login,password,email) VALUES('"+ col + "','" + name_ + "','" + password_ + "','" + email_ +"')";
                int flage = statement.executeUpdate(sql);
                response.sendRedirect("login.jsp");
            } catch (Exception e) {
                e.printStackTrace();

                response.sendRedirect("error2.jsp");
            }


        }
        else
        {
%>
<center><p style="color:red">Error In Login</p></center>
<%
            request.getServletContext().getRequestDispatcher("/signUp.jsp").include(request, response);

    }
%>
</body>
</html>


