<%--
  Created by IntelliJ IDEA.
  User: antonruban
  Date: 24.05.17
  Time: 17:36
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
<%!
    String userdbName;
    String userdbPsw;
%>
<%
    Connection con= null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String driverName = "org.postgresql.Driver";
    String url = "jdbc:postgresql://localhost:5434/TWI_DB";
    String user = "postgres";
    String dbpsw = "zkap12qG";

    String sql = "select * from user_table where login=? and password=? ";



    if(request.getParameter("commit").equals("Sign Up")){response.sendRedirect("signUp.jsp");}
    else{String name_ = request.getParameter("login");
        String password_ = request.getParameter("password");
        if((!(name_.equals(null) || name_.equals("")) && !(password_.equals(null) || password_.equals(""))) )
        {
            try{
                Class.forName(driverName);
                con = DriverManager.getConnection(url, user, dbpsw);
                ps = con.prepareStatement(sql);
                ps.setString(1, name_);
                ps.setString(2, password_);

                rs = ps.executeQuery();
                if(rs.next())
                {
                    userdbName = rs.getString("login");
                    userdbPsw = rs.getString("password");

                    if(name_.equals(userdbName) && password_.equals(userdbPsw) )
                    {
                        session.setAttribute("login",userdbName);

                        response.sendRedirect("index.jsp");
                    }
                }
                else
                    response.sendRedirect("error.jsp");
                rs.close();
                ps.close();
            }
            catch(SQLException sqe)
            {
                out.println(sqe);
            }
        }
        else
        {
%>
<center><p style="color:red">Error In Login</p></center>
<%
            request.getServletContext().getRequestDispatcher("/login.jsp").include(request, response);
        }
    }
%>
</body>
</html>

