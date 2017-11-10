<%@include file="Header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
   
    <body>
        <%

            String dayschedday = "",doctshedf="",doctshedt="", dayschedid = "";
            String Editid = "";
            if (request.getParameter("eid") != null) {
                String sel = "select * from tbl_dayschedule where dayshed_id='" + request.getParameter("eid") + "'";
                ResultSet rs = obj.select(sel);
                if (rs.next()) {
                    dayschedday= rs.getString("dayshed_day");
                     doctshedf= rs.getString("docshed_ftime");
                      doctshedt= rs.getString("docshed_ttime");
                    Editid = request.getParameter("eid");
                }
            }

            if (request.getParameter("did") != null) {
                String del = "delete from tbl_dayschedule where dayshed_id='" + request.getParameter("did") + "'";
               boolean b=obj.insert(del);
                if (b) {
                    response.sendRedirect("Dayschedule.jsp");
                }
            }

            String submit = request.getParameter("btn_submit");
            if (submit != null) {
                String Dayschedday = request.getParameter("txt_dayschedule");
                String Doctf = request.getParameter("txt_doctf");
                String Doctt = request.getParameter("txt_doctt");
                
                
                if (request.getParameter("hid") != "") {
                    String up = "update tbl_dayschedule set dayshed_day='" + Dayschedday + "',docshed_ftime='"+Doctf+"', docshed_ttime='"+Doctt+"' where dayshed_id='" + request.getParameter("hid") + "'";
                    boolean b = obj.insert(up);
                    if (b == true) {
                        response.sendRedirect("Dayschedule.jsp");
                    } else {
                        out.println(up);
                    }
                } else {
                    String ins ="insert into tbl_dayschedule(dayshed_day,docshed_ftime,docshed_ttime)values('"+Dayschedday+"','"+Doctf+"','"+Doctt+"')";
                    boolean b = obj.insert(ins);
                       out.println(ins);
                    if (b) {

                        response.sendRedirect("Dayschedule.jsp");

                    } else {
                        out.println(b);
                    }
                }
            }
        %>

    <center><form name="frm1" method="">
            <input type="hidden" name="hid" value="<%=Editid%>">
            <table width="">

                <th><u><b>DAY SCHEDULING</b></u></th>
                <tr>
                    <td>Day scheduled day</td><td><input type="date"  value="<%=dayschedday%>"   id="dayschedday" name="txt_dayschedule" ></td>
                </tr>
                 <tr>
                     <td>Doctor schedule from Time</td><td><input type="time"  value="<%=doctshedf%>"   id="doctshedf" name="txt_doctf" ></td>
                </tr>
                  <tr>
                      <td>Doctor schedule To Time</td><td><input type="time"  value="<%=doctshedt%>"   id="doctshedt" name="txt_doctt" ></td>
                </tr>
                <tr>
                    <td><input type="submit" id="btn_submit" name="btn_submit" value="Ok"></td>
                    <td><input type="reset" id="btn_reset" name="btn_reset" value="Cancel"</td>
                </tr>
            </table>
            <table border=".1">
                <tr><th>View the Day Schedule</th></tr>
                        <%
                            String sel = "select * from tbl_dayschedule";
                            ResultSet rs = obj.select(sel);
                            while (rs.next()) {%>
                <tr><td><%= rs.getString("dayshed_day")%></td><td><%= rs.getString("docshed_ftime")%></td><td><td><%= rs.getString("docshed_ttime")%></td><td><a href="Dayschedule.jsp?eid=<%= rs.getString("dayshed_id")%>">Edit</a> <td><a href="Dayschedule.jsp?did=<%= rs.getString("dayshed_id")%>">Delete</a></td></td></tr>

                <%
                    }

                %>
            </table>
        </form>
    </center>

    </body>
</html>
