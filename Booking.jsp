<%@include file="Header.jsp" %>
<html>
    <head>
    <script>
          
          function validate()
          
          { 
                var status="true";
            
          var regtoc=/^[0-9 ]{0,200}$/;
              var tock=document.getElementById('txt_tocken').value;
                
                if((tock.match(regtoc)))
                {
                    document.getElementById('valtoc').innerHTML="";
              }
              else
                {
                    document.getElementById('valtoc').innerHTML=" Tocken Number must be filled";
                    status="false";
                }
                
                 
            var status="true";
            
               var regname=/^[A-Za-z ]{3,10}$/;
               var fname=document.getElementById('txt_bkname').value;
               
               if((fname.match(regname)))
               {
                    document.getElementById('valname').innerHTML="";
                } 
                 else
               {
                    document.getElementById('valname').innerHTML="Enter Patient Name";
                   status="false";
               }
                // var regaddress=/^[A-Za-z ]{3,10}$/;
               // var address=document.getElementById('txt_bkadrs').value;
               
               // if((address.match(regaddress)))
                //{
               //    document.getElementById('valaddress').innerHTML="";
            //  }else               {
                   //document.getElementById('valaddress').innerHTML="Enter Address";
                   // status="false";
              // }
                
                   if(status=="true")
                   {
                       return true;
                       
                   }
                 else
                 {
                     return false;
                 }
                }
                </script></head>
     <body>
         
        <%
        
        String bktocken="",bkdate="",bkname="",bkgen="",bkaddrs="",bkage="",bookid="",docid="",currentdate="";
        String Editid="";
        if(request.getParameter("eid")!=null)
        
        {
            String sel="select * from tbl_booking where book_id='"+request.getParameter("eid")+"'";
            ResultSet rs=obj.select(sel);
            if(rs.next())
            {
               bktocken=rs.getString("book_tocken");
               docid=rs.getString("staff_id");
               bkdate=rs.getString("book_date");
               bkname=rs.getString("book_name");
               bkgen=rs.getString("book_gen");
              bkaddrs=rs.getString("book_adrs");
              bkage=rs.getString("book_age");
              currentdate=rs.getString("current_date");
                Editid=request.getParameter("eid");
            }
        }
        
        
        
         if(request.getParameter("did")!=null)
        {
            String del="delete from tbl_booking where book_id='"+ request.getParameter("did")  +"'";
           boolean b=obj.insert(del);
           if(b)
           {
              response.sendRedirect("Booking.jsp");
           }
        }       
        
        String submit=request.getParameter("btn_submit");
        if(submit!=null)
        {
            String Bktocken=request.getParameter("txt_tocken");
            String Bkdate=request.getParameter("txt_bkdate");
            String Bkstatus=request.getParameter("txt_bkstatus");
            String DocId=request.getParameter("ddl_staffid");
             String Bkname=request.getParameter("txt_bkname");
              String Bkgen=request.getParameter("gen");
               String Bkadrs=request.getParameter("txt_bkadrs");
                String Bkage=request.getParameter("txt_bkage");
                String Cdate=request.getParameter("cdate");
            
            
                if(request.getParameter("hid")!="")
                {                    
                    String up="update tbl_booking set book_tocken='"+Bktocken+"',book_date='"+Bkdate+"',current_date='"+Cdate+"',staff_id='"+DocId+"',book_name='"+Bkname+"', book_gen='"+Bkgen+"',book_adrs='"+Bkadrs+"',book_age='"+Bkage+"' where book_id='"+request.getParameter("hid")+"'";
                    boolean b=obj.insert(up);
                                                                                                                                                
                                    if(b==true)
                        {
                            
                            
                            
                            
                            
                            response.sendRedirect("Booking.jsp");
                        }else
                      {
                        out.println(up);
                      }
                    }else{
                        String ins="insert into tbl_booking(book_tocken,book_date,current_date,staff_id,book_name,book_gen,book_adrs,book_age)values('"+Bktocken+"','"+Bkdate+"','"+Cdate+"','"+DocId+"','"+Bkname+"','"+Bkgen+"','"+Bkadrs+"','"+Bkage+"')";
                        boolean b= obj.insert(ins);
                        out.print(ins);         
                   if(b)
          {
          
              response.sendRedirect("Booking.jsp");
                
          }
                     
           else
            {
           out.println(b);
          }  }
        }
        
        
        %>
        
    <center><form>
            <input type="hidden" name="hid" value="<%=Editid%>">
<table width="">

    <th><u><b>Booking Details</b></u></th>
    
	<tr>
            <td>TockenNo</td><td><input type="text"  value="<%= bktocken%>"   id="txt_tocken" name="txt_tocken" ></td>
            <td><div style="color: red" id="valtoc" ></div></td>
	</tr>
        <tr>
            <td>Current Date</td><td><input type="date"  value="<%=currentdate%>"   id="cdate" name="cdate" ></td>
	</tr>
        <tr>
            <td>Date of Booking</td><td><input type="date"  value="<%=bkdate%>"   id="txt_bkdate" name="txt_bkdate" ></td>
	</tr>
               
        <tr>     <td>Doctor Name</td><td><select id="ddl_staffid" name="ddl_staffid">
                            <option>-----select-------</option>
                                    <%
                        
                        String sel="select * from tbl_staff s,tbl_designation d where s.des_id=d.des_id and d.des_name='Doctor'";
                        ResultSet rs=obj.select(sel);
                        while(rs.next())
                        {%>
                        <option value="<%=rs.getString("staff_id")%>" <% if(docid.equals(rs.getString("staff_id"))){%> selected="" <% } %>><%=rs.getString("staff_name")%></option>   
                        <%  
                          }
                    %>
                    
                    </td>
                </tr>
         
                         <tr>
                             <td>Patient Name</td><td><input type="text"  value= "<%=bkname%>"   id="txt_bkname" name="txt_bkname" ></td>
                             <td> <div style="color: red" id="valname" ></div></td></td></tr> 
                             </td>
                         </tr>
                        <tr>
    <td>Gender</td><td><input type="radio" name="gen" <% if(bkgen.equals("Male")){%> checked=""<% }%> value="Male" id="gen">Male</td>
            <td><input type="radio" id="gen" name="gen" <% if(bkgen.equals("Female")){%> checked=""<% }%> value="Female">Female</td>
      
                        </tr>
                         <tr>
                             <td> Address</td><td><textarea id="txt_bkadrs" name="txt_bkadrs" ><%=bkaddrs%></textarea></td>
                             <td>  <div style="color: red" id="valaddress" ></div></td>
                         </tr>
                         <tr>
                             <td>Age</td><td><input type="text"  value="<%=bkage%>"   id="txt_bkage" name="txt_bkage" ></td>
                             
                         </tr>
                         
	<tr>
	<td><input type="submit" id="btn_submit"  onclick="return validate()"  name="btn_submit" value="Ok"></td>
        <td><input type="reset" id="btn_reset" name="btn_reset" value="Cancel"></td>
	</tr>
	</table>
            <table border=".1">
                
            </table>
                          <table border=".1">
                              <tr><th>View the Booking Details</th></tr>
                              <tr> <td>TockenNo</td> <td> Booking Date</td><td>Doctor </td><td>Patient Name</td><td>Gender</td><td>Address</td><td>Age</td></tr>
                <%
                    String sel5="select * from tbl_booking b,tbl_staff s,tbl_designation d where b.staff_id=s.staff_id and s.des_id=d.des_id";
                    ResultSet rs3=obj.select(sel5);
                    while(rs3.next())
                    { %>
                    <tr>
                        
                        <td><%= rs3.getString("book_tocken")%></td>
                        <td><%=rs3.getString("book_date")%></td>
                        <td><%=rs3.getString("staff_name")%></td>
                        <td><%= rs3.getString("book_name")%></td>
                        <td><%= rs3.getString("book_gen")%></td>
                        <td><%= rs3.getString("book_adrs")%></td>
                        <td><%= rs3.getString("book_age")%></td>
                        
                        <td><a href="Booking.jsp?eid=<%= rs3.getString("book_id")%>">Edit</a> </td>
                        <td><a href="Booking.jsp?did=<%= rs3.getString("book_id")%>">Delete</a></td></tr>
               
                    <%     
                              }

                     %>
            </table>
</form>
	</center>
    </body>
    
</html>
