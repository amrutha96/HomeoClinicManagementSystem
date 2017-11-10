<%-- 
    Document   : AjaxPrescription
    Created on : Nov 6, 2017, 10:22:48 AM
    Author     : student22
--%>
<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
     
        
        
        
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        <%
        String medname=request.getParameter("medname");
        String medqty=request.getParameter("medqty");
        String medpres=request.getParameter("medpres");
        String meddata=request.getParameter("meddata");
        String medid="";
        String sel="select * from tbl_medicine where med_name='"+medname+"'";
        ResultSet rs=obj.select(sel);
        if(rs.next())
        {
            medid=rs.getString("med_id");
        }
        
         
     
         %> 
        <table border=".1">
            <tr><td>Medicine Name</td><td>Quantity</td><td>Prescription</td></tr>  
            <%
            
        String ins="insert into tbl_temppresciption (medicine_id,tempPresciption_qty,tempPresciption_pres,tempPresciption_other,doctor_id) values('"+medid+"','"+medqty+"','"+medpres+"','"+meddata+"','"+session.getAttribute("did")+"')";
        boolean b=obj.insert(ins);
        if(b)
       {
             String selq="select * from tbl_temppresciption p,tbl_medicine m  where m.med_id=p.medicine_id and  p.doctor_id='"+session.getAttribute("did")+"'";
             ResultSet rs1=obj.select(selq);
        while(rs1.next())
                    { %>
                 
                    <tr><td><%=rs1.getString("med_name")%></td><td><%=rs1.getString("tempPresciption_qty")%></td><td><%=rs1.getString("tempPresciption_pres")%></td><td>    <input type="button" name="btnRemove" onclick="remove(<%=rs1.getString("tempPresciption_id")%>)" value="Remove">   </td></tr>
                        <%    
                        }
}
                        %>
            
     
            
            
        
        
        
   
        
      
                    </table>
    
</html>
