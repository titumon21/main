<%-- 
    Document   : addworkshopprocess
    Created on : 27 Mar, 2022, 11:59:57 AM
    Author     : admin
--%>

<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database_AN.DbConnection"%>
<%
    DbConnection db_con = new DbConnection();

    System.out.println("in add workshop page...");

    String name = request.getParameter("name");
    String mname = request.getParameter("oname");
    String location = request.getParameter("location");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String lat = request.getParameter("lat");
    String longg = request.getParameter("long");
    String pass = request.getParameter("pass");
      String dist = request.getParameter("dist");
    LocalDate lof = LocalDate.now();
    String ss = String.valueOf(lof);
    String status ="APPROVED";

    String qry = "INSERT INTO`fuel_station_reg`(`name`,`owner_name`,`address`,`phone`,`district`,`email`,`dateofjoin`,`status`,`f_lat`,`f_long`)VALUES('"+name+"','"+mname+"','"+location+"','"+phone+"','"+dist+"','"+email+"','"+ss+"','"+lat+"','"+longg+"','"+pass+"')";
    String qry1="INSERT INTO `login`(`uid`,`email`,`password`,`type`,`status`)VALUES((select max(fid)from fuel_station),'"+email+"','"+pass+"','FUEL_STATION','1')";
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

    window.location = "AddFuelStation.jsp";
</script>
<% }%>