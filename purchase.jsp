<%@include file="Header.jsp" %>

<!DOCTYPE html>
<html>
    <head>
      
    </head>
       <%
            
              
         %>
        <table border=".1">
                <tr><th>Purchase</th></tr>
                <tr><td>Order No</td><td>Order Date</td><td>Supplier Name</td><td>For Date</td><td>Grand Total</td></tr>
                <%
                    String sel="select * from tbl_orderhead o,tbl_supplier s where o.sup_id=s.sup_id";
                    ResultSet rs=obj.select(sel);
                    while(rs.next())
                    { %>
                    <tr><td><%= rs.getString("orderh_number")%></td><td><%= rs.getString("orderh_date")%></td><td><%= rs.getString("sup_name")%></td><td><%= rs.getString("orderh_fordate")%></td><td><%= rs.getString("grandtotal")%></td><td><a href="viewpurchase.jsp?eid=<%=rs.getString("orderh_id")%>">Purchase</a></td></tr>
                    <%     
                              }

                     %>
            </table>
    
</html>
