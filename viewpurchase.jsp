<%@include file="Header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        
    </head>
    <body>
        <table border=".1">
                <tr><th>Purchase</th></tr>
                <tr><td>Order Id</td><td>Medicine Name</td><td>Orderd Quantity</td><td>Unit Total</td><td>Purchase Rate</td></tr>
                <%
              
              String sel1="select * from tbl_purchase p,tbl_medicine m,tbl_orderdetails o,tbl_orderhead oh where m.med_id=p.med_id and o.orderh_id=oh.orderh_id";  
              ResultSet rs1=obj.select(sel1); 
              while(rs1.next())
                    { %>
                    <tr><td><%= rs1.getString("purh_id")%></td><td><%= rs1.getString("med_name")%></td><td><%= rs1.getString("ordered_qty")%></td><td><%= rs1.getString("unittotal")%></td><td><%= rs1.getString("rate")%></td></tr>
                    <%     
                              }


     %>
    </table> 
    </body>
</html>
