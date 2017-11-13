<%@include file="Header.jsp" %>

<html>
    <head>  </head>
    <body>
    <%
        
        String brandname="",brandid="";
        String Editid="";
        if(request.getParameter("eid")!=null)
        
        {
            String sel="select * from tbl_brand where brand_id='"+request.getParameter("eid")+"'";
            ResultSet rs=obj.select(sel);
            if(rs.next())
            {
               brandname=rs.getString("brand_name");
                Editid=request.getParameter("eid");
            }
        }
        
        
        
         if(request.getParameter("did")!=null)
        {
            String del="delete from tbl_brand where brand_id='"+ request.getParameter("did")  +"'";
           boolean b= obj.insert(del);
           if(b)
           {
              response.sendRedirect("brand.jsp");
           }
        }       
        
        String submit=request.getParameter("btn_submit");
        if(submit!=null)
        {
            String BrandName=request.getParameter("txt_brandname");
            if(request.getParameter("hid")!=""){
            String up="update tbl_brand set brand_name='"+BrandName+"' where brand_id='"+request.getParameter("hid")+"'";
             boolean b= obj.insert(up);
             if(b==true)
             {
             response.sendRedirect("brand.jsp");
             }else{
            out.println(up);
             }
                    }else{
            String ins="insert into tbl_brand(brand_name)values('"+BrandName+"')";
                boolean b= obj.insert(ins);
            
                      if(b)
            {
                
                response.sendRedirect("brand.jsp");
                  
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

    <th><u><b>Medicine Brands</b></u></th>
	<tr>
            <td>Type</td><td><input type="text"  value="<%=brandname%>"   id="txt_brandname" required="" name="txt_brandname" ></td>
	</tr>
	<tr>
	<td><input type="submit" id="btn_submit" name="btn_submit" value="Ok"></td>
        <td><input type="reset" id="btn_reset" name="btn_reset" value="Cancel"></td>
	</tr>
	</table>
            <table border=".1">
                <tr><th>View the Medicine Brands</th></tr>
                <%
                    String sel="select * from tbl_brand";
                    ResultSet rs=obj.select(sel);
                    while(rs.next())
                    { %>
               <tr><td><%= rs.getString("brand_name")%></td><td><a href="brand.jsp?eid=<%= rs.getString("brand_id")%>">Edit</a> <td><a href="brand.jsp?did=<%= rs.getString("brand_id")%>">Delete</a></td></td></tr>
                
                    <%     
                              }

                     %>
            </table>
</form>
	</center>
                 
    </body>
</html>