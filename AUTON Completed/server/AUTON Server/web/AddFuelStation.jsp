<%-- 
    Document   : AddHospital
    Created on : 27 Mar, 2022, 2:40:51 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp" %>
<!-- inner banner -->
<div class="inner-banner">
    <section class="w3l-breadcrumb">
        <div class="container">
            <h4 class="inner-text-title font-weight-bold mb-2">Add</h4>
            <ul class="breadcrumbs-custom-path">
                <li><a href="index.html">Home</a></li>
                <li class="active"><span class="fa fa-chevron-right mx-2" aria-hidden="true"></span> Add Fuel station</li>
            </ul>
        </div>
    </section>
</div>
<!-- contact -->
<section class="w3l-contact py-5" id="contact">
    <div class="container py-lg-5 py-md-4 py-2">
        <div class="text-center mb-sm-5 mb-4">
            <label class="sub-title mb-2">Get In Touch</label>
            <h3 class="title-big">  Fuel station</h3>
        </div>
        <div class="mx-auto pt-lg-4 pt-md-5 pt-4" style="max-width:1000px">
            <div class="row contact-block">

                <div class="col-md-7 contact-right mt-md-0 mt-4">
                    <form action="./PROCESS/addfuelstationprocess.jsp" method="post" class="signin-form">
                        <div class="input-grids">
                            <input type="text" name="name" id="w3lName" placeholder=" Name"
                                   class="contact-input" required="" />
                            <input type="text" name="oname" id="w3lName" placeholder=" Manager name"
                                   class="contact-input" required="" />
                            <input type="text" name="location" id="w3lName" placeholder="Location"
                                   class="contact-input" required="" />
                            <input type="email" name="email" id="w3lSender" placeholder=" Email"
                                   class="contact-input" required="" />
                             <input type="text" name="dist" id="w3lSender" placeholder=" District"
                                   class="contact-input" required="" />
                            <input type="text"  pattern="[789][0-9]{9}" maxlength="10" name="phone" id="w3lSubect" placeholder="Phone*"
                                   class="contact-input" required="" />
                            <input type="text"  style="width: 200px;" onclick="window.open('https://www.latlong.net/');"name="lat" id="w3lWebsite" placeholder="Latitude"
                                   class="contact-input" required="" /> &nbsp;<input type="text"      style="width: 200px;"name="long" id="w3lWebsite" placeholder="Longitude"
                                   class="contact-input" required="" />
                        </div>
                        <input type="password" name="pass" id="w3lSender" placeholder=" Password"
                               class="contact-input" required="" />

                        <button  name="submit"class="btn button-style">Add</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="Footer.jsp" %>

