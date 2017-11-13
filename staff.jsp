<%@include file="Header.jsp" %>

<html>
    <head>
        
        <script>
            function sel(x)
            {
                if(x=="7"){
                $("#cons").css("visibility","visible");}
            else
            {
                  $("#cons").css("visibility","hidden")
            }
            }
                       
          function validate()
          {
              
          var status="true";                
               var sfname=/^[A-Za-z]{3,10}$/;
               var fname=document.getElementById('txt_name').value;
               
               if((fname.match(sfname)))                {
                    document.getElementById('valsname').innerHTML="";
                }else
                {
                   document.getElementById('valsname').innerHTML="Name must be filled!!!!";         
                   status="false";
                }
                var regaddress=/^[A-Za-z ]{3,150}$/;
                var address=document.getElementById('staff_adrs').value;                
                if((address.match(regaddress)))
                {
                    document.getElementById('valaddress').innerHTML="";
               }else
                {
                    document.getElementById('valaddress').innerHTML="Enter Address";
                    status="false";
                }
             var regph=/^[0-9 ]{0,9}$/;
               var ph=document.getElementById('staff_mob').value;
                
             if((ph.match(regph)))
                {
                    document.getElementById('valph').innerHTML="";
               }else
                {
                    document.getElementById('valph').innerHTML="Enter Phone Number";
                    status="false";
                }
               
                                
                 var reuname=/^[0-9 ]{0,9}$/;
                var uname=document.getElementById('staff_user').value;
                
                if((uname.match(reuname)))
              {
                    document.getElementById('valuname').innerHTML="";
                }else
                {
                    document.getElementById('valuname').innerHTML="Enter User Name";
                    status="false";
                }
                
                 var regpwd=/^[0-9 ]{0,9}$/;
                var pwd=document.getElementById('staff_pswd').value;
                
                if((pwd.match(regpwd)))
                {
                    document.getElementById('valpwd').innerHTML="";
                }else
                {
                    document.getElementById('valpwd').innerHTML="Enter Password";
                    status="false";
               }
     if(status=="true")
            {
                return true;
            }else
            {
                return false;
          }
         
    }
    
    </script>
           
            
              
    </head>
    <body>
    <%
        String name="",adrs="",mob="",mail="",gender="",confee="",dob="",doj="",mstatus="",salary="",exp="",desid="",staffid="",staffuser="",staffpwd="";
        String Editid="";
        if(request.getParameter("eid")!=null)
        
        {
            String sel="select * from tbl_staff where staff_id='"+request.getParameter("eid")+"'";
            ResultSet rs=obj.select(sel);
            if(rs.next())
            {
               name=rs.getString("staff_name");
               adrs=rs.getString("staff_adrs");
               mob=rs.getString("staff_mob");
               mail=rs.getString("staff_email");
               gender=rs.getString("staff_gender");
               dob=rs.getString("staff_dob");
               doj=rs.getString("staff_doj");
               mstatus=rs.getString("staff_marsts");
               salary=rs.getString("staff_salary");
               exp=rs.getString("staff_exp");
               desid=rs.getString("des_id");
                confee=rs.getString("staff_confee");
               staffuser=rs.getString("staff_user");
               staffpwd=rs.getString("staff_pswd");
               Editid=request.getParameter("eid");
            }
        }
         if(request.getParameter("did")!=null)
            {
                 String del="delete from tbl_staff where staff_id='"+ request.getParameter("did")  +"'";
                 boolean b=obj.insert(del);
                    if(b)
                        {
                         response.sendRedirect("staff.jsp");
                        }
            }       
         
        
        String submit=request.getParameter("btn_submit");
        if(submit!=null)
        {
            String Staffname=request.getParameter("txt_name");
            String Staffadrs=request.getParameter("txt_address");
            String Staffmob=request.getParameter("txt_mob");
            String Staffmail=request.getParameter("txt_mail");
            String Staffgender=request.getParameter("gen");
            String Stafffee=request.getParameter("txt_fee");
            String Staffdob=request.getParameter("dob");
            String Staffdoj=request.getParameter("doj");
            String Staffmstatus=request.getParameter("mstatus");
            String Staffexp=request.getParameter("txt_exp");
            String Staffuser=request.getParameter("txt_user");
            String Staffsalary=request.getParameter("txt_salary");
            String Staffpwd=request.getParameter("txt_pwd");
            String Staffdes=request.getParameter("ddl_desig");
            
              
              
            if(request.getParameter("hid")!=""){
                 String up="update tbl_staff set staff_name='"+Staffname+"',staff_gender='"+ Staffgender+"',"
                         + "staff_email='"+Staffmail+"',staff_mob="+Staffmob+","
                         + "staff_confee="+ Stafffee+",staff_dob='"+Staffdob+"',"
                         + "staff_marsts='"+Staffmstatus+"',staff_adrs='"+Staffadrs+"',"
                         + "staff_salary="+Staffsalary+",staff_doj='"+Staffdoj+"',"
                         + "staff_exp="+ Staffexp+",des_id='"+Staffdes+"',staff_user='"+Staffuser+"',"
                         + "staff_pswd='"+Staffpwd+"' where staff_id='"+request.getParameter("hid")+"'";
                     boolean b= obj.insert(up);
                    
                        if(b==true)
                            {
                            response.sendRedirect("staff.jsp");
                            }else{
                            out.println(up);
                            }
                                 }else{
                            String ins="insert into tbl_staff(staff_name,staff_gender,staff_email,staff_mob,staff_confee,staff_dob,staff_marsts,staff_adrs,staff_salary,staff_doj,staff_exp,des_id,staff_user,staff_pswd)values('"+Staffname+"','"+Staffgender+"','"+Staffmail+"','"+Staffmob+"','"+Stafffee+"','"+Staffdoj+"','"+Staffmstatus+"','"+Staffadrs+"','"+Staffsalary+"','"+Staffdoj+"','"+Staffexp+"','"+Staffdes+"','"+Staffuser+"','"+Staffpwd+"')";
                            boolean b= obj.insert(ins);
                            out.print(ins);
                    if(b)
                         {
                
                         response.sendRedirect("staff.jsp");
                
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

   <tr>
       <td>Name</td><td><input type="text" value="<%=name%>" id="txt_name" name="txt_name" required="" > <div style="color: red" id="valsname" ></div></td>
   </tr>
    <tr>
        <td>Address</td><td><textarea id="txt_address" name="txt_address" required=""><%=adrs%></textarea><td><div style="color: red" id="valaddress" ></div></td>
    </tr>
<tr>
    <td>Gender</td><td><input type="radio" name="gen" <% if(gender.equals("Male")){%> checked=""<% }%> value="Male" id="r1">Male</td>
            <td><input type="radio" id="r1" name="gen" <% if(gender.equals("Female")){%> checked=""<% }%> value="Female">Female</td>
</tr>
<tr>
    <td>Designation</td><td><select id="ddl_desig" onchange="sel(this.value)" name="ddl_desig" required="">
                    <option>-----select-------</option>
                   <%
                        
                        String sel="select * from tbl_designation";
                        ResultSet rs=obj.select(sel);
                        while(rs.next())
                        {%>
                        <option value="<%=rs.getString("des_id")%>" <% if(desid.equals(rs.getString("des_id"))) {%> selected="" <% } %>     > <%=rs.getString("des_name")%></option>   
                        <%  
                          }
                    %>
                    
                             </td>
</tr>
        
<tr>
	<td>Email</td><td><input type="email" value="<%=mail%>" id="txt_mail" name="txt_mail" ></td>
        
</tr>
         <tr>
             <td>Mobile</td><td><input type="text" id="txt_mob" value="<%=mob%>" name="txt_mob" required=""><td><div style="color: red" id="valph" ></div></td>
      	</tr>
        <tr>
            <td><div id="cons" style="visibility: hidden">Consultation Fee<input type="text" id="txt_fee" value="<%=confee%>" name="txt_fee" ></div></td>
      	</tr>
        <tr>
            <td>Date of Birth</td><td><input type="date" id="dob" name="dob" required=""><%=dob%></td>
      	</tr>
        <tr>
            <td>Date of Join</td><td><input type="date" id="doj" required="" name="doj"><%=doj%></td>
      	</tr>
        <tr>
            <td>Marital Status</td><td><input type="radio" name="mstatus" <% if(mstatus.equals("Yes")){%> checked=""<% }%> value="Yes" id="r2" >Married</td>
            <td><input type="radio" id="r2" name="mstatus" <% if(mstatus.equals("No")){%> checked=""<% }%>value="No">Unmarried</td>
	</tr>
        <tr>
            <td>Salary</td><td><input type="text" id="txt_salary" required="" value="<%=salary%>"name="txt_salary" ></td>
      	</tr>
        <tr>
            <td>Experience</td><td><input type="text" id="txt_exp" required="" value="<%=exp%>" name="txt_exp" ></td>
              	</tr>
         <tr>
             <td>Username</td><td><input type="text" id="txt_user" required="" value="<%=staffuser%>" name="txt_user" ><td><div style="color: red" id="valemail" ></div></td></td>
      	</tr>
         <tr>
             <td>Password</td><td><input type="password" id="txt_pwd" required="" value="<%=staffpwd%>" name="txt_pwd" ><td><div style="color: red" id="valpwd" ></div></td></td>
      	</tr>
        
                <tr>
	<td><input type="submit" id="btn_submit" name="btn_submit" value="Ok" onclick="return validate() "></td>
        <td><input type="reset" id="btn_reset" name="btn_reset" value="Cancel"></td>
	</tr>
          </table>
            <table border=".1">
                <tr><th>Staff Details</th></tr><tr><td>Name</td><td>Address</td><td>Mail Id</td><td>Mobile</td><td>Gender</td><td>Consultation Fee</td><td>Date Of Join</td><td>Marital Status</td><td>Salary</td><td>Date Of Birth</td><td>Experience</td><td>Designation</td><td>Username</td><td>Password</td><td>Edit</td><td> Delete</tr>
                <%
                    String sel1="select * from tbl_staff s,tbl_designation d where s.des_id=d.des_id";
                    ResultSet rs1=obj.select(sel1);
                    while(rs1.next())
                    { %>
                    <tr><td><%=rs1.getString("staff_name")%></td> <td><%=rs1.getString("staff_adrs")%> <td><%=rs1.getString("staff_email")%><td><%=rs1.getString("staff_mob")%></td><td><%=rs1.getString("staff_gender")%></td> <td><%=rs1.getString("staff_confee")%></td><td><%=rs1.getString("staff_doj")%></td><td><%=rs1.getString("staff_marsts")%></td> <td><%=rs1.getString("staff_salary")%></td> <td><%=rs1.getString("staff_dob")%></td> <td><%=rs1.getString("staff_exp")%></td> <td><%=rs1.getString("des_name")%></td> <td><%=rs1.getString("staff_user")%></td><td><%=rs1.getString("staff_pswd")%></td><td><a href="staff.jsp?eid=<%=rs1.getString("staff_id")%>">Edit</a> <td><a href="staff.jsp?did=<%=rs1.getString("staff_id")%>">Delete</a></td>
                                     <%     
                              }

                     %>
            </table>
          
</form>
	</center>
                 
    </body>
</html>

