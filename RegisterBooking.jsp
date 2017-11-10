<%-- 
    Document   : RegisterBooking
    Created on : Oct 30, 2017, 10:57:31 AM
    Author     : student22

String selq="select ifnull(MAX(pat_id),0) as opnumber from tbl_patient";
            ResultSet rsq=obj.select(selq);
            if(rsq.next())
            {

--%>

<%@include file="Header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <script>
             $("#patAvailable").css("visibility","hidden");
        function search(docId,date,txtopnumber){
    alert(date)
      $.ajax({url:"AjaxDoctorAvailbility.jsp?docId="+docId+"&date="+date+"&txtopnumber="+txtopnumber,success:function(result){
      $("#avilable").html(result);
      }});
        }
        
        function patsearch(patId){
   
      $.ajax({url:"AjaxPatientSearch.jsp?patId="+patId,success:function(result){
              
              var res=result.trim();
              alert(res)
              if(res=="Patient Not Found!!!!")
              
              {
                  $("#patAvailable").css("visibility","hidden");
                   $("#patDet").css("visibility","hidden");
              }
              else
              {  $("#patDet").html(result);
                   $("#patDet").css("visibility","visible");
                    $("#patAvailable").css("visibility","visible");
              }
              
              
     // $("#avilable").html(result);
      }});
        }
        
        
        
        
        
        </script>
        
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        
     String patId="";
     if(request.getParameter("patId")!=null){
         patId="OP"+(Integer.parseInt(request.getParameter("patId"))+1000);
     }
        
        String opNumber="";
        String doc_id="";
        String date="";
        
     
     
     
     //Patient Booking Submit Button
     if(request.getParameter("btn_submit")!=null)
     {
         opNumber=request.getParameter("txtopnumber");
        date =request.getParameter("bdate");
        doc_id =request.getParameter("ddl_staffid");
         String sel="select ifnull(max(book_tocken),0) as book_tocken from tbl_booking where book_date='"+date+"' and doctor_id='"+doc_id+"'";
                 ResultSet rs=obj.select(sel);
                 if(rs.next())
                 {int token=rs.getInt("book_tocken")+1;
                     String ins="insert into tbl_booking (book_tocken,book_date,booking_date,doctor_id,op_number)values('"+token+"','"+date+"',CURDATE(),'"+doc_id+"','"+opNumber+"')";
                 boolean b= obj.insert(ins);
                 if(b)
                 {String selq="select MAX(book_id) as book_id from tbl_booking";
                 ResultSet rsq=obj.select(selq);
                 if(rsq.next())
                    response.sendRedirect("BookingBill.jsp?bookId="+rsq.getString("book_id")); 
                 }
                 
                 
                 
                 }
     }
     
     ///BOOK nOW lINK
     
     
     if(request.getParameter("docId")!=null)
     {
          opNumber=request.getParameter("txtopnumber");
        date =request.getParameter("date");
        doc_id =request.getParameter("docId");
         String sel="select ifnull(max(book_tocken),0) as book_tocken from tbl_booking where book_date='"+date+"' and doctor_id='"+doc_id+"'";
                 ResultSet rs=obj.select(sel);
                 if(rs.next())
                 {int token=rs.getInt("book_tocken")+1;
                     String ins="insert into tbl_booking (book_tocken,book_date,booking_date,doctor_id,op_number)values('"+token+"','"+date+"',CURDATE(),'"+doc_id+"','"+opNumber+"')";
                 boolean b= obj.insert(ins);
                 if(b)
                 {String selq="select MAX(book_id) as book_id from tbl_booking";
                 ResultSet rsq=obj.select(selq);
                 if(rsq.next())
                    response.sendRedirect("BookingBill.jsp?bookId="+rsq.getString("book_id")); 
                 }
                 
                 
                 
                 }
     }
     
     
     
     
     
     
     
     
     
     
     
     
     
     
        
        
        
        
        
        String pat_id="";
           String selq="select ifnull(MAX(pat_id),0) as opnumber from tbl_patient";
            ResultSet rsq=obj.select(selq);
            if(rsq.next())
            {
            pat_id=rsq.getString("opnumber");
            } 
              
    %>
    <center><form>
        
        <table>
            
            <tr><td>OP Number</td><td><input type="text" value="<%=patId%>" name="txtopnumber"></td><td><input type="button" name="btnsearch" value="Search" onclick="patsearch(txtopnumber.value)"> </td></tr>
        </table>
        <div id="patDet"></div>
            
        
        
        <div id="patAvailable" style="visibility: hidden">
        <table>
            
            
            <tr>     <td>Doctor Name</td><td><select id="ddl_staffid" name="ddl_staffid">
                            <option>-----select-------</option>
                                    <%
                        
                        String sel="select * from tbl_staff s,tbl_designation d where s.des_id=d.des_id and d.des_name='Doctor'";
                        ResultSet rs=obj.select(sel);
                        while(rs.next())
                        {%>
                        <option value="<%=rs.getString("staff_id")%>"><%=rs.getString("staff_name")%></option>   
                        <%  
                          }
                    %>
                    </select>
                    </td>
                </tr>
                <tr><td>Date</td><td><input type="date" name="bdate" id="bdate"></td><td><input type="button" onclick="search(ddl_staffid.value,bdate.value,txtopnumber.value)" name="btn_search" value="Search"></td></tr>
                 <tr>
                    
	</tr>
                
            </table>
                    <div id="avilable"></div>
        </div>
                        
    </form>
    </center>
</html>
