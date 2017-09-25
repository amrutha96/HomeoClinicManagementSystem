<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>
<!DOCTYPE html>
<html>
   
    <body>
        <%
        
        String medname="",medtypeid="",brandid="", price1="",sales1="",medid="";
        String Editid="";
        if(request.getParameter("eid")!=null)
        
        {
            String sel="select * from tbl_medicine where med_id='"+request.getParameter("eid")+"'";
            ResultSet rs= obj.select(sel);
            if(rs.next())
            {
               medname=rs.getString("med_name");
               medtypeid=rs.getString("medtype_id");
               brandid=rs.getString("brand_id");
               price1 = rs.getString("med_price");
               sales1=rs.getString("med_srate");
               
                Editid=request.getParameter("eid");
            }
        }
        
        
        
         if(request.getParameter("did")!=null)
        {
            String del="delete from tbl_medicine where med_id='"+ request.getParameter("did")  +"'";
           boolean b=obj.insert(del);
           if(b)
           {
              response.sendRedirect("Medicine.jsp");
           }
        }       
        
        String submit=request.getParameter("btn_submit");
        if(submit!=null)
        {
            String medName=request.getParameter("txt_medname");
            String Medtypeid=request.getParameter("medtypeid");
            String Brandid=request.getParameter("brandid");
            String medprice=request.getParameter("price");
            String sales=request.getParameter("sales");
            
            
                if(request.getParameter("hid")!="")
                {                    
                    String up="update tbl_medicine set med_name='"+medName+"',medtype_id='"+Medtypeid+"',brand_id='"+Brandid+"',med_price='"+medprice+"',med_srate='"+sales+"' where med_id='"+request.getParameter("hid")+"'";
                    boolean b=obj.insert(up);
                   
                                    if(b==true)
                        {
                            response.sendRedirect("Medicine.jsp");
                        }else
                      {
                        out.println(up);
                      }
                    }else{
                        String ins="insert into tbl_medicine(med_name,medtype_id,brand_id,med_price,med_srate)values('"+medName+"','"+Medtypeid+"','"+Brandid+"','"+medprice+"','"+sales+"')";
                        boolean b= obj.insert(ins);
                
                         out.print(ins);
                
                
                   if(b)
          {
          
              response.sendRedirect("Medicine.jsp");
                
          }
                     
           else
            {
           out.println(b);
          }  }
        }
        
        
        %>
        
    <center><form name="frm1" method="">
            <input type="hidden" name="hid" value="<%=Editid%>">
<table width="">

    <th><u><b>Medicine Details</b></u></th>
    
	<tr>
            <td>Medicine Name</td><td><input type="text"  value="<%=medname%>"   id="medname" name="txt_medname" ></td>
	</tr>
         <tr>
                         <td> Medicine Type</td><td><select id="medtypeid" name="medtypeid">
                            <option></option>
                        <%
                        String sel="select * from tbl_medicinetype";
                        ResultSet rs=obj.select(sel);
                        while(rs.next())
                             {%>
                        <option value="<%=rs.getString("medtype_id")%>" <% if(medtypeid.equals(rs.getString("medtype_id"))){%>selected=""<%}%><%=rs.getString("medtype_type")%></option>
                               <%
                                 }
                               %>
                             </tr></td>
                        <tr>
                         <td>Brand Name</td><td><select id="brandid" name="brandid">
                            <option></option>
                        <%
                        String sel1="select * from tbl_brand";
                        ResultSet rs1=obj.select(sel1);
                        while(rs.next())
                             {%>
                        <option value="<%=rs1.getString("brand_id")%>" <% if( brandid.equals(rs1.getString("brand_id"))){ %>selected=""<%}%><%=rs1.getString("brand_name")%></option>
                               <%
                                 }
%> 
                    </td>
                </tr>
         
                         <tr>
                             <td>Medicine Price<input type="text"  value= "<%=price1%>"   id="medname" name="price" >
                                 
                             </td>
                         </tr>
                         <tr>
                             <td>Sales Rate<input type="text"  value="<%=sales1%>"   id="medname" name="sales" >
                         </tr>
	<tr>
	<td><input type="submit" id="btn_submit" name="btn_submit" value="Ok"></td>
	<td><input type="reset" id="btn_reset" name="btn_reset" value="Cancel"</td>
	</tr>
	</table>
            <table border=".1">
                
            </table>
                          <table border=".1">
                              <tr><th>View the Medicine Brands</th></tr>
                              <tr> <td>Medicine Name</td> <td> Medicine Type</td><td> Brand Name</td><td>Medicine Price </td><td> Sales Rate</td></tr>
                <%
                    String sel5="select * from tbl_medicine m,tbl_brand b,tbl_medicinetype mt where m.brand_id=b.brand_id and m.medtype_id=mt.medtype_id";
                    ResultSet rs3=obj.select(sel5);
                    while(rs3.next())
                    { %>
                    <tr>
                        
                        <td><%= rs3.getString("med_name")%></td>
                        <td><%=rs3.getString("medtype_type")%></td>
                        <td><%=rs3.getString("brand_name")%></td>
                        <td><%=rs3.getString("med_price")%></td>
                        <td><%= rs3.getString("med_srate")%></td>
                        
                        <td><a href="Medicine.jsp?eid=<%= rs3.getString("med_id")%>">Edit</a> </td>
                        <td><a href="Medicine.jsp?did=<%= rs3.getString("med_id")%>">Delete</a></td></tr>
               
                    <%     
                              }

                     %>
            </table>
</form>
	</center>
    </body>
</html>
