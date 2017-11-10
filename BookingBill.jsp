<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
              
        <style>
            td,th{text-align: left;
                padding: 10px
            }
         
            
        </style>
        
    </head>
    <body>
        
        <a  href="HomePage.jsp">Home</a>
        
        <form>
            <center>
        <table>
            
        <%
        
        String bookId=request.getParameter("bookId");
        String sel="select * from tbl_booking b,tbl_staff s where b.doctor_id=s.staff_id and  book_id='"+ bookId + "'";
        ResultSet rs=obj.select(sel);
        while(rs.next())
                    { %>
                    <tr><th colspan="4"><h2 style="text-align: center">Booking Receipt</h2></th></tr>
                    <tr><th>Token</th><th>#<%=rs.getString("book_tocken")%></th><th>Date</th><td><%=rs.getString("booking_date")%></td></tr>
                    <tr><th>Book For</th><td><%=rs.getString("book_date")%></td><td></td><td></td></tr>
                    <tr>
                    <th>Doctor Name</th>
                    <td><%=rs.getString("staff_name")%></td><td></td><td></td>
                    </tr><th>OP Number</th><td><%=rs.getString("op_number")%></td><td></td><td></td></tr>
                                     <%     
                              }

                     %>
                                    
        </table>
            </center></form>
    
    </body>
</html>
