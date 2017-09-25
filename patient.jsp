<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>

<html>
    <head>  </head>
    <body>
    <%
        String name="",age="",adrs="",mob="",email="",gender="",patid="",staffid="";
        String Editid="";
        if(request.getParameter("eid")!=null)
        
        {
            String sel="select * from tbl_patient where pat_id='"+request.getParameter("eid")+"'";
            ResultSet rs=obj.select(sel);
            if(rs.next())
            {
               name=rs.getString("pat_name");
               age=rs.getString("pat_age");
               adrs=rs.getString("pat_adrs");
               mob=rs.getString("pat_mob");
               email=rs.getString("pat_email");
              
               staffid=rs.getString("staff_id");
               gender=rs.getString("pat_gen");
               Editid=request.getParameter("eid");
            }
        }
         if(request.getParameter("did")!=null)
            {
                 String del="delete from tbl_patient where pat_id='"+ request.getParameter("did")  +"'";
                 boolean b=obj.insert(del);
                    if(b)
                        {
                         response.sendRedirect("patient.jsp");
                        }
            }       
         
        
        String submit=request.getParameter("btn_submit");
        if(submit!=null)
        {
            String PName=request.getParameter("txt_name");
            String PAge=request.getParameter("txt_age");
            String PAdrs=request.getParameter("txt_adrs");
            String PMob=request.getParameter("txt_mob");
            String PEmail=request.getParameter("txt_email");
            String StaffId=request.getParameter("ddl_doc");
            String PGen=request.getParameter("gen");
             
            if(request.getParameter("hid")!=""){
                 String up="update tbl_patient set pat_name='"+PName+"',pat_age='"+ PAge+"',"
                         + "pat_adrs='"+PAdrs+"',pat_mob="+PMob+","
                         + "pat_email='"+ PEmail+"',staff_id='"+StaffId+"',pat_gen='"+PGen+"' where pat_id='"+request.getParameter("hid")+"'";
                     boolean b= obj.insert(up);
                    
                        if(b==true)
                            {
                            response.sendRedirect("patient.jsp");
                            }else{
                            out.println(up);
                            }
                                 }else{
                            String ins="insert into tbl_patient(pat_name,pat_age,pat_adrs,pat_mob,pat_email,staff_id,pat_gen)values('"+PName+"','"+PAge+"','"+PAdrs+"','"+PMob+"','"+PEmail+"','"+StaffId+"','"+PGen+"')";
                            boolean b= obj.insert(ins);
                            out.print(ins);
                    if(b)
                         {
                
                         response.sendRedirect("patient.jsp");
                
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

   <tr>
       <td>Name</td><td><input type="text" value="<%=name%>" id="txt_name" name="txt_name" ></td>
   </tr>
   <tr>
	<td>Age</td><td><input type="text" id="txt_age" value="<%=age%>" name="txt_age" ></td>
      	</tr>
    <tr>
            <td>Address</td><td><textarea id="txt_adrs" name="txt_adrs" ><%=adrs%></textarea></td>
    </tr>
    <tr>
	<td>Mobile</td><td><input type="text" id="txt_mob" value="<%=mob%>" name="txt_mob" ></td>
      	</tr>
        <tr>
	<td>Email</td><td><input type="email" value="<%=email%>" id="txt_email" name="txt_email" ></td>
        
</tr>
 <tr>
            <td>Doctor</td><td><select id="ddl_doc" name="ddl_doc">
                    <option>-----select-------</option>
                   <%
                        
                        String sel="select * from tbl_staff s,tbl_designation d where s.des_id=d.des_id and d.des_name='Doctor'";
                        ResultSet rs=obj.select(sel);
                        while(rs.next())
                        {%>
                        <option value="<%=rs.getString("staff_id")%>" <% if(staffid.equals(rs.getString("staff_id"))) {%> selected="" <% } %>     > <%=rs.getString("staff_name")%></option>   
                        <%  
                          }
                    %>
                    
                             </td>
</tr>
        
<tr>
    <td>Gender</td><td><input type="radio" name="gen" <% if(gender.equals("Male")){%> checked=""<% }%> value="Male" id="r1">Male</td>
            <td><input type="radio" id="r1" name="gen" <% if(gender.equals("Female")){%> checked=""<% }%> value="Female">Female</td>
</tr>
         
<tr>
	<td><input type="submit" id="btn_submit" name="btn_submit" value="Ok"></td>
	<td><input type="reset" id="btn_reset" name="btn_reset" value="Cancel"</td>
	</tr>
                   <table border=".1">
                <tr><th>Patient Details</th></tr><tr><td>Name</td><td>Age</td><td>Address</td><td>Mobile</td><td>Email</td><td>Doctor</td><td>Gender</td><td>Edit</td><td> Delete</tr>
                <%
                    String sel1="select * from tbl_patient";
                    ResultSet rs1=obj.select(sel1);
                    while(rs1.next())
                    { %>
                    <tr><td><%=rs1.getString("pat_name")%></td> <td><%=rs1.getString("pat_age")%> <td><%=rs1.getString("pat_adrs")%><td><%=rs1.getString("pat_mob")%></td><td><%=rs1.getString("pat_email")%></td> <td><%=rs1.getString("staff_id")%></td><td><%=rs1.getString("pat_gen")%></td> <td><a href="patient.jsp?eid=<%=rs1.getString("pat_id")%>">Edit</a> <td><a href="patient.jsp?did=<%=rs1.getString("pat_id")%>">Delete</a></td>
                                     <%     
                              }

                     %>
            </table>
</form>
	</center>
                 
    </body>
</html>

