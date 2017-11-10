<%-- 
    Document   : AjaxRemove
    Created on : Nov 6, 2017, 11:37:54 AM
    Author     : student22
--%>
<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>
       <%
       
       
       if(request.getParameter("id")!=null)
        {
            String del="delete from tbl_temppresciption where tempPresciption_id='"+ request.getParameter("id")  +"'";
           boolean b= obj.insert(del);
           if(b)
           {
             %><table border=".1">
            <tr><td>Medicine Name</td><td>Quantity</td><td>Prescription</td></tr>  
            <%
            
      
       {
             String selq="select * from tbl_temppresciption p,tbl_medicine m  where m.med_id=p.medicine_id and  p.doctor_id='"+session.getAttribute("did")+"'";
             ResultSet rs1=obj.select(selq);
        while(rs1.next())
                    { %>
                 
                    <tr><td><%=rs1.getString("med_name")%></td><td><%=rs1.getString("tempPresciption_qty")%></td><td><%=rs1.getString("tempPresciption_pres")%></td><td>    <input type="button" name="btnRemove" onclick="remove(<%=rs1.getString("tempPresciption_id")%>)" value="Remove">   <a href="../DOCTOR/HomePage.jsp?did=<%=rs1.getString("tempPresciption_id")%>">Delete</a></td></tr>
                        <%    
                        }
}
                        %>
            
     
            
            
        
        
        
   
        
      
                    </table>
    
             <%
           }
        }    
       
       %>
  
