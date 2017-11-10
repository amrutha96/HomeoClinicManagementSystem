<%@include file="Header.jsp" %>
<!DOCTYPE html>
<html>
    <head> 
        <script>
           function validate()
          
          { 
         
            var status="true";
            
               var regfname=/^[A-Za-z ]{3,10}$/;
               var fname=document.getElementById('txt_medname').value;
               
               if((fname.match(regfname)))
               {
                    document.getElementById('valmed').innerHTML="";
                } 
                 else
               {
                    document.getElementById('valmed').innerHTML="Enter Medicine name!!";
                   status="false";
               }
               var regmedtype=/^[A-Za-z]{3,10}$/;
               var fmedtype=document.getElementById('ddl_medtypeid').value;
               if((fmedtype.match(regmedtype)))
               {
                    document.getElementById('valmedty').innerHTML="";
                } 
                 else
               {
                    document.getElementById('valmedty').innerHTML="Medicine Type Must be selected!!";
                   status="false";
               }
                var regbrand=/^[A-Za-z]{3,10}$/;
               var fbrand=document.getElementById('ddl_brandid').value;
               if((fbrand.match(regbrand)))
               {
                    document.getElementById('valbrand').innerHTML="";
                } 
                 else
               {
                    document.getElementById('valbrand').innerHTML="Brand Name Must be Selected!!";
                   status="false";
               }
                var regprice=/^[0-9]$/;;
                var price=document.getElementById('price').value;
               
              if((price.match(regprice)))
              {
                  document.getElementById('valprice').innerHTML="";
              }else
               {
                  document.getElementById('valprice').innerHTML="Enter Price";
                   status="false";
              }
                var regsale=/^[0-9]$/;
                var sale=document.getElementById('sales').value;
               
              if((sale.match(regsale)))
              {
                  document.getElementById('valsales').innerHTML="";
              }else
               {
                  document.getElementById('valsales').innerHTML="Enter sales amount";
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
             //  sales1=rs.getString("med_srate");
               
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
            String Medtypeid=request.getParameter("ddl_medtypeid");
            String Brandid=request.getParameter("ddl_brandid");
            String medprice=request.getParameter("price");
            //String sales=request.getParameter("sales");
            
            
                if(request.getParameter("hid")!="")
                {                    
                    String up="update tbl_medicine set med_name='"+medName+"',medtype_id='"+Medtypeid+"',brand_id='"+Brandid+"',med_price='"+medprice+"' where med_id='"+request.getParameter("hid")+"'";
                    boolean b=obj.insert(up);
                   
                                    if(b==true)
                        {
                            response.sendRedirect("Medicine.jsp");
                        }else
                      {
                        out.println(up);
                      }
                    }else{
                        String ins="insert into tbl_medicine(med_name,medtype_id,brand_id,med_price)values('"+medName+"','"+Medtypeid+"','"+Brandid+"','"+medprice+"')";
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
        
    <center><form>
            <input type="hidden" name="hid" value="<%=Editid%>">
<table width="">

    <th><u><b>Medicine Details</b></u></th>
    
	<tr>
            <td>Medicine Name</td><td><input type="text"  value="<%=medname%>"   id="txt_medname" name="txt_medname" ></td>
            <td><div style="color: red" id="valmed"></div></td>
	</tr>
         <tr>
                         <td> Medicine Type</td><td><select id="ddl_medtypeid" name="ddl_medtypeid" onchange="sel(this.value)">
                                 <option value="sel">-----select-------</option>
                   <%
                        
                        String sel="select * from tbl_medicinetype";
                        ResultSet rs=obj.select(sel);
                        while(rs.next())
                        {%>
                        <option value="<%=rs.getString("medtype_id")%>" <% if(medtypeid.equals(rs.getString("medtype_id"))) {%> selected="" <% } %>> <%=rs.getString("medtype_type")%></option>   
                        <%  
                          }
                    %>
                         </td>
                         <td><div style="color: red" id="valmedty"></div></td></tr>
                        <tr>
                         <td>Brand Name</td><td><select id="ddl_brandid" name="ddl_brandid">
                            <option>-----select-------</option>
                   <%
                        
                        String sel1="select * from tbl_brand";
                        ResultSet rs1=obj.select(sel1);
                        while(rs1.next())
                        {%>
                        <option value="<%=rs1.getString("brand_id")%>" <% if(brandid.equals(rs1.getString("brand_id"))) {%> selected="" <% } %>> <%=rs1.getString("brand_name")%></option>   
                        <%  
                          }
                    %>
                    
                    </td>
                    <td><div style="color: red" id="valbrand"></div></td>
                </tr>
         
                         <tr>
                             <td>Sales Rate</td><td><input type="text"  value= "<%=price1%>"   id="price" name="price" >
                                 
                             </td>
                             <td><div  style="color: red" id="valprice"></div></td>
                         </tr>
                        <!-- <tr>
                             <td></td><td><input type="text"  value="<%=sales1%>"   id="sales" name="sales" ></td>
                            <td><div style="color: red" id="valsales"></div></td></td>
                         </tr>-->
	<tr>
	<td><input type="submit" id="btn_submit"  onclick="" name="btn_submit" value="Ok"></td>
        <td><input type="reset" id="btn_reset" name="btn_reset" value="Cancel"></td>
	</tr>
	</table>
            <table border=".1">
                
            </table>
                          <table border=".1">
                              <tr><th>View the Medicine Brands</th></tr>
                              <tr> <td>Medicine Name</td> <td> Medicine Type</td><td> Brand Name</td><td> Sales Rate</td></tr>
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
