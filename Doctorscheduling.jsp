<%@include file="Header.jsp" %>
    <html>
        <head>
           
            <script>
                function sel(x)
                {
                    if (x == "In") {
                        $("#cons").css("visibility", "visible");
                        $("#consto").css("visibility", "visible");

                    } else
                    {
                        $("#cons").css("visibility", "hidden");
                        $("#consto").css("visibility", "hidden");
                    }
                }

            </script>

        </head>
        <body>
        <%

            String dayshid = "", staffid = "", docshday = "", status = "", schdf = "", schdt = "", sdocshid = "";
            String Editid = "";
            if (request.getParameter("eid") != null) {
                String sel = "select * from tbl_doctorschedule where docshed_id='" + request.getParameter("eid") + "'";
                ResultSet rs = obj.select(sel);
                if (rs.next()) {
                    dayshid = rs.getString("dayshed_id");
                    staffid = rs.getString("staff_id");
                    status = rs.getString("status");
                    schdf = rs.getString("docshed_ftime");
                    schdt = rs.getString("docshed_ttime");

                    Editid = request.getParameter("eid");
                }
            }

            if (request.getParameter("did") != null) {
                String del = "delete from tbl_doctorschedule where docshed_id='" + request.getParameter("did") + "'";
                boolean b = obj.insert(del);
                if (b) {
                    response.sendRedirect("Doctorscheduling.jsp");
                }
            }

            String submit = request.getParameter("btn_submit");
            if (submit != null) {
                String Dayshid = request.getParameter("txt_dayshid");
                String Staffid = request.getParameter("ddl_staffid");
                String Docshday = request.getParameter("txt_docshday");
                String Status = request.getParameter("status");
                String Schdf = request.getParameter("txt_doctf");
                String Schdt = request.getParameter("txt_doctt");

                if (request.getParameter("hid") != "") {
                    String up = "update tbl_doctorschedule set dayshed_id='" + Dayshid + "',staff_id='" + Staffid + "',status='" + Status + "',docshed_ftime='" + Schdf + "',docshed_ttime='" + Schdt + "' where docshed_id='" + request.getParameter("hid") + "'";
                    boolean b = obj.insert(up);
                    if (b == true) {
                        response.sendRedirect("Doctorscheduling.jsp");
                    } else {
                        out.println(up);
                    }
                } else {

                    if (Status.equals("In")) {
                        String ins = "insert into  tbl_doctorschedule(dayshed_id,staff_id,status,docshed_ftime,docshed_ttime)values('" + Dayshid + "','" + Staffid + "','" + Status + "','" + Schdf + "','" + Schdt + "')";
                        boolean b = obj.insert(ins);
                        out.println(ins);
                        if (b) {

                            response.sendRedirect("Doctorscheduling.jsp");

                        }  else
          {
          out.println(b);
          }
                    } else {
                        String ins = "insert into  tbl_doctorschedule(dayshed_id,staff_id,status)values('" + Dayshid + "','" + Staffid + "','" + Status + "')";
                        boolean b = obj.insert(ins);
                        out.println(ins);
                        if (b) {

                            response.sendRedirect("Doctorscheduling.jsp");

                        }  else
          {
          out.println(b);
          }
                    }
                  
                }
            }
        %>

    <center><form>
            <input type="hidden" name="hid" value="<%=Editid%>">
            <table width="">

                <th><u><b>Doctor Scheduling</b></u></th>

                <tr> <td> Day</td><td><select id="txt_dayshid" name="txt_dayshid" required="">
                            <option>------select-----</option>
                            <%
                                String sel = "select * from tbl_dayschedule";
                                ResultSet rs = obj.select(sel);
                            while (rs.next()) {%>
                            <option value="<%=rs.getString("dayshed_id")%>" <% if (dayshid.equals(rs.getString("dayshed_id"))) {%> selected="" <% }%>> <%=rs.getString("dayshed_day")%></option>   
                            <%
                                }
                            %>
                    </td>
                </tr>
                <tr>
                    <td>Doctor</td><td><select id="ddl_staffid" name="ddl_staffid" required="">
                            <option>-----select------</option>
                            <%
                                String sel1 = "select * from tbl_staff s,tbl_designation d where s.des_id=d.des_id and d.des_name='Doctor'";
                                ResultSet rs1 = obj.select(sel1);
                            while (rs1.next()) {%>
                            <option value="<%=rs1.getString("staff_id")%>" <% if (staffid.equals(rs1.getString("staff_id"))) {%> selected="" <% }%>> <%=rs1.getString("staff_name")%></option>   
                            <%
                                }
                            %> </td>
                </tr>
                <tr>
                    <td>Status</td><td><input type="radio" name="status" <% if (status.equals("In")) {%> checked=""<% }%> value="In" id="status" onclick="sel(this.value)">In</td>
                    <td><input type="radio" id="gen" name="status" <% if (status.equals("Out")) {%> checked=""<% }%> value="Out" onclick="sel(this.value)">Out</td>

                </tr>

                <tr>
                    <td> <div id="cons" style="visibility:hidden">Doctor schedule from Time<input type="time"     id="txt_doctf" name="txt_doctf" ><%=schdf%></div></td>
                </tr>
                <tr>
                    <td> <div id="consto" style="visibility:hidden">Doctor schedule To Time<input type="time"   id="txt_doctt" name="txt_doctt" ><%=schdt%></div></td>
                </tr>
                <tr>
                    <td><input type="submit" id="btn_submit" name="btn_submit" value="Ok"></td>
                    <td><input type="reset" id="btn_reset" name="btn_reset" value="Cancel"></td>
                </tr>
            </table>
            <table border=".1">
                <tr><th>View  Scheduled Details</th><tr><td>Day Scheduling</td><td>Doctor's Name</td><td>Status</td><td>From time</td><td>To time</td><td>Edit</td><td>Delete</td></tr>
                        <%
                            String sel5 = "select * from  tbl_doctorschedule  dc,tbl_dayschedule ds ,tbl_staff s where dc.dayshed_id=ds.dayshed_id and dc.staff_id=s.staff_id";
                            ResultSet rs5 = obj.select(sel5);
                            while (rs5.next()) {%>
                <tr><td><%= rs5.getString("dayshed_day")%></td><td><%= rs5.getString("staff_name")%></td><td><%= rs5.getString("status")%></td><td><%= rs5.getString("docshed_ftime")%></td><td><%= rs5.getString("docshed_ttime")%></td><td><a href="Doctorscheduling.jsp?eid=<%= rs5.getString("docshed_id")%>">Edit</a></td><td><a href="Doctorscheduling.jsp?did=<%= rs5.getString("docshed_id")%>">Delete</a></td></tr>

                <%
                    }

                %>
            </table>
        </form>
    </center>

</body>
</html>
