<%-- 
    Document   : AjaxDoctorAvailbility
    Created on : Oct 30, 2017, 12:42:46 PM
    Author     : student22
--%>
<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>
<style>
    tr{
      padding: 10px;  
    }
     td{
      padding: 10px;  
    }
    </style>
    
    <table>
        <tr >
            <th>Date</th>
            <th>In Time</th>
            <th>OutTime</th>
        </tr>
       

   
<%

        String txtopnumber=request.getParameter("txtopnumber");
String docId=request.getParameter("docId");
String date=request.getParameter("date");
String sel="select * from tbl_doctorschedule ds,tbl_dayschedule dsh where ds.dayshed_id=dsh.dayshed_id and dsh.dayshed_day='"+date+"' and ds.staff_id='"+docId+"' and ds.status='In'";
ResultSet rs=obj.select(sel);
if(rs.next())
{%>
<tr><td><%=rs.getString("dayshed_day")%></td>
<td><%=rs.getString("docshed_ftime")%></td><td><%=rs.getString("docshed_ttime")%></td>
</tr>
<tr> <td><div id="buttonVisible" ><input type="submit" id="btn_submit" name="btn_submit" value="Book">
        <input type="reset" id="btn_reset" name="btn_reset" value="Cancel">
                         </div></td></tr>
<%}else{
out.print("Doctor Not Available !!!!");

String selq="select * from tbl_doctorschedule ds,tbl_dayschedule dsh where ds.dayshed_id=dsh.dayshed_id and dsh.dayshed_day>=CURDATE() and ds.staff_id='"+docId+"' and ds.status='In'";
ResultSet rsq=obj.select(selq);
while(rsq.next())
{%>
    <tr><td><%=rsq.getString("dayshed_day")%></td>
        <td><%=rsq.getString("docshed_ftime")%></td><td><%=rsq.getString("docshed_ttime")%></td><td><a href="RegisterBooking.jsp?docId=<%=docId%>&txtopnumber=<%=txtopnumber%>&date=<%=rsq.getString("dayshed_day")%>">Book Now</a></td>
</tr>
<%
}}%>
 </table>