<%@include file="Header.jsp" %>

<html>
    <head>  </head>
    <body>
    <%
        
        String desname="",desid="";
        String Editid="";
        if(request.getParameter("eid")!=null)
        
        {
            String sel="select * from tbl_designation where des_id='"+request.getParameter("eid")+"'";
            ResultSet rs=obj.select(sel);
            if(rs.next())
            {
               desname=rs.getString("des_name");
                Editid=request.getParameter("eid");
            }
        }
        
        
        
         if(request.getParameter("did")!=null)
        {
            String del="delete from tbl_designation where des_id='"+ request.getParameter("did")  +"'";
           boolean b= obj.insert(del);
           if(b)
           {
              response.sendRedirect("Designation.jsp");
           }
        }       
        
        String submit=request.getParameter("btn_submit");
        if(submit!=null)
        {
            String DesignationName=request.getParameter("txt_designation");
            if(request.getParameter("hid")!=""){
                String up="update tbl_designation set des_name='"+DesignationName+"' where des_id='"+request.getParameter("hid")+"'";
             boolean b= obj.insert(up);
             if(b==true)
             {
             response.sendRedirect("Designation.jsp");
             }else{
            out.println(up);
             }
                    }else{
            String ins="insert into tbl_designation(des_name)values('"+DesignationName+"')";
           //out.print(ins);
            boolean b= obj.insert(ins);
            
                      if(b)
            {
                
                response.sendRedirect("Designation.jsp");
                  
            }
                      
            else
            {
            out.println(b);
            }
        }
        }
        %>
        
    <center><form>
            <input type="hidden" name="hid" value="<%=Editid%>">
<table width="">

    <th><u><b>Designation Details</b></u></th>
	<tr>
            <td>Designation</td><td><input type="text"  value="<%=desname%>"   id="txt_designation" name="txt_designation" ></td>
	</tr>
	<tr>
	<td><input type="submit" id="btn_submit" name="btn_submit" value="Ok"></td>
        <td><input type="reset" id="btn_reset" name="btn_reset" value="Cancel"></td>
	</tr>
	</table>
            <table border=".1">
                <tr><th>Designation</th></tr>
                <%
                    String sel="select * from tbl_designation";
                    ResultSet rs=obj.select(sel);
                    while(rs.next())
                    { %>
                    <tr><td><%= rs.getString("des_name")%></td><td><a href="Designation.jsp?eid=<%= rs.getString("des_id")%>">Edit</a> <td><a href="Designation.jsp?did=<%= rs.getString("des_id")%>">Delete</a></td></tr>
                    <%     
                              }

                     %>
            </table>
</form>
	</center>
                 
    </body>
</html>