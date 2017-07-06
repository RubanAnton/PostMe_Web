<%--
  Created by IntelliJ IDEA.
  User: antonruban
  Date: 24.05.17
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
  <title>Ruban_Twitter</title>
  <link rel="stylesheet" href="styles/style.css"/>
  <script type="text/javascript" src="modernizr.js"></script>
  <!--[if lt IE 8]>
  <script src="dist/html5shiv.js"></script>
  <![endif]-->

</head>

<body>

<div class="wrap">
  <header id="main-header">
    <div id="header-right">

      <ul>
        <li><a href="postWriter.jsp"><div id="composeTweet"></div></a></li>
      </ul>
    </div>
    <div class="clear"></div>
  </header>

  <div id="content">
    <div id="content-left">
      <div id="profile-info">
        <div id="height-div"></div>
        <div id="profile-pic"><img src="images/user.png" alt="Ruban profile pic" titkle="Ruban" /></div>
        <div id="name-username">
          <div id="profile-name"><%=session.getAttribute("login")%></div>

        </div>

        <div id="compose-tweet-div">

        </div>
      </div>
    </div>
    <main>
      <header class="box-title">
        Tweets
      </header>
      <div class="hr"></div>
        <%

            String connectionURL = "jdbc:postgresql://localhost:5434/TWI_DB";
            Connection con=null;
            try{

                Class.forName("org.postgresql.Driver").newInstance();
                con=DriverManager.getConnection(connectionURL,"postgres","zkap12qG");
                Statement stmt=con.createStatement();

                String strQuery = "select posttext from twit_table WHERE id_user = '"+session.getAttribute("login").toString()+"'";
                ResultSet rs = stmt.executeQuery(strQuery);


                while(rs.next())
                {


        %>
      <div class="tweet-content">
        <div class="tweet-avatar"><img src="images/user.png" /></div>
        <div class="tweet">
          <div class="from"><a href="#"><%=session.getAttribute("login")%></a> </div>
          <div class="text"><%=rs.getString(1)%></div>
        </div>
        <div class="clear"></div>
        <footer>
          <div class="tweet-options">
            <ul>
              <li><a href="#">Reply</a></li>
              <li><a href="#">Retweet</a></li>
              <li><a href="#">Favorite</a></li>
            </ul>
          </div>
          <div class="clear"></div>
          <div class="hr"></div>
        </footer>
      </div>
        <%  }
            rs.close();
            con.close();
            stmt.close();
            }
            catch(Exception e)
            {
            e.getMessage();

        }

        %>
      </div>
    </main>

    <div class="clear"></div>
  </div>
</div>
</body>
</html>
