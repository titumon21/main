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
    String oname = request.getParameter("oname");
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

    String qry = "IINSERT INTO `service_reg`(`name`,`owner_name`,`address`,`phone`,`district`,`email`,`dateofjoin`,`status`,`f_lat`,`f_long`)VALUES('" + name + "','" + oname + "','" + location + "','" + phone + "','" + email + "','" + ss + "','"+status+"','" + lat + "','" + longg + "','" + pass + "')";
    String qry1 = "INSERT INTO login(`reg_id`,`email`,`password`,`type`,`status`)VALUES((select max(sc_id)from service_reg),'" + email + "','" + pass + "','SERVICE_CENTER','1')";
    if ((db_con.putData(qry) > 0) && (db_con.putData(qry1) > 0)) {
        System.out.println("data Added Sucessfully");
%>
<script>
    

%>
<script>
    alert("Failed");

    window.location = "AddWorkshops.jsp";
</script>
<% }%>