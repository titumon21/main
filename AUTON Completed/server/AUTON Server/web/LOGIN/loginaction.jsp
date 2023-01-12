<%-- 
    Document   : loginaction.jsp
    Created on : 26 Mar, 2022, 4:23:43 PM
    Author     : admin
--%>

<%@page import="java.util.Iterator"%>
<%@page import="database_AN.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <%
        try{
            DbConnection db_Con = new DbConnection();
            String EMAIL = request.getParameter("email");
            String PSWD = request.getParameter("password");

            String qry = "select * from login where email='" + EMAIL + "'and password='" + PSWD + "' and type='ADMIN' and status='1'";
            System.out.println("qry::" + qry);
            Iterator i = db_Con.getData(qry).iterator();
            if (i.hasNext()) {
//                    response.sendRedirect("../Admin/adminhome.jsp");

        %>
        <script>
            alert("Login Successful");
            window.location = "../index.html";
        </script>
        <%        } else {

        %>
        
        <script>
            alert("Login Failed");
            window.location = "login.html";
        </script><%
        }
        }catch(Exception e){
        
        
        }
        %>