<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>

<%
    
 String del="delete from  tbl_temp  where temp_id='"+request.getParameter("tempid") +"' and orderh_id='"+request.getParameter("ohid") +"'";   
   obj.insert(del);
    %>
    
 <table border=".1">
                <tr><td>Order Head Id</td><td>Medicine</td><td>Quantity</td><td>type</td><td>Delete</td>
                <%int total=0;
                 String sel5="select * from tbl_temp o,tbl_medicine m,tbl_medicinetype mt where o.med_id=m.med_id and m.medtype_id=mt.medtype_id";
                    ResultSet rs3=obj.select(sel5);
                    while(rs3.next())
                    { 
                total=total+rs3.getInt("unittotal");
                
                
                %>
                <tr><td><%= rs3.getString("orderh_id")%></td> <td><%= rs3.getString("med_name")%></td><td><%= rs3.getString("orderd_qty")%></td><td><%= rs3.getString("medtype_type")%></td><td><input type="button" name="btndelete" value="Delete" onclick="del(<%=rs3.getString("temp_id")%>,<%=rs3.getString("orderh_id")%>)"> <tr>
                            <%
                    }

                %>
                       </table> 
                       <div id="grand">Grand Total<%=total%></div>