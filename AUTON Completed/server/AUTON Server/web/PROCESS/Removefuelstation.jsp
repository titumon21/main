<%-- 
    Document   : RemoveWorkshop
    Created on : 27 Mar, 2022, 2:00:50 PM
    Author     : admin
--%>

<%@page import="java.util.Iterator"%>
<%@page import="database_AN.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
        DbConnection db_Con = new DbConnection();
        String ID = request.getParameter("id");
        String qry = " DELETE  FROM `fuel_station` WHERE `fid`= '" + ID + "' ";
    if (db_Con.putData(qry) > 0) {
        System.out.println("data Added Sucessfully");
%>
<script>
    alert(" Sucessful");
    window.location = "../index.html";

</script>

<%} else {

%>
<script>
    alert("Failed");

    window.location = "ViewWorkshops.jsp";
</script>
<% }%>