<%@include file="Header.jsp" %>
    <!DOCTYPE html>
    <html>
        <head>
        </head>
        <body>
            <div style="margin-top: 100px"></div>
        <%
                String submit = request.getParameter("btn_submit");
                if (submit != null) {
                    String ad_name = request.getParameter("txt_name");
                    String ad_pswd = request.getParameter("txt_pswd");
                    String sel = "select * from tbl_admin where admin_user='" + ad_name + "' and admin_pswd='" + ad_pswd + "'";
                    String selq = "select * from tbl_staff where staff_user='" + ad_name + "' and staff_pswd='" + ad_pswd + "'";
                    ResultSet rs = obj.select(sel);
                    ResultSet rsq = obj.select(selq);
                    if (rs.next()) {
                        response.sendRedirect("../ADMIN/Header.jsp");
                        out.println("Login Success");

                    } else if (rsq.next()) 
                        {
                           if ((rsq.getString("des_id")).equals("7")) {
                               session.setAttribute("did", rsq.getString("staff_id"));
                               response.sendRedirect("../DOCTOR/HomePage.jsp");  
                           
                        }
                           else if ((rsq.getString("des_id")).equals("8")) {
                                session.setAttribute("rid", rsq.getString("staff_id"));
                                response.sendRedirect("../RECEPTIONIST/HomePage.jsp");
                                
                        }

                        }
                         }
                    %>
        <center><form class="" name="frm1" method="post">
            <input type="hidden" name="hid">
            <table width="">
                <tr><td>User Name</td><td> <input type="text" name="txt_name" id="txt_name"></tr>
                <tr><td>Password</td><td> <input type="password" name="txt_pswd" id="txt_pswd"></tr>
                <tr>
                    <td><input type="submit" id="btn_submit" name="btn_submit" value="Ok" onclick="return fval()"></td>
                    <td><input type="reset" id="btn_reset" class="btn btn-danger" name="btn_reset" value="Cancel"></td>
                </tr>
            </table> 
        </form>
    </center>

</body>
</html>
<%@include file="Footer.jsp" %>