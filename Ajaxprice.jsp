<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>

<%

String sel="select * from tbl_medicine where med_id ='"+request.getParameter("medId") +"'";
ResultSet rs=obj.select(sel);
if(rs.next())
{



%>




        <input type="text" name="pricevalue" readonly="" value="<%=rs.getString("med_price")%>" >
  <%}%>