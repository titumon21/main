<%-- 
    Document   : addworkshopprocess
    Created on : 27 Mar, 2022, 11:59:57 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database_AN.DbConnection"%>
<%
    DbConnection db_con = new DbConnection();

    System.out.println("in add hospital page...");

    String name = request.getParameter("name");
    String location = request.getParameter("location");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String lat = request.getParameter("lat");
    String longg = request.getParameter("long");
    String pass = request.getParameter("pass");

    String qry = "INSERT INTO hospital(`name`,`location`,`email`,`phone`,`lat`,`long`,`password`)VALUES('"+name+"','"+location+"','"+email+"','"+phone+"','"+lat+"','"+longg+"','"+pass+"')";
    String qry1="INSERT INTO login(`reg_id`,`email`,`password`,`type`,`status`)VALUES((select max(hid)from hospital),'"+email+"','"+pass+"','HOSPITAL','1')";
    if ((db_con.putData(qry) > 0)&&(db_con.putData(qry1) > 0)) {
        System.out.println("data Added Sucessfully");
%>
<script>
    alert("data Added Sucessfully");
    window.location = "../index.html";

</script>

<%} else {

%>
<script>
    alert("Failed");

    window.location = "../AddHospital.jsp";
</script>
<% }%>