<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<html>
    <head>
       
    </head>
    <body>
      <%
            String orderHId="";
            
String sel="select ifnull(MAX(orderh_id),1) as orderh_id from tbl_orderhead";

ResultSet rs=obj.select(sel);




if(request.getParameter("did")!=null)
            {
                 String del="delete from tbl_temp where temp_id='"+ request.getParameter("did")  +"'";
                 boolean b1=obj.insert(del);
                    if(b1)
                        {
                         response.sendRedirect("AjaxDel.jsp");
                        }
            }       
         
if(rs.next())
{
    orderHId=rs.getString("orderh_id");
}



             String Med=request.getParameter("ddl_med");
            String MedType=request.getParameter("ddl_medtype");
            String Qty=request.getParameter("txt_med");
            String unitTotal=request.getParameter("txt_settotal");
            String ins="insert into tbl_temp(orderh_id,med_id,orderd_qty,unittotal)values('"+orderHId+"','"+Med+"','"+Qty+"','"+unitTotal+"')";
            boolean b= obj.insert(ins);
            
       
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
                <div id="grand">Grand Total<input type="text" name="gt" value="<%=total%>" readonly="" ></div>
            
            
    </body>
</html>
