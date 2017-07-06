<%--
  Created by IntelliJ IDEA.
  User: antonruban
  Date: 24.05.17
  Time: 20:25
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

        String strQuery2 = "select id_twit,posttext from twit_table ";
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



    String txt_ = request.getParameter("twit");
    if(!txt_.equals(null) || txt_.equals("") )
    {


        String driverName = "org.postgresql.Driver";
        String connectionUrl = "jdbc:postgresql://localhost:5434/";
        String dbName = "TWI_DB";
        String userId = "postgres";
        String password = "zkap12qG";
        String user=session.getAttribute("login").toString();
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

            String sql = "INSERT INTO twit_table (id_twit,id_user,posttext) VALUES('"+ col+ "','" +user+ "','" + txt_ +"')";
            int flage = statement.executeUpdate(sql);
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();

            response.sendRedirect("error3.jsp");
        }


    }
    else
    {
%>
<center><p style="color:red">Error In Login</p></center>
<%
        request.getServletContext().getRequestDispatcher("/postWriter.jsp").include(request, response);

    }
%>
</body>
</html>



