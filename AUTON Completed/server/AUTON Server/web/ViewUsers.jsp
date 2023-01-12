<%-- 
    Document   : ViewUsers
    Created on : 27 Mar, 2022, 3:49:34 PM
    Author     : admin
--%>

<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page import="database_AN.DbConnection"%>
<%@include file="Header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- blog section -->
<section class="w3l-blog-sec pt-5">
    <div class="services-layout py-md-4 py-3">
        <div class="container" >
            <div class="text-center mb-sm-5 mb-4">
                <label class="sub-title mb-2">hospitals</label>
                <h3 class="title-big"></h3>
            </div>

            <div class="row justify-content-center">
                <%

                    try {

                        String qrys = "select * from customer_reg ";
                        System.out.println("qry::" + qrys);
                        DbConnection cons = new DbConnection();
                        Iterator is = cons.getData(qrys).iterator();

                        while (is.hasNext()) {
                            Vector v = (Vector) is.next();
                            //    n = v.get(0).toString();
                            //    System.out.println(n);
                %>
                <div class="col-lg-4 col-md-6 column column-img mx-lg-2 mx-3" id="zoomIn">
                    <div class="services-gd">
                        <div class="serve-info">
                            <a href="#blog">
                                <figure>
                                    <img class="img-responsive" style="width:150px;" src="assets/images/userman.png" alt="blog-image">
                                </figure>
                            </a>
                            <h3> <a href="#" class="vv-link"><%=v.get(1)%></a>
                            </h3>
                            <ul class="admin-list">

                                </a></li>
                                <li><a href="#blog"></span><%=v.get(3)%></a></li>
                                <li><a href="#blog"><span class="fa fa-comments icon-color"
                                                          aria-hidden="true"></span>  <%=v.get(4)%></a>
                                </li>
                            </ul>
                            <p>  <%=v.get(2)%>.</p>
                            <p style="   margin-left: 50px;margin-left: 80px;font-family:sans-serif;font-size: 13px;"><b>Joined by:<%=v.get(5)%></b></p>
                        </div>

                    </div>

                </div>



                <%}
                %>
            </div>
            <%    } catch (Exception e) {
                    out.print(e);
                }
            %>
        </div>
    </div>
</section>
<!-- //blog section -->

<%@include file="Footer.jsp" %>
