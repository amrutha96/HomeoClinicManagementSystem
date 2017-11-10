<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>

    <select id="ddl_med" onchange="getUnitPrice(this .value)" name="ddl_med">
                                     <option>-----select-------</option>
<%
String sel="select  * from tbl_medicine where medtype_id='"+request.getParameter("type_id")+"' and brand_id='"+request.getParameter("brand")+"'      ";
 ResultSet rs2=obj.select(sel);
                                    while(rs2.next())
                                     {%>
                                     <option value="<%=rs2.getString("med_id")%>"     > <%=rs2.getString("med_name")%></option>   
                                     <%  
                                      }
%>
</select>

