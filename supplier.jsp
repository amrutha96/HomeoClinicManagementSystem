<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>

<html>
    <head>  </head>
    <body>
    <%
        
        String supname="",supadrs="",supmob="",supmail="",supid="";
        String Editid="";
        if(request.getParameter("eid")!=null)
        
        {
            String sel="select * from tbl_supplier where sup_id='"+request.getParameter("eid")+"'";
            ResultSet rs=obj.select(sel);
            if(rs.next())
            {
               supname=rs.getString("sup_name");
               supadrs=rs.getString("sup_adrs");
               supmob=rs.getString("sup_mob");
               supmail=rs.getString("sup_email");
               Editid=request.getParameter("eid");
            }
        }
           
        
        
         if(request.getParameter("did")!=null)
        {
            String del="delete from tbl_supplier where sup_id='"+ request.getParameter("did")  +"'";
           boolean b= obj.insert(del);
           if(b)
           {
              response.sendRedirect("supplier.jsp");
           }
        }       
        
        String submit=request.getParameter("btn_submit");
        if(submit!=null)
        {
            String SupplierName=request.getParameter("txt_supname");
            String SupplierMob=request.getParameter("txt_supno");
            String SupplierEmail=request.getParameter("txt_supmail");
            String SupplierAdrs=request.getParameter("address");
            
            if(request.getParameter("hid")!=""){
                String up="update tbl_supplier set sup_name='"+SupplierName+"',sup_mob='"+ SupplierMob+"',sup_email='"+SupplierEmail+"',sup_adrs='"+SupplierAdrs+"' where sup_id='"+request.getParameter("hid")+"'";
             boolean b= obj.insert(up);
             if(b==true)
             {
             response.sendRedirect("supplier.jsp");
             }else{
            out.println(up);
             }
                    }else{
            String ins="insert into tbl_supplier(sup_name,sup_mob,sup_email,sup_adrs)values('"+SupplierName+"','"+SupplierMob+"','"+SupplierEmail+"','"+SupplierAdrs+"')";
                boolean b= obj.insert(ins);
            
                      if(b)
            {
                
                response.sendRedirect("supplier.jsp");
                  
            }
                      
            else
            {
            out.println(b);
            }
        }
        }
        %>
        
    <center><form name="frm1" method="">
            <input type="hidden" name="hid" value="<%=Editid%>">
<table width="">

    <th><u><b>Suppliers</b></u></th>
	<tr>
            <td>Name</td><td><input type="text"  value="<%=supname%>"   id="txt_supname" name="txt_supname" ></td>
	</tr>
        <tr>
            <td>Address</td><td><textarea value=""   id="address" name="address" ><%=supadrs%></textarea></td>
	</tr>
              <tr>
            <td>Mobile</td><td><input type="text"  value="<%=supmob%>"   id="txt_supno" name="txt_supno" ></td>
	</tr>
        <tr>
            <td>Email</td><td><input type="text"  value="<%=supmail%>"   id="txt_supmail" name="txt_supmail" ></td>
	</tr>
	<tr>
	<td><input type="submit" id="btn_submit" name="btn_submit" value="Ok"></td>
	<td><input type="reset" id="btn_reset" name="btn_reset" value="Cancel"</td>
	</tr>
	</table>
            <table border=".1">
                <tr><th>Supplier Details</th></tr><tr><td>Name</td><td>Mobile</td><td>Mail Id</td><td>Address</td><td>Edit</td><td> Delete</tr>
                <%
                    String sel="select * from tbl_supplier";
                    ResultSet rs=obj.select(sel);
                    while(rs.next())
                    { %>
                    <tr><td><%= rs.getString("sup_name")%></td> <td><%= rs.getString("sup_mob")%> <td><%= rs.getString("sup_email")%><td><%=rs.getString("sup_adrs")%></td></td><td><a href="supplier.jsp?eid=<%= rs.getString("sup_id")%>">Edit</a> <td><a href="supplier.jsp?did=<%= rs.getString("sup_id")%>">Delete</a></td>
                                     <%     
                              }

                     %>
            </table>
</form>
	</center>
                 
    </body>
</html>
