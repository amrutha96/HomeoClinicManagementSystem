<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="Header.jsp" %>
<html>
    <head>  </head>
    <body>
    <%
          SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        Date dt = new Date();
                        String dta = sdf.format(dt);
                        
        
        String patname="",feedback="",fdate="",ftime="",feedbackid="";
        String Editid="";
        if(request.getParameter("eid")!=null)
        
        {
            String sel="select * from tbl_feedback where feedback_id='"+request.getParameter("eid")+"'";
            ResultSet rs=obj.select(sel);
            if(rs.next())
            {
               patname=rs.getString("pat_name");
               feedback=rs.getString("feedback");
               fdate=rs.getString("feedback_date");
                 fdate=rs.getString("feedback_time");
               Editid=request.getParameter("eid");
            }
        }
           
        
        
        if(request.getParameter("did")!=null)
        {
            String del="delete from tbl_feedback where feedback_id='"+ request.getParameter("did")  +"'";
           boolean b=obj.insert(del);
           if(b)
           {
              response.sendRedirect("feedback.jsp");
           }
        }       
        
        String submit=request.getParameter("btn_submit");
        if(submit!=null)
        {
            String Patname =request.getParameter("txt_pname");
            String  Feedback=request.getParameter("txt_feedback");
            String Fdate=request.getParameter("date");
               String Ftime=request.getParameter("time");
                    
            if(request.getParameter("hid")!=""){
                String up="update tbl_feedback set feedback='"+Feedback+"',feedback_date='"+ Fdate+"',feedback_time='"+Ftime+"',pat_name='"+Patname +"' where feedback_id='"+request.getParameter("hid")+"'";
             boolean b= obj.insert(up);
             if(b==true)
             {
             response.sendRedirect("feedback.jsp");
             }else{
            out.println(up);
             }
                    }else{
            String ins="insert into tbl_feedback(feedback,feedback_date,feedback_time,pat_name)values('"+Feedback+"','"+Fdate+"','"+Ftime+"','"+Patname+"')";
                boolean b= obj.insert(ins);
                out.print(ins);
            
                      if(b)
            {
                
                response.sendRedirect("feedback.jsp");
                  
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

    <th><u><b>Feedback</b></u></th>
	<tr>
            <td>Name</td><td><input type="text"  value="<%=patname%>"   id="txt_pname" name="txt_pname" ></td>
	</tr>
        
              <tr>
            <td>Feedback</td><td><textarea  id="txt_feedback" name="txt_feedback"><%=feedback%></textarea></td>
	</tr>
        <tr>
            <td>Date</td><td><input type="date"  id="date" min="<%=dta%>" name="date"><%=fdate%></td>
	</tr> <tr>
            <td>Time</td><td><input type="time"  id="time" name="time"><%=ftime%> </td>
	</tr>
	<tr>
	<td><input type="submit" id="btn_submit" name="btn_submit" value="Ok"></td>
        <td><input type="reset" id="btn_reset" name="btn_reset" value="Cancel"></td>
	</tr>
</table><br>
<br>
<br>
            <table>
                <tr><th>our Feedbacks!!!!!!!</th></tr><tr><td>Name</td><td>Feedback</td></tr>
                <%
                    String sel="select * from tbl_feedback";
                    ResultSet rs=obj.select(sel);
                    while(rs.next())
                    { %>
                    <tr><td><%= rs.getString("pat_name")%></td> <td><%= rs.getString("feedback")%></td>
                                     <%     
                              }

                     %>
            </table>
</form>
	</center>
                 
    </body>
</html>
