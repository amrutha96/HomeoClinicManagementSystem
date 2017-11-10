<%@include file="Header.jsp" %>

<html>
    <head>  
     <script>
          
          function validate()
          
          { 
         
            var status="true";
            
               var regmedtype=/^[A-Za-z ]{3,10}$/;
               var fmedtype=document.getElementById('txt_medicinetype').value;
               
               if((fmedtype.match(regmedtype)))
               {
                    document.getElementById('valmed').innerHTML="";
                } 
                 else
               {
                    document.getElementById('valmed').innerHTML="Enter the Medicine Type";
                   status="false";
               }
               
                   if(status=="true")
                   {
                       return true;
                       
                   }
                 else
                 {
                     return false;
                 }
                }

            </script>
    </head>
    <body>
    <%
        
        String medtype="",medtypeid="";
        String Editid="";
        if(request.getParameter("eid")!=null)
        
        {
            String sel="select * from tbl_medicinetype where medtype_id='"+request.getParameter("eid")+"'";
            ResultSet rs=obj.select(sel);
            if(rs.next())
            {
               medtype=rs.getString("medtype_type");
                Editid=request.getParameter("eid");
            }
        }
        
        
        
         if(request.getParameter("did")!=null)
        {
            String del="delete from tbl_medicinetype where medtype_id='"+ request.getParameter("did")  +"'";
           boolean b= obj.insert(del);
           if(b)
           {
              response.sendRedirect("MedicineType.jsp");
           }
        }       
        
        String submit=request.getParameter("btn_submit");
        if(submit!=null)
        {
            String MedicineType=request.getParameter("txt_medicinetype");
            if(request.getParameter("hid")!=""){
                String up="update tbl_medicinetype set medtype_type='"+MedicineType+"' where medtype_id='"+request.getParameter("hid")+"'";
             boolean b= obj.insert(up);
             if(b==true)
             {
             response.sendRedirect("MedicineType.jsp");
             }else{
            out.println(up);
             }
                    }else{
            String ins="insert into tbl_medicinetype(medtype_type)values('"+MedicineType+"')";
                boolean b= obj.insert(ins);
            
                      if(b)
            {
                
                response.sendRedirect("MedicineType.jsp");
                  
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

    <th><u><b>Medicine Types</b></u></th>
	<tr>
            <td>Type</td><td><input type="text"  value="<%=medtype%>"   id="txt_medicinetype" name="txt_medicinetype" ></td>
           
                 <td><div id="valmed"></div></td>
           
	</tr>
	<tr>
	<td><input type="submit" id="btn_submit" onclick="return validate()" name="btn_submit" value="Ok"></td>
        <td><input type="reset" id="btn_reset" name="btn_reset" value="Cancel"></td>
	</tr>
	</table>
            <table border=".1">
                <tr><th>Edit Type????</th></tr>
                <%
                    String sel="select * from tbl_medicinetype";
                    ResultSet rs=obj.select(sel);
                    while(rs.next())
                    { %>
                    <tr><td><%= rs.getString("medtype_type")%></td><td><a href="MedicineType.jsp?eid=<%= rs.getString("medtype_id")%>">Edit</a> <td><a href="MedicineType.jsp?did=<%= rs.getString("medtype_id")%>">Delete</a></td></tr>
                    <%     
                              }

                     %>
            </table>
</form>
	</center>
                 
    </body>
</html>