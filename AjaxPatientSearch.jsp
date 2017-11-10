<%-- 
    Document   : AjaxPatientSearch
    Created on : Nov 4, 2017, 10:11:33 AM
    Author     : student22
--%>
<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>

       
            <%

                String patId = request.getParameter("patId");
                String sel = "select * from tbl_patient where pat_opnumber='" + patId + "'";
                ResultSet rs = obj.select(sel);
                if (rs.next()) {%>
                 <table>
                <tr><td><INPUT TYPE="hidden" name="hidPatId" value="<%=rs.getString("pat_id")%>"></td></tr>
            <tr><td>OpNumber</td><td><%=rs.getString("pat_opnumber")%></td></tr>
            <tr><td>Name</td><td><%=rs.getString("pat_name")%></td></tr>
            <tr><td>Adress</td><td><%=rs.getString("pat_adrs")%></td></tr>
            <tr><td>Phone Number</td><td><%=rs.getString("pat_mob")%></td></tr>
             </table>
            <% } else {
                    out.println("Patient Not Found!!!!");
                }


            %>
       
   
