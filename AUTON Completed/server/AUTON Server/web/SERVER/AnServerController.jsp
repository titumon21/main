<%-- 
    Document   : AnServerController
    Created on : 27 Mar, 2022, 7:23:23 PM
    Author     : admin
--%>



<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="database_AN.DbConnection"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%
    DbConnection conn = new DbConnection();
    String key = request.getParameter("key").trim();
    System.out.println(key);

    //    ---------Customer_Registration-------
    if (key.equals("customer_register")) {
        String NAME = request.getParameter("c_name");
        String ADDRESS = request.getParameter("c_address");
        String PHONE = request.getParameter("c_phone");
        String EMAIL = request.getParameter("c_email");
        String PASSWORD = request.getParameter("c_pswd");
        String DOJ = request.getParameter("c_doj");

        String insertqry = "SELECT COUNT(*) AS COUNT FROM `customer_reg` WHERE email='" + EMAIL + "' OR phone='" + PHONE + "'";
//          String insertqry="SELECT *  FROM `server` WHERE email='aji@gmail.com'";
        System.out.println(insertqry);
        Iterator it = conn.getData(insertqry).iterator();
        if (it.hasNext()) {
            Vector v = (Vector) it.next();
            int max_vid = Integer.parseInt(v.get(0).toString());
            System.out.println(max_vid);

            if (max_vid == 0) {

                String qry = "INSERT INTO customer_reg(name, address, phone, email, dateofjoin ) VALUES ('" + NAME + "', '" + ADDRESS + "', '" + PHONE + "', '" + EMAIL + "', '" + DOJ + "')";
                String qry1 = "INSERT INTO login(reg_id,email,password,type,status) VALUES((select max(c_id)from customer_reg),'" + EMAIL + "','" + PASSWORD + "','CUSTOMER','1')";
                System.out.println(qry + "\n" + qry1);
                if (conn.putData(qry) > 0 && conn.putData(qry1) > 0) {

                    System.out.println("Registered");
                    out.println("Registered");
                } else {

                    System.out.println("Registertion Failed");
                    out.println("Registertion Failed");
                }

            } else {

                System.out.println("Already Exist");
                out.print("Already Exist");

            }
        } else {
            out.print("failed");
        }
    }

    //    ---------fuelstation_register-------
    if (key.equals("fuelstation_register")) {
        String NAME = request.getParameter("d_name");
        String OWNER = request.getParameter("d_ownername");
        String ADDRESS = request.getParameter("d_address");
        String PHONE = request.getParameter("d_phone");
        String EMAIL = request.getParameter("d_email");
        String PASSWORD = request.getParameter("d_pswd");
        String DISTRICT = request.getParameter("d_dst");
        String DOJ = request.getParameter("d_doj");
        String FLAT = request.getParameter("p_lat");
        String FLONG = request.getParameter("p_long");

        String insertqry = "SELECT COUNT(*) AS COUNT FROM `fuel_station_reg` WHERE email='" + EMAIL.trim() + "' OR phone='" + PHONE.trim() + "'";
//          String insertqry="SELECT *  FROM `server` WHERE email='aji@gmail.com'";
        System.out.println(insertqry);
        Iterator it = conn.getData(insertqry).iterator();
        if (it.hasNext()) {
            Vector v = (Vector) it.next();
            int max_vid = Integer.parseInt(v.get(0).toString());
            System.out.println(max_vid);

            if (max_vid == 0) {

                String qry = "INSERT INTO `fuel_station_reg`(name, owner_name, address, phone, email, district, dateofjoin, f_lat, f_long ) VALUES ('" + NAME + "', '" + OWNER + "', '" + ADDRESS + "', '" + PHONE + "', '" + EMAIL + "', '" + DISTRICT + "', '" + DOJ + "', '" + FLAT + "', '" + FLONG + "')";
                String qry1 = "INSERT INTO login(reg_id,email,password,type,status) VALUES((select max(fs_id)from `fuel_station_reg`),'" + EMAIL + "','" + PASSWORD + "','FUEL_STATION', '0')";

                System.out.println(qry + "\n" + qry1);
                if (conn.putData(qry) > 0 && conn.putData(qry1) > 0) {

                    System.out.println("Registered");
                    out.println("Registered");
                } else {

                    System.out.println("Registertion Failed");
                    out.println("Registertion Failed");
                }

            } else {

                System.out.println("Already Exist");
                out.print("Already Exist");

            }
        } else {
            out.print("failed");
        }
    }

    // -------------- Accessory shop --------------------------
    if (key.equals("accessoryshop_register")) {
        String NAME = request.getParameter("d_name");
        String OWNER = request.getParameter("d_ownername");
        String ADDRESS = request.getParameter("d_address");
        String PHONE = request.getParameter("d_phone");
        String EMAIL = request.getParameter("d_email");
        String PASSWORD = request.getParameter("d_pswd");
        String DISTRICT = request.getParameter("d_dst");
        String DOJ = request.getParameter("d_doj");
        String FLAT = request.getParameter("p_lat");
        String FLONG = request.getParameter("p_long");

        String insertqry = "SELECT COUNT(*) FROM `accessory_shop` WHERE email='" + EMAIL.trim() + "' OR phone='" + PHONE.trim() + "'";
//          String insertqry="SELECT *  FROM `server` WHERE email='aji@gmail.com'";
        System.out.println(insertqry);
        Iterator it = conn.getData(insertqry).iterator();
        if (it.hasNext()) {
            Vector v = (Vector) it.next();
            int max_vid = Integer.parseInt(v.get(0).toString());
            System.out.println(max_vid);

            if (max_vid == 0) {

                String qry = "INSERT INTO `accessory_shop`(name, owner_name, address, phone, email, district, dateofjoin, a_lat, a_long ) VALUES ('" + NAME + "', '" + OWNER + "', '" + ADDRESS + "', '" + PHONE + "', '" + EMAIL + "', '" + DISTRICT + "', '" + DOJ + "', '" + FLAT + "', '" + FLONG + "')";
                String qry1 = "INSERT INTO login(reg_id,email,password,type,status) VALUES((select max(as_id)from `accessory_shop`),'" + EMAIL + "','" + PASSWORD + "','SHOP', '1')";

                System.out.println(qry + "\n" + qry1);
                if (conn.putData(qry) > 0 && conn.putData(qry1) > 0) {

                    System.out.println("Registered");
                    out.println("Registered");
                } else {

                    System.out.println("Registertion Failed");
                    out.println("Registertion Failed");
                }

            } else {

                System.out.println("Already Exist");
                out.print("Already Exist");

            }
        } else {
            out.print("failed");
        }
    }

    //    ---------service_center_register-------
    if (key.equals("service_center_register")) {
        String NAME = request.getParameter("d_name");
        String OWNER = request.getParameter("d_ownername");
        String ADDRESS = request.getParameter("d_address");
        String PHONE = request.getParameter("d_phone");
        String EMAIL = request.getParameter("d_email");
        String PASSWORD = request.getParameter("d_pswd");
        String DISTRICT = request.getParameter("d_dst");
        String DOJ = request.getParameter("d_doj");
        String FLAT = request.getParameter("p_lat");
        String FLONG = request.getParameter("p_long");

        String insertqry = "SELECT COUNT(*) AS COUNT FROM `service_reg` WHERE email='" + EMAIL.trim() + "' OR phone='" + PHONE.trim() + "'";
//          String insertqry="SELECT *  FROM `server` WHERE email='aji@gmail.com'";
        System.out.println(insertqry);
        Iterator it = conn.getData(insertqry).iterator();
        if (it.hasNext()) {
            Vector v = (Vector) it.next();
            int max_vid = Integer.parseInt(v.get(0).toString());
            System.out.println(max_vid);

            if (max_vid == 0) {

                String qry = "INSERT INTO `service_reg`(name, owner_name, address, phone, email, district, dateofjoin, f_lat, f_long ) VALUES ('" + NAME + "', '" + OWNER + "', '" + ADDRESS + "', '" + PHONE + "', '" + EMAIL + "', '" + DISTRICT + "', '" + DOJ + "', '" + FLAT + "', '" + FLONG + "')";
                String qry1 = "INSERT INTO login(reg_id,email,password,type,status) VALUES((select max(sc_id)from `service_reg`),'" + EMAIL + "','" + PASSWORD + "','SERVICE_CENTER', '0')";

                System.out.println(qry + "\n" + qry1);
                if (conn.putData(qry) > 0 && conn.putData(qry1) > 0) {

                    System.out.println("Registered");
                    out.println("Registered");
                } else {

                    System.out.println("Registertion Failed");
                    out.println("Registertion Failed");
                }

            } else {

                System.out.println("Already Exist");
                out.print("Already Exist");

            }
        } else {
            out.print("failed");
        }
    }

    //    ---------Login-------
    if (key.trim().equals("login")) {

        String USERNAME = request.getParameter("U_name");
        String PASSWORD = request.getParameter("P_swd");

        String loginQry = "SELECT * FROM login WHERE email='" + USERNAME + "' AND password='" + PASSWORD + "' AND status='1'";
        System.out.println(loginQry);
        Iterator i = conn.getData(loginQry).iterator();

        if (i.hasNext()) {

            Vector v = (Vector) i.next();

            out.println(v.get(1) + "#" + v.get(4));

        } else {
            out.println("failed");

        }

    }

//    ---------------------viewFuelStationRqst--------------------- 
    if (key.equals("viewFuelStationRqst")) {
        String FID = request.getParameter("s_lid").trim();
        String qry = "SELECT * FROM `fuel_station_reg` fs, `login` l WHERE l.`reg_id` = fs.`fs_id` AND l.`status` = '0'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("sr_id", v.get(0).toString().trim());
                obj.put("s_name", v.get(1).toString().trim());
                obj.put("s_owner", v.get(2).toString().trim());
                obj.put("s_address", v.get(3).toString().trim());
                obj.put("s_phone", v.get(4).toString().trim());
                obj.put("s_district", v.get(5).toString().trim());
                obj.put("s_email", v.get(6).toString().trim());
                obj.put("s_doj", v.get(7).toString().trim());
                obj.put("s_status", v.get(8).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

    //    ---------------------viewServiceCenterRqst--------------------- 
    if (key.equals("viewServiceCenterRqst")) {
        String FID = request.getParameter("s_lid").trim();
        String qry = "SELECT * FROM `service_reg` sc, `login` l WHERE l.`reg_id` = sc.`sc_id` AND l.`status` = '0'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("sr_id", v.get(0).toString().trim());
                obj.put("s_name", v.get(1).toString().trim());
                obj.put("s_owner", v.get(2).toString().trim());
                obj.put("s_address", v.get(3).toString().trim());
                obj.put("s_phone", v.get(4).toString().trim());
                obj.put("s_district", v.get(5).toString().trim());
                obj.put("s_email", v.get(6).toString().trim());
                obj.put("s_doj", v.get(7).toString().trim());
                obj.put("s_status", v.get(8).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

    //    ---------deleteRequest-------
    if (key.equals("deleteRequest")) {
        String UID = request.getParameter("u_id");
        String RQSTID = request.getParameter("rqst_id");

        String str = "UPDATE `login` SET `status`='2' WHERE `reg_id`='" + RQSTID + "'";
        String str1 = "UPDATE `fuel_station_reg` SET `status`='REJECTED' WHERE `fs_id`='" + RQSTID + "'";
        if (conn.putData(str) > 0 && conn.putData(str1) > 0) {
            out.print("success");
        } else {
            out.print("failed");
        }

    }

    //    ---------deleteServiceRequest-------
    if (key.equals("deleteServiceRequest")) {
        String UID = request.getParameter("u_id");
        String RQSTID = request.getParameter("rqst_id");

        String str = "UPDATE `login` SET `status`='2' WHERE `reg_id`='" + RQSTID + "'";
        String str1 = "UPDATE `service_reg` SET `status`='REJECTED' WHERE `sc_id`='" + RQSTID + "'";
        if (conn.putData(str) > 0 && conn.putData(str1) > 0) {
            out.print("success");
        } else {
            out.print("failed");
        }

    }

    //    ---------approveRequest-------
    if (key.equals("approveRequest")) {
        String UID = request.getParameter("u_id");
        String RQSTID = request.getParameter("rqst_id");

        String str = "UPDATE `login` SET `status`='1' WHERE `reg_id`='" + RQSTID + "'";
        String str1 = "UPDATE `fuel_station_reg` SET `status`='APPROVED' WHERE `fs_id`='" + RQSTID + "'";
        if (conn.putData(str) > 0 && conn.putData(str1) > 0) {
            out.print("success");
        } else {
            out.print("failed");
        }

    }

    //    ---------approveServiceRequest-------
    if (key.equals("approveServiceRequest")) {
        String UID = request.getParameter("u_id");
        String RQSTID = request.getParameter("rqst_id");

        String str = "UPDATE `login` SET `status`='1' WHERE `reg_id`='" + RQSTID + "'";
        String str1 = "UPDATE `service_reg` SET `status`='APPROVED' WHERE `sc_id`='" + RQSTID + "'";
        if (conn.putData(str) > 0 && conn.putData(str1) > 0) {
            out.print("success");
        } else {
            out.print("failed");
        }

    }

//    ---------------------viewFuelStation--------------------- 
    if (key.equals("viewFuelStation")) {
        String SID = request.getParameter("fs_id").trim();
        String qry = "SELECT * FROM `fuel_station_reg` WHERE `status` = 'APPROVED'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("sr_id", v.get(0).toString().trim());
                obj.put("s_name", v.get(1).toString().trim());
                obj.put("s_owner", v.get(2).toString().trim());
                obj.put("s_address", v.get(3).toString().trim());
                obj.put("s_phone", v.get(4).toString().trim());
                obj.put("s_district", v.get(5).toString().trim());
                obj.put("s_email", v.get(6).toString().trim());
                obj.put("s_doj", v.get(7).toString().trim());
                obj.put("s_status", v.get(8).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

    //    ---------------------viewSeviceCenter--------------------- 
    if (key.equals("viewSeviceCenter")) {
        String SID = request.getParameter("fs_id").trim();
        String qry = "SELECT * FROM `service_reg` WHERE `status` = 'APPROVED'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("sr_id", v.get(0).toString().trim());
                obj.put("s_name", v.get(1).toString().trim());
                obj.put("s_owner", v.get(2).toString().trim());
                obj.put("s_address", v.get(3).toString().trim());
                obj.put("s_phone", v.get(4).toString().trim());
                obj.put("s_district", v.get(5).toString().trim());
                obj.put("s_email", v.get(6).toString().trim());
                obj.put("s_doj", v.get(7).toString().trim());
                obj.put("s_status", v.get(8).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

//    ---------------------viewUsers--------------------- 
    if (key.equals("viewUsers")) {
        String SID = request.getParameter("u_lid").trim();
        String qry = "SELECT * FROM `customer_reg` WHERE `status` = 'APPROVED'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("c_id", v.get(0).toString().trim());
                obj.put("c_name", v.get(1).toString().trim());
                obj.put("c_address", v.get(2).toString().trim());
                obj.put("c_phone", v.get(3).toString().trim());
                obj.put("c_email", v.get(4).toString().trim());
                obj.put("c_doj", v.get(5).toString().trim());
                obj.put("rqstStatus", "");
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

    //    ---------------------getFuelStationUser--------------------- 
    if (key.equals("getFuelStationUser")) {
        String SID = request.getParameter("p_lid").trim();
        String qry = "SELECT * FROM `fuel_station_reg` WHERE `status` = 'APPROVED'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("sr_id", v.get(0).toString().trim());
                obj.put("s_name", v.get(1).toString().trim());
                obj.put("s_owner", v.get(2).toString().trim());
                obj.put("s_address", v.get(3).toString().trim());
                obj.put("s_phone", v.get(4).toString().trim());
                obj.put("s_district", v.get(5).toString().trim());
                obj.put("s_email", v.get(6).toString().trim());
                obj.put("s_doj", v.get(7).toString().trim());
                obj.put("s_status", v.get(8).toString().trim());
                obj.put("p_lat", v.get(9).toString().trim());
                obj.put("p_long", v.get(10).toString().trim());
                obj.put("rqstStatus", "");

                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

    //    ---------------------getServiceCenterUser--------------------- 
    if (key.equals("getServiceCenterUser")) {
        String SID = request.getParameter("p_lid").trim();
        String qry = "SELECT * FROM `service_reg` WHERE `status` = 'APPROVED'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("sr_id", v.get(0).toString().trim());
                obj.put("s_name", v.get(1).toString().trim());
                obj.put("s_owner", v.get(2).toString().trim());
                obj.put("s_address", v.get(3).toString().trim());
                obj.put("s_phone", v.get(4).toString().trim());
                obj.put("s_district", v.get(5).toString().trim());
                obj.put("s_email", v.get(6).toString().trim());
                obj.put("s_doj", v.get(7).toString().trim());
                obj.put("s_status", v.get(8).toString().trim());
                obj.put("p_lat", v.get(9).toString().trim());
                obj.put("p_long", v.get(10).toString().trim());
                obj.put("rqstStatus", "");

                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

    //    ---------------------getNearByServices--------------------- 
    if (key.equals("getNearByServices")) {
        String SID = request.getParameter("p_lid").trim();
        String qry = "SELECT * FROM `fuel_station_reg` WHERE `status` = 'APPROVED'";
        String qry1 = "SELECT * FROM `service_reg` WHERE `status` = 'APPROVED'";
        String qry2 = "SELECT * FROM hospital";

        System.out.println("qry=" + qry);
        System.out.println("qry=" + qry1);
        System.out.println("qry=" + qry2);

        JSONArray array = new JSONArray();
        JSONArray array1 = new JSONArray();
        JSONArray array2 = new JSONArray();

        Iterator it = conn.getData(qry).iterator();
        Iterator it1 = conn.getData(qry1).iterator();
        Iterator it2 = conn.getData(qry2).iterator();

        if (it.hasNext() || it1.hasNext() || it2.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("sr_id", v.get(0).toString().trim());
                obj.put("s_name", v.get(1).toString().trim());
                obj.put("s_owner", v.get(2).toString().trim());
                obj.put("s_address", v.get(3).toString().trim());
                obj.put("s_phone", v.get(4).toString().trim());
                obj.put("s_district", v.get(5).toString().trim());
                obj.put("s_email", v.get(6).toString().trim());
                obj.put("s_doj", v.get(7).toString().trim());
                obj.put("s_status", v.get(8).toString().trim());
                obj.put("p_lat", v.get(9).toString().trim());
                obj.put("p_long", v.get(10).toString().trim());
                obj.put("rqstStatus", "");
                obj.put("serviceType", "FUEL_STATION");

                array.add(obj);
            }

            while (it1.hasNext()) {
                Vector v = (Vector) it1.next();
                JSONObject obj = new JSONObject();
                obj.put("sr_id", v.get(0).toString().trim());
                obj.put("s_name", v.get(1).toString().trim());
                obj.put("s_owner", v.get(2).toString().trim());
                obj.put("s_address", v.get(3).toString().trim());
                obj.put("s_phone", v.get(4).toString().trim());
                obj.put("s_district", v.get(5).toString().trim());
                obj.put("s_email", v.get(6).toString().trim());
                obj.put("s_doj", v.get(7).toString().trim());
                obj.put("s_status", v.get(8).toString().trim());
                obj.put("p_lat", v.get(9).toString().trim());
                obj.put("p_long", v.get(10).toString().trim());
                obj.put("rqstStatus", "");
                obj.put("serviceType", "SERVICE_CENTER");

                array1.add(obj);
            }

            while (it2.hasNext()) {
                Vector v = (Vector) it2.next();
                JSONObject obj = new JSONObject();
                obj.put("h_id", v.get(0).toString().trim());
                obj.put("h_name", v.get(1).toString().trim());
                obj.put("h_location", v.get(2).toString().trim());
                obj.put("h_email", v.get(3).toString().trim());
                obj.put("h_phone", v.get(4).toString().trim());
                obj.put("h_lat", v.get(5).toString().trim());
                obj.put("h_long", v.get(6).toString().trim());
                obj.put("serviceType", "HOSPITAL");
                array2.add(obj);
            }

            out.println(array + "#" + array1 + "#" + array2);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

    //    ---------addAppointment-------
    if (key.equals("addAppointment")) {
        String UID = request.getParameter("u_id").trim();
        String SID = request.getParameter("s_id").trim();
        String FUEL = request.getParameter("fuel").trim();
        String DOJ = request.getParameter("p_doj").trim();
        String LAT = request.getParameter("rqstLat").trim();
        String LONG = request.getParameter("rqstLong").trim();

        String str = "INSERT INTO `fuel_request` (`c_id`, `fs_id`, `fuel` ,`rqst_time`, `status`, rqst_lat, rqst_long) VALUES('" + UID + "', '" + SID + "', '" + FUEL + "', '" + DOJ + "', 'REQUESTED', '" + LAT + "', '" + LONG + "')";
        System.out.println(str);
        if (conn.putData(str) > 0) {
            out.print("success");
        } else {
            out.print("failed");
        }
    }

    //    ---------addServiceAppointment-------
    if (key.equals("addServiceAppointment")) {
        String UID = request.getParameter("u_id").trim();
        String SID = request.getParameter("s_id").trim();
        String DESC = request.getParameter("desc").trim();
        String DOJ = request.getParameter("p_doj").trim();
        String LAT = request.getParameter("rqstLat").trim();
        String LONG = request.getParameter("rqstLong").trim();

        String str = "INSERT INTO `service_center_request` (`c_id`, `sc_id`, `desc` ,`rqst_time`, `status`, rqst_lat, rqst_long) VALUES('" + UID + "', '" + SID + "', '" + DESC + "', '" + DOJ + "', 'REQUESTED', '" + LAT + "', '" + LONG + "')";
        System.out.println(str);
        if (conn.putData(str) > 0) {
            out.print("success");
        } else {
            out.print("failed");
        }
    }

    //    ---------getAppointmentsStation-------
    if (key.equals("getAppointmentsStation")) {
        String SID = request.getParameter("s_id").trim();
        String qry = "SELECT c.*, fr.`c_rqst_id`, fr.`fuel`, fr.`status`, fr.`rqst_time`, fr.`rqst_lat`, fr.`rqst_long` FROM `fuel_request` fr, `fuel_station_reg` fs, `customer_reg` c WHERE fr.`c_id` = c.`c_id` AND fr.`fs_id` = fs.`fs_id` AND fr.`status` = 'REQUESTED' AND fr.`fs_id` = '" + SID + "'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("c_id", v.get(0).toString().trim());
                obj.put("c_name", v.get(1).toString().trim());
                obj.put("c_address", v.get(2).toString().trim());
                obj.put("c_phone", v.get(3).toString().trim());
                obj.put("c_email", v.get(4).toString().trim());
                obj.put("c_doj", v.get(5).toString().trim());
                obj.put("rqstStatus", v.get(9).toString().trim());
                obj.put("c_rqst_id", v.get(7).toString().trim());
                obj.put("fuelRqstd", v.get(8).toString().trim());
                obj.put("rqst_time", v.get(10).toString().trim());
                obj.put("rqst_lat", v.get(11).toString().trim());
                obj.put("rqst_long", v.get(12).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

//    ---------getAppointmentsUser-------
    if (key.equals("getAppointmentsUser")) {
        String UID = request.getParameter("u_id").trim();
        String qry = "SELECT fs.*, fr.* FROM `fuel_request` fr, `fuel_station_reg` fs, `customer_reg` c WHERE fr.`c_id` = c.`c_id` AND fr.`fs_id` = fs.`fs_id` AND fr.`status` = 'REQUESTED' AND fr.`c_id` = '" + UID + "'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("sr_id", v.get(0).toString().trim());
                obj.put("s_name", v.get(1).toString().trim());
                obj.put("s_owner", v.get(2).toString().trim());
                obj.put("s_address", v.get(3).toString().trim());
                obj.put("s_phone", v.get(4).toString().trim());
                obj.put("s_district", v.get(5).toString().trim());
                obj.put("s_email", v.get(6).toString().trim());
                obj.put("s_doj", v.get(7).toString().trim());
                obj.put("s_status", v.get(8).toString().trim());
                obj.put("p_lat", v.get(9).toString().trim());
                obj.put("p_long", v.get(10).toString().trim());
                obj.put("c_rqst_id", v.get(11).toString().trim());
                obj.put("fuelRqstd", v.get(14).toString().trim());
                obj.put("rqstStatus", v.get(16).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

    //    ---------getServiceAppointmentsUser-------
    if (key.equals("getServiceAppointmentsUser")) {
        String UID = request.getParameter("u_id").trim();
        String qry = "SELECT sr.*, scr.* FROM `service_center_request` scr, `service_reg` sr, `customer_reg` c WHERE scr.`c_id` = c.`c_id` AND scr.`sc_id` = sr.`sc_id` AND scr.`status` = 'REQUESTED' AND scr.`c_id` = '" + UID + "'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("sr_id", v.get(0).toString().trim());
                obj.put("s_name", v.get(1).toString().trim());
                obj.put("s_owner", v.get(2).toString().trim());
                obj.put("s_address", v.get(3).toString().trim());
                obj.put("s_phone", v.get(4).toString().trim());
                obj.put("s_district", v.get(5).toString().trim());
                obj.put("s_email", v.get(6).toString().trim());
                obj.put("s_doj", v.get(7).toString().trim());
                obj.put("s_status", v.get(8).toString().trim());
                obj.put("p_lat", v.get(9).toString().trim());
                obj.put("p_long", v.get(10).toString().trim());
                obj.put("c_rqst_id", v.get(11).toString().trim());
                obj.put("fuelRqstd", v.get(14).toString().trim());
                obj.put("rqstStatus", v.get(16).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

//    ---------------------addFeedBack--------------------- 
    if (key.equals("addFeedBack")) {
        String sub = request.getParameter("subject");
        String desc = request.getParameter("description");
        String uid = request.getParameter("uid");
        String type = request.getParameter("type");

        String qry = "INSERT INTO `feedback` (`uid`,`subject`,`description`,`status`, `type` ) VALUES (" + uid + ",'" + sub + "','" + desc + "','0', '" + type + "') ";
        System.out.println(qry);
        if (conn.putData(qry) > 0) {

            out.print("successful");
        } else {
            out.print("failed");
        }
    }

    //    ---------deleteUserAppointment-------
    if (key.equals("deleteUserAppointment")) {
        String UID = request.getParameter("u_id");
        String RQSTID = request.getParameter("rqst_id");

        String str = "UPDATE `fuel_request` SET `status`='REJECTED' WHERE `c_rqst_id`='" + RQSTID + "'";
        if (conn.putData(str) > 0) {
            out.print("success");
        } else {
            out.print("failed");
        }

    }

    //    ---------approveUserAppointment-------
    if (key.equals("approveUserAppointment")) {
        String UID = request.getParameter("u_id").trim();
        String RQSTID = request.getParameter("rqst_id").trim();
        String PRICE = request.getParameter("fuel_price").trim();

        String str = "UPDATE `fuel_request` SET `status`='APPROVED', station_rate='" + PRICE + "' WHERE `c_rqst_id`='" + RQSTID + "'";
        if (conn.putData(str) > 0) {
            out.print("success");
        } else {
            out.print("failed");
        }

    }

//    ---------------------addFeedBackSeller--------------------- 
    if (key.equals("addFeedBackSeller")) {
        String sub = request.getParameter("subject");
        String desc = request.getParameter("description");
        String uid = request.getParameter("uid");
        String type = request.getParameter("type");

        String qry = "INSERT INTO `feedback` (`uid`,`subject`,`description`,`status` ,`type`) VALUES (" + uid + ",'" + sub + "','" + desc + "','0', '" + type + "') ";
        System.out.println(qry);
        if (conn.putData(qry) > 0) {

            out.print("successful");
        } else {
            out.print("failed");
        }
    }

    //    ---------getApprovedAppointmentsStation-------
    if (key.equals("getApprovedAppointmentsStation")) {
        String SID = request.getParameter("s_id").trim();
        String qry = "SELECT c.*, fr.`c_rqst_id`, fr.`fuel`, fr.`status`, fr.`rqst_time` FROM `fuel_request` fr, `fuel_station_reg` fs, `customer_reg` c WHERE fr.`c_id` = c.`c_id` AND fr.`fs_id` = fs.`fs_id` AND fr.`status` = 'APPROVED' AND fr.`fs_id` = '" + SID + "'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("c_id", v.get(0).toString().trim());
                obj.put("c_name", v.get(1).toString().trim());
                obj.put("c_address", v.get(2).toString().trim());
                obj.put("c_phone", v.get(3).toString().trim());
                obj.put("c_email", v.get(4).toString().trim());
                obj.put("c_doj", v.get(5).toString().trim());
                obj.put("rqstStatus", v.get(9).toString().trim());
                obj.put("c_rqst_id", v.get(7).toString().trim());
                obj.put("fuelRqstd", v.get(8).toString().trim());
                obj.put("rqst_time", v.get(10).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

    //    ---------getPaidAppointmentsStation-------
    if (key.equals("getPaidAppointmentsStation")) {
        String SID = request.getParameter("s_id").trim();
        String qry = "SELECT c.*, fr.`c_rqst_id`, fr.`fuel`, fr.`status`, fr.`rqst_time` FROM `fuel_request` fr, `fuel_station_reg` fs, `customer_reg` c WHERE fr.`c_id` = c.`c_id` AND fr.`fs_id` = fs.`fs_id` AND fr.`status` = 'PAID' AND fr.`fs_id` = '" + SID + "'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("c_id", v.get(0).toString().trim());
                obj.put("c_name", v.get(1).toString().trim());
                obj.put("c_address", v.get(2).toString().trim());
                obj.put("c_phone", v.get(3).toString().trim());
                obj.put("c_email", v.get(4).toString().trim());
                obj.put("c_doj", v.get(5).toString().trim());
                obj.put("rqstStatus", v.get(9).toString().trim());
                obj.put("c_rqst_id", v.get(7).toString().trim());
                obj.put("fuelRqstd", v.get(8).toString().trim());
                obj.put("rqst_time", v.get(10).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

    //    ---------getApprovedAppointmentsUser-------
    if (key.equals("getApprovedAppointmentsUser")) {
        String UID = request.getParameter("u_id").trim();
        String qry = "SELECT fs.*, fr.* FROM `fuel_request` fr, `fuel_station_reg` fs, `customer_reg` c WHERE fr.`c_id` = c.`c_id` AND fr.`fs_id` = fs.`fs_id` AND fr.`status` = 'APPROVED' AND fr.`c_id` = '" + UID + "'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("sr_id", v.get(0).toString().trim());
                obj.put("s_name", v.get(1).toString().trim());
                obj.put("s_owner", v.get(2).toString().trim());
                obj.put("s_address", v.get(3).toString().trim());
                obj.put("s_phone", v.get(4).toString().trim());
                obj.put("s_district", v.get(5).toString().trim());
                obj.put("s_email", v.get(6).toString().trim());
                obj.put("s_doj", v.get(7).toString().trim());
                obj.put("s_status", v.get(8).toString().trim());
                obj.put("p_lat", v.get(9).toString().trim());
                obj.put("p_long", v.get(10).toString().trim());
                obj.put("c_rqst_id", v.get(11).toString().trim());
                obj.put("fuelRqstd", v.get(14).toString().trim());
                obj.put("rqstStatus", v.get(16).toString().trim());
                obj.put("station_rate", v.get(17).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

    //    ---------getApprovedServiceCenterAppointmentsUser-------
    if (key.equals("getApprovedServiceCenterAppointmentsUser")) {
        String UID = request.getParameter("u_id").trim();
        String qry = "SELECT sr.*, scr.* FROM `service_center_request` scr, `service_reg` sr, `customer_reg` c WHERE scr.`c_id` = c.`c_id` AND scr.`sc_id` = sr.`sc_id` AND scr.`status` = 'APPROVED' AND scr.`c_id`='" + UID + "'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("sr_id", v.get(0).toString().trim());
                obj.put("s_name", v.get(1).toString().trim());
                obj.put("s_owner", v.get(2).toString().trim());
                obj.put("s_address", v.get(3).toString().trim());
                obj.put("s_phone", v.get(4).toString().trim());
                obj.put("s_district", v.get(5).toString().trim());
                obj.put("s_email", v.get(6).toString().trim());
                obj.put("s_doj", v.get(7).toString().trim());
                obj.put("s_status", v.get(8).toString().trim());
                obj.put("p_lat", v.get(9).toString().trim());
                obj.put("p_long", v.get(10).toString().trim());
                obj.put("c_rqst_id", v.get(11).toString().trim());
                obj.put("fuelRqstd", v.get(14).toString().trim());
                obj.put("rqstStatus", v.get(16).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

    //    ---------getPaidAppointmentsUser-------
    if (key.equals("getPaidAppointmentsUser")) {
        String UID = request.getParameter("u_id").trim();
        String qry = "SELECT fs.*, fr.* FROM `fuel_request` fr, `fuel_station_reg` fs, `customer_reg` c WHERE fr.`c_id` = c.`c_id` AND fr.`fs_id` = fs.`fs_id` AND fr.`status` = 'PAID' AND fr.`c_id` = '" + UID + "'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("sr_id", v.get(0).toString().trim());
                obj.put("s_name", v.get(1).toString().trim());
                obj.put("s_owner", v.get(2).toString().trim());
                obj.put("s_address", v.get(3).toString().trim());
                obj.put("s_phone", v.get(4).toString().trim());
                obj.put("s_district", v.get(5).toString().trim());
                obj.put("s_email", v.get(6).toString().trim());
                obj.put("s_doj", v.get(7).toString().trim());
                obj.put("s_status", v.get(8).toString().trim());
                obj.put("p_lat", v.get(9).toString().trim());
                obj.put("p_long", v.get(10).toString().trim());
                obj.put("c_rqst_id", v.get(11).toString().trim());
                obj.put("fuelRqstd", v.get(14).toString().trim());
                obj.put("rqstStatus", v.get(16).toString().trim());
                obj.put("station_rate", v.get(17).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

//    ---------getFeedbackUser-------
    if (key.equals("getFeedbackUser")) {
        String UID = request.getParameter("p_lid").trim();
        String TYPE = request.getParameter("type").trim();
        String qry = "SELECT f.*, c.`name` FROM `customer_reg` c, `feedback` f WHERE f.`uid`=c.`c_id` AND f.`type`='CUSTOMER'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("fid", v.get(0).toString().trim());
                obj.put("uid", v.get(1).toString().trim());
                obj.put("subject", v.get(2).toString().trim());
                obj.put("description", v.get(3).toString().trim());
                obj.put("status", v.get(4).toString().trim());
                obj.put("type", v.get(5).toString().trim());
                obj.put("name", v.get(6).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

//    ---------getFeedbackSeller-------
    if (key.equals("getFeedbackSeller")) {
        String UID = request.getParameter("p_lid").trim();
        String TYPE = request.getParameter("type").trim();
        String qry = "SELECT f.*, fs.`name` FROM `fuel_station_reg` fs, `feedback` f WHERE f.`uid`=fs.`fs_id` AND f.`type`='FUEL_STATION'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("fid", v.get(0).toString().trim());
                obj.put("uid", v.get(1).toString().trim());
                obj.put("subject", v.get(2).toString().trim());
                obj.put("description", v.get(3).toString().trim());
                obj.put("status", v.get(4).toString().trim());
                obj.put("type", v.get(5).toString().trim());
                obj.put("name", v.get(6).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

//-------------------------------------------------------------------------------------
//    ---------------------ADD BANK---------------------    
    if (key.equals("newaccount")) {

        String result = "";
        System.out.println("Haiiiiiiiiiiiiii");
        String uid = request.getParameter("uid").toString().trim();

        System.out.println(uid);
        String pin = request.getParameter("pin").toString().trim();
        System.out.println(pin);

        String accno = request.getParameter("cardnum").toString().trim();
        String cvv = request.getParameter("cvv").toString();
        String balance = request.getParameter("balance").toString().trim();

        System.out.println(uid + " " + pin + " " + accno + " " + cvv + " " + balance);

        String checkqry = "SELECT * FROM `bank` WHERE `u_id`='" + uid + "'";

        String str = " INSERT INTO `bank` (`u_id`,`card_no`,`cvv_no`,`pin`,`balance`,`status`) "
                + "VALUES ('" + uid + "','" + accno + "','" + cvv + "','" + pin + "','" + balance + "','1')";

        System.out.println(str);

        Iterator itr = conn.getData(checkqry).iterator();
        if (itr.hasNext()) {

            System.out.println(checkqry);
            out.println("accountexists");

            String str3 = "UPDATE `bank` SET `balance`='" + balance + "', `card_no`='" + accno + "' , `cvv_no`='" + cvv + "' , `pin`='" + pin + "' WHERE u_id='" + uid + "'";
            if (conn.putData(str3) > 0) {
                out.println("success");
            } else {
                out.println("failed");
            }

        } else {
            if (conn.putData(str) > 0) {

                out.print("success");
                System.out.println("success");
            } else {

                out.println("failed");
            }
        }
    }

    //    ---------------------GET BANK---------------------  
    if (key.equals("getACcountDetails")) {
        String result = "";
        String uid = request.getParameter("uid").toString().trim();
        String qry = "SELECT * FROM `bank` WHERE `u_id`='" + uid + "'";
        System.out.println("qry  " + qry);
        Iterator itr = conn.getData(qry).iterator();
        if (itr.hasNext()) {
            Vector v = (Vector) itr.next();

            result = v.get(0) + "#" + v.get(1) + "#" + v.get(2) + "#" + v.get(3) + "#" + v.get(4) + "#" + v.get(5);
            out.println(result);
        } else {
            out.println("failed");
        }

    }

    //    ---------------------MAKE PAYMENT---------------------  
    if (key.equals("makepayment")) {
        String uid = request.getParameter("user_id").toString();
        String tot = request.getParameter("amt").toString();
        String req_id = request.getParameter("req_Id").trim().toString();
        String b_id = request.getParameter("b_id").toString();
        String bal = request.getParameter("bal").toString();
        String date = java.time.LocalDate.now().toString();
        String type = request.getParameter("type").toString();

        double balance = Double.parseDouble(bal);
        double total = Double.parseDouble(tot);
        double new_balance = balance - total;
        System.out.println(total);
        String str1 = "update bank set balance = '" + new_balance + "' where b_id='" + b_id + "'";
        System.out.println(str1);

        String str2 = "UPDATE `fuel_request` SET `status` = 'PAID' WHERE `c_rqst_id` = '" + req_id + "'";
        System.out.println(str2);

        if (conn.putData(str1) > 0 && conn.putData(str2) > 0) {
            out.println("successfull");
        } else {
            out.println("failed");

        }

    }

//    ---------------------CHECK ACCOUNT---------------------  
    if (key.equals("accountCheck")) {
        String uid = request.getParameter("uid").toString().trim();
        String str1 = "select count(*) from bank where u_id = '" + uid + "'";
        System.out.println(str1);
        Iterator itr = conn.getData(str1).iterator();
        if (itr.hasNext()) {
            Vector v = (Vector) itr.next();
            int max_vid = Integer.parseInt(v.get(0).toString());
            System.out.println(max_vid);

            if (max_vid == 0) {
                System.out.println("abcd");
                out.println("Add Your Account Details");

            } else {
                String str = "SELECT * FROM bank where u_id = '" + uid + "'";
                System.out.println(str);
                String respo = "";
                Iterator itr1 = conn.getData(str).iterator();
                if (itr1.hasNext()) {
                    Vector vv = (Vector) itr1.next();
//                    Integer deposit = Integer.parseInt(vv.get(5).toString());
//                    System.out.println(deposit);
//                    Integer total = Integer.parseInt(totalcash);

                    out.println("failed");

                    respo = vv.get(0) + "#" + vv.get(2) + "#" + vv.get(3) + "#" + vv.get(4) + "#" + vv.get(5);
                    out.println(respo);

                } else {
                    out.println("failed");
                }
            }

        }
    }

//---------------    add mechanic  ---------------
    if (key.equals("addMechanic")) {
        String uid = request.getParameter("uid");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String qry = "INSERT INTO `mechanic`(`service_center`,`name`,`phone`,`email`,`password`)VALUES('" + uid + "','" + name + "','" + phone + "','" + email + "','" + password + "') ";
        String qry1 = "INSERT INTO login(reg_id,email,password,type,status) VALUES((select max(mid)from `mechanic`),'" + email + "','" + password + "','MECHANIC', '1')";
        System.out.println(qry);
        System.out.println(qry1);
        if ((conn.putData(qry) > 0) && (conn.putData(qry1) > 0)) {

            out.print("successful");
        } else {
            out.print("failed");
        }
    }

//------------------- view Mechanic  -----------------------
    if (key.equals("viewMechanic")) {
        String SID = request.getParameter("u_lid").trim();
        String qry = "SELECT * FROM `mechanic` WHERE `service_center`='" + SID + "'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("mid", v.get(0).toString().trim());
                obj.put("s_id", v.get(1).toString().trim());
                obj.put("mech_name", v.get(2).toString().trim());
                obj.put("mech_phone", v.get(3).toString().trim());
                obj.put("mech_email", v.get(4).toString().trim());
                obj.put("mech_status", v.get(6).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }
    //    ---------getAppointmentsStation-------
    if (key.equals("getAppointmentsService")) {
        String SID = request.getParameter("s_id").trim();
        String qry = "SELECT c.*,sr.`c_rqst_id`,sr.desc,sr.status,sr.rqst_time,sr.rqst_lat,sr.rqst_long FROM `service_center_request` sr, `service_reg` ss,`customer_reg` c WHERE sr.`c_id` = c.`c_id` AND sr.sc_id=ss.sc_id AND sr.status='REQUESTED' AND sr.sc_id='" + SID + "'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("c_id", v.get(0).toString().trim());
                obj.put("c_name", v.get(1).toString().trim());
                obj.put("c_address", v.get(2).toString().trim());
                obj.put("c_phone", v.get(3).toString().trim());
                obj.put("c_email", v.get(4).toString().trim());
                obj.put("c_doj", v.get(5).toString().trim());
                obj.put("rqstStatus", v.get(9).toString().trim());
                obj.put("c_rqst_id", v.get(7).toString().trim());
                obj.put("desc", v.get(8).toString().trim());
                obj.put("rqst_time", v.get(10).toString().trim());
                obj.put("rqst_lat", v.get(11).toString().trim());
                obj.put("rqst_long", v.get(12).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }
// -----------------------  add accessories -----------------
    if (key.equals("addProduct")) {
        String UID = request.getParameter("uid").trim();
        String CATEGORY = request.getParameter("pcat");
        String PRONAME = request.getParameter("p_name");
        String DESCRIPTION = request.getParameter("p_desc");
        String PRICE = request.getParameter("p_price");
        String BASE = request.getParameter("base_string");

        String str = "insert into `product`(`s_id`,`p_name`,`p_description`,`p_price`,`product_image`) values('" + UID + "','" + PRONAME + "','" + DESCRIPTION + "','" + PRICE + "','" + BASE + "')";
        System.out.println(str);
        if (conn.putData(str) > 0) {
            out.print("success");
        } else {
            out.print("failed");
        }

    }
    //---------------- view accessories ----------

    if (key.equals("getProduct")) {
        String PID = request.getParameter("p_lid").trim();
        String qry = "SELECT p.* FROM `product` p, `accessory_shop` a WHERE p.`s_id`=a.as_id AND p.s_id='" + PID + "'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("p_id", v.get(0).toString().trim());
                obj.put("s_id", v.get(1).toString().trim());
                obj.put("product_name", v.get(3).toString().trim());
                obj.put("product_description", v.get(4).toString().trim());
                obj.put("product_price", v.get(5).toString().trim());
                obj.put("product_image", v.get(6).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }
    //    ---------delete Accessory-------
    if (key.equals("deleteProduct")) {
        String UID = request.getParameter("u_id");
        String PID = request.getParameter("p_id");

        String str = "DELETE FROM `product` WHERE `s_id`='" + UID + "' AND `p_id`='" + PID + "'";
        if (conn.putData(str) > 0) {
            out.print("success");
        } else {
            out.print("failed");
        }

    }
    //    ---------update Accessory-------
    if (key.equals("updateProduct")) {
        String UID = request.getParameter("uid");
        String PID = request.getParameter("pid");
        String PRONAME = request.getParameter("p_name");
        String DESCRIPTION = request.getParameter("p_desc");
        String PRICE = request.getParameter("p_price");
        String BASE = request.getParameter("base_string");

        String str = "UPDATE `product` SET `p_name`='" + PRONAME + "', `p_description`='" + DESCRIPTION + "', `p_price`='" + PRICE + "', `product_image`='" + BASE + "' WHERE `s_id`='" + UID + "' AND `p_id`='" + PID + "'";
        if (conn.putData(str) > 0) {
            out.print("success");
        } else {
            out.print("failed");
        }

    }
    //-----------   view accessories => user  --------------------
    if (key.equals("viewCustomerProduct")) {
        String PID = request.getParameter("p_lid").trim();
        String qry = "SELECT * FROM `product`";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("p_id", v.get(0).toString().trim());
                obj.put("s_id", v.get(1).toString().trim());
                obj.put("product_name", v.get(3).toString().trim());
                obj.put("product_description", v.get(4).toString().trim());
                obj.put("product_price", v.get(5).toString().trim());
                obj.put("product_image", v.get(6).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

    //    ---------addCart-------
    if (key.equals("addCart")) {
        String UID = request.getParameter("uid").trim();
        String PID = request.getParameter("p_id").trim();
        String FID = request.getParameter("fid").trim();
        String COUNT = request.getParameter("quantity");
        String RATE = request.getParameter("rate").trim();
        String DATE = request.getParameter("doj");
        Integer rate = Integer.parseInt(RATE);
        Integer quan = Integer.parseInt(COUNT);
        Integer total = rate * quan;
        System.out.println(RATE);
//        String str2 = "select pay_id from cart where user_id = '" + UID + "' and status='not paid'";
        String str2 = "SELECT c.pay_id , p.`s_id` FROM cart c,`product` p  WHERE c.`pro_id`=p.`p_id` AND  c.user_id = '" + UID + "' AND STATUS='not paid'";
        System.out.println(str2);
        Iterator it2 = conn.getData(str2).iterator();

        if (it2.hasNext()) {
            String pay_id = "", f_id;
            Vector v1 = (Vector) it2.next();
            pay_id = v1.get(0).toString();
            f_id = v1.get(1).toString();

            if (!f_id.trim().equals(FID)) {

                out.print("Choose Same Shop");
            } else {

                String str = "insert into cart(user_id,pro_id,pay_id,quantity,posted_date,amount) values('" + UID + "','" + PID + "','" + pay_id + "','" + COUNT + "','" + DATE + "','" + total + "')";
                System.out.println(str);
                if (conn.putData(str) > 0) {
                    out.print("success");
                } else {
                    out.print("failed");
                }
            }
        } else {
            String str4 = "insert into payment(`u_id`,`posted_date`) values('" + UID + "','" + DATE + "')";
            String str5 = "insert into cart(user_id,pro_id,pay_id,quantity,posted_date,amount) values('" + UID + "','" + PID + "',(select max(p_id) from payment),'" + COUNT + "','" + DATE + "','" + total + "')";
            if (conn.putData(str4) > 0 && conn.putData(str5) > 0) {
                System.out.println("Successfull");
                out.println("Successfull");
            } else {
                out.println("failed");
            }
        }
    }
    //    ---------viewCart-------
    if (key.equals("viewCart")) {
        String UID = request.getParameter("uid").trim();
        String qry = "SELECT * FROM `cart` c, `product` p WHERE c.`pro_id`=p.`p_id` AND c.`user_id`='" + UID + "' AND c.`status`='not paid'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("cart_id", v.get(0).toString().trim());
                obj.put("user_id", v.get(1).toString().trim());
                obj.put("pro_id", v.get(2).toString().trim());
                obj.put("pay_id", v.get(3).toString().trim());
                obj.put("quantity", v.get(4).toString().trim());
                obj.put("posted_date", v.get(5).toString().trim());
                obj.put("amount", v.get(6).toString().trim());
                obj.put("status", v.get(7).toString().trim());
                obj.put("product_name", v.get(11).toString().trim());
                obj.put("product_price", v.get(13).toString().trim());
                obj.put("product_image", v.get(14).toString().trim());
                array.add(obj);
            }
            System.out.println("pay id" + array);
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }
//    ---------------------MAKE PAYMENT---------------------  
    if (key.equals("MAKEPAY")) {
        String uid = request.getParameter("user_id").toString();
        String tot = request.getParameter("amt").toString();
        String pay_id = request.getParameter("pay_id").trim().toString();
        String b_id = request.getParameter("b_id").toString();
        String bal = request.getParameter("bal").toString();
        String date = java.time.LocalDate.now().toString();
        String type = request.getParameter("type").toString();

        Double balance = Double.parseDouble(bal);
        Double total = Double.parseDouble(tot);
        Double new_balance = balance - total;

        String str1 = "update bank set balance = '" + balance.toString() + "' where b_id='" + b_id + "'";
        System.out.println(str1);

        String str2 = "update payment set total_amount = '" + total + "',status='paid' where p_id='" + pay_id + "'";
        System.out.println(str2);

        String str3 = "update cart set status='paid' where pay_id='" + pay_id + "' and user_id = '" + uid + "'";
        System.out.println(str3);

        if (conn.putData(str1) > 0 && conn.putData(str2) > 0 && conn.putData(str3) > 0) {
            out.println("successfull");
        } else {
            out.println("failed");

        }

    }
// --------- mechanic view own appointments---------------------------
    if (key.equals("getmechanicappointments")) {
        String uid = request.getParameter("s_id").trim();
        String qry = "SELECT m.`service_center`,`scr`.* FROM `mechanic` m,`service_center_request` scr WHERE m.`service_center`=scr.sc_id AND m.`mid`='" + uid + "' and scr.status='REQUESTED'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("scenter", v.get(0).toString().trim());
                obj.put("c_id", v.get(2).toString().trim());
                obj.put("sc_id", v.get(3).toString().trim());
                obj.put("desc", v.get(4).toString().trim());
                obj.put("rqstStatus", v.get(6).toString().trim());
                obj.put("c_rqst_id", v.get(1).toString().trim());
                obj.put("rqst_time", v.get(5).toString().trim());
                obj.put("rqst_lat", v.get(7).toString().trim());
                obj.put("rqst_long", v.get(8).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

    if (key.equals("getmechanicApprovedappointments")) {
        String uid = request.getParameter("s_id").trim();
        String qry = "SELECT m.`service_center`,`scr`.* FROM `mechanic` m,`service_center_request` scr WHERE m.`service_center`=scr.sc_id AND m.`mid`='" + uid + "' and scr.status='APPROVED'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("scenter", v.get(0).toString().trim());
                obj.put("c_id", v.get(2).toString().trim());
                obj.put("sc_id", v.get(3).toString().trim());
                obj.put("desc", v.get(4).toString().trim());
                obj.put("rqstStatus", v.get(6).toString().trim());
                obj.put("c_rqst_id", v.get(1).toString().trim());
                obj.put("rqst_time", v.get(5).toString().trim());
                obj.put("rqst_lat", v.get(7).toString().trim());
                obj.put("rqst_long", v.get(8).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

    //   ------------------  mech solved works ---------------------------------------
    if (key.equals("getmechanicsolvedappointments")) {
        String uid = request.getParameter("s_id").trim();
        String qry = "SELECT m.`service_center`,`scr`.* FROM `mechanic` m,`service_center_request` scr WHERE m.`service_center`=scr.sc_id AND m.`mid`='" + uid + "' and scr.status='SOLVED'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("scenter", v.get(0).toString().trim());
                obj.put("c_id", v.get(2).toString().trim());
                obj.put("sc_id", v.get(3).toString().trim());
                obj.put("desc", v.get(4).toString().trim());
                obj.put("rqstStatus", v.get(6).toString().trim());
                obj.put("c_rqst_id", v.get(1).toString().trim());
                obj.put("rqst_time", v.get(5).toString().trim());
                obj.put("rqst_lat", v.get(7).toString().trim());
                obj.put("rqst_long", v.get(8).toString().trim());
                array.add(obj);
            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

    // ---------- mechanaic approve work ---------------
    //    ---------approveUserAppointment-------
    if (key.equals("mech_approve_request")) {
        String UID = request.getParameter("u_id").trim();
        String RQSTID = request.getParameter("rqst_id").trim();

        String str = "UPDATE `service_center_request` SET `status`='APPROVED' ,mechanic_id='" + UID + "' WHERE `c_rqst_id`='" + RQSTID + "'";
        if (conn.putData(str) > 0) {
            out.print("success");
        } else {
            out.print("failed");
        }

    }
    if (key.equals("mech_solve_request")) {
        String UID = request.getParameter("u_id").trim();
        String RQSTID = request.getParameter("rqst_id").trim();

        String str = "UPDATE `service_center_request` SET `status`='SOLVED' ,mechanic_id='" + UID + "' WHERE `c_rqst_id`='" + RQSTID + "'";
        if (conn.putData(str) > 0) {
            out.print("success");
        } else {
            out.print("failed");
        }

    }

    if (key.equals("serviceviewallwork")) {
        String uid = request.getParameter("s_id").trim();
        String qry = "SELECT m.*,sr.* FROM mechanic m ,`service_center_request` sr WHERE  m.mid=sr.mechanic_id AND sr.sc_id='37' AND  sr.`status`='APPROVED'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("mid", v.get(0).toString().trim());
                obj.put("sc_center", v.get(1).toString().trim());
                obj.put("name", v.get(2).toString().trim());
                obj.put("phone", v.get(3).toString().trim());
                obj.put("email", v.get(4).toString().trim());
                obj.put("status", v.get(5).toString().trim());
                obj.put("c_rqst_id", v.get(8).toString().trim());
                obj.put("c_id", v.get(9).toString().trim());
                obj.put("sc_id", v.get(10).toString().trim());
                obj.put("desc", v.get(11).toString().trim());
                obj.put("rqst_time", v.get(12).toString().trim());
                obj.put("ostatus", v.get(13).toString().trim());
                obj.put("mechanic_id", v.get(16).toString().trim());
                array.add(obj);

            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }
    if (key.equals("serviceviewallsolvedwork")) {
        String uid = request.getParameter("s_id").trim();
        String qry = "SELECT m.*,sr.* FROM mechanic m ,`service_center_request` sr WHERE  m.mid=sr.mechanic_id AND sr.sc_id='37' AND  sr.`status`='SOLVED'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("mid", v.get(0).toString().trim());
                obj.put("sc_center", v.get(1).toString().trim());
                obj.put("name", v.get(2).toString().trim());
                obj.put("phone", v.get(3).toString().trim());
                obj.put("email", v.get(4).toString().trim());
                obj.put("status", v.get(5).toString().trim());
                obj.put("c_rqst_id", v.get(8).toString().trim());
                obj.put("c_id", v.get(9).toString().trim());
                obj.put("sc_id", v.get(10).toString().trim());
                obj.put("desc", v.get(11).toString().trim());
                obj.put("rqst_time", v.get(12).toString().trim());
                obj.put("ostatus", v.get(13).toString().trim());
                obj.put("mechanic_id", v.get(16).toString().trim());
                array.add(obj);

            }
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }
//------------------- userbookings ----------------------------------------------
    if (key.equals("userbookings")) {
        String UID = request.getParameter("u_id").trim();
        String qry = "SELECT * FROM `cart` c, `product` p WHERE c.`pro_id`=p.`p_id` AND c.`user_id`='" + UID + "' AND c.`status`='paid'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("cart_id", v.get(0).toString().trim());
                obj.put("user_id", v.get(1).toString().trim());
                obj.put("pro_id", v.get(2).toString().trim());
                obj.put("pay_id", v.get(3).toString().trim());
                obj.put("quantity", v.get(4).toString().trim());
                obj.put("posted_date", v.get(5).toString().trim());
                obj.put("amount", v.get(6).toString().trim());
                obj.put("status", v.get(7).toString().trim());
                obj.put("product_name", v.get(11).toString().trim());
                obj.put("product_price", v.get(13).toString().trim());
                obj.put("product_image", v.get(14).toString().trim());
                array.add(obj);
            }
            
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }

//---------  shop view bookings ----------------------------------------------------

    if (key.equals("shopbookings")) {
        String UID = request.getParameter("u_id").trim();
        String qry = "SELECT  `p`.*,`cr`.*,c.* FROM product p, customer_reg cr,cart c WHERE c.`user_id`=cr.`c_id` AND p.`s_id`='"+UID+"' AND p.`p_id`=c.`pro_id` AND c.`status`='paid'";
        System.out.println("qry=" + qry);
        JSONArray array = new JSONArray();
        Iterator it = conn.getData(qry).iterator();
        if (it.hasNext()) {
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                JSONObject obj = new JSONObject();
                obj.put("p_id", v.get(0).toString().trim());
                obj.put("s_id", v.get(1).toString().trim());
                obj.put("p_name", v.get(3).toString().trim());
                obj.put("p_desc", v.get(4).toString().trim());
                obj.put("p_price", v.get(5).toString().trim());
                obj.put("p_image", v.get(6).toString().trim());
                obj.put("c_id", v.get(7).toString().trim());
                obj.put("name", v.get(8).toString().trim());
                obj.put("address", v.get(9).toString().trim());
                obj.put("phone", v.get(10).toString().trim());
                obj.put("email", v.get(11).toString().trim());
                obj.put("dateofjoin", v.get(19).toString().trim());
                obj.put("status", v.get(21).toString().trim());
                array.add(obj);
            }
            
            out.println(array);
        } else {
            System.out.println("else id");
            out.print("failed");
        }
    }
%>
