<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="Header.jsp" %>
<script src="jquery/jquery.min.js"></script>
<html>
    <head>
<script>
    
    
     function sel(type_id,brandid){
    
      $.ajax({url:"AjaxMedicine.jsp?type_id="+type_id+"&brand="+brandid,success:function(result){
      $("#ddl_med").html(result);
      }});
        }
    
    
    function del(tempid,ohid){
    
      $.ajax({url:"AjaxDel.jsp?tempid="+tempid+"&ohid="+ohid,success:function(result){
      $("#temp").html(result);
      }});
        }
    
    
    
     function getUnitPrice(medId){
    
      $.ajax({url:"Ajaxprice.jsp?medId="+medId,success:function(result){
              alert(result);
      $("#setprice").html(result);
      }});
        }
    
    
    function setTotal(qty,price){
    
    document.getElementById('settoatl').value=(qty*price);
        }
    
    
    
    
    function oder(ddl_medtype,ddl_med,txt_med,txt_settotal){
    
      $.ajax({url:"ajaxorder.jsp?ddl_medtype="+ddl_medtype+"&ddl_med="+ddl_med+"&txt_med="+txt_med+"&txt_settotal="+txt_settotal,success:function(result){
      $("#temp").html(result);
      }});
        }
    </script>

    </head>
        <body>
    <%
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        Date dt = new Date();
                        String dta = sdf.format(dt);
                        
                        
                        
    
    if(request.getParameter("btn_submit")!=null)
    {
       String totals="";
       boolean res=true;
       String oderDate=request.getParameter("date");
                    String OrderNo=request.getParameter("txt_orderno");
                    String grandTotal=request.getParameter("gt");
                    String SupId=request.getParameter("ddl_sup");
                    String ForDate=request.getParameter("fordate"); 
                    
                     String ins1="insert into tbl_orderhead(orderh_date,orderh_number,sup_id,orderh_fordate,grandtotal)values('"+oderDate+"','"+OrderNo+"','"+SupId+"','"+ForDate+"','"+grandTotal+"')";
                      boolean b1= obj.insert(ins1);
                     
                       if(b1==true) {
                                    
                        
                           
                      
     String sel="select * from tbl_temp ";
                        ResultSet rs=obj.select(sel); while(rs.next()){
                         String ins="insert into tbl_orderdetails(orderh_id,med_id,orderd_qty,unittotal)values('"+rs.getString("orderh_id")+"','"+rs.getString("med_id")+"','"+rs.getString("orderd_qty")+"','"+rs.getString("unittotal")+"')";
                        totals=rs.getString("unittotal");
                        //grant total shows null
                         boolean b= obj.insert(ins);
                          out.println(ins);
                         if(b)
                         {
               
                        
                
                          }
                      
                    else
                         {
                       res=false;
                         }

            }           
                   response.sendRedirect("Payment1.jsp");
                       }                 
                        if(res)
                        {  String del="delete from tbl_temp";
                        obj.insert(del);
                             response.sendRedirect("order.jsp"); 
                        }
                    
    }
                       
    
    
    
    
    
    
    
    
    
    
    
    %>
        
        <center><form>
<!--            <input type="hidden" name="hid" value="<">-->
                    <table width="">
                        <tr><th colspan="4"><h2 style="text-align: center">Purchase Medicine</h2></th></tr>
                    <tr>
                    <td>Date</td><td><input type="date" min="<%=dta%>"  id="date" name="date"></td>
                    </tr>
                    <tr>
                    <td>Supplier</td><td><select id="ddl_sup" onchange="sel(this.value)" name="ddl_sup">
                    <option>-----select-------</option>
                     <%
                        
                        String sel="select * from tbl_supplier";
                        ResultSet rs=obj.select(sel);
                        while(rs.next())
                        {%>
                        <option value="<%=rs.getString("sup_id")%>"> <%=rs.getString("sup_name")%></option>   
                        <%  
                          }
                    %>
                          </tr>
                    </table>
                                <table width="">
                               
                                    
                                    
                                    
                                     <tr>
                                <td>Brand</td><td><select id="ddl_medbrand" name="ddl_medtype">
                                <option>-----select-------</option>
                                 <%
                        
                                 String selbrand="select * from tbl_brand";
                                 ResultSet rsbrand=obj.select(selbrand);
                                 while(rsbrand.next())
                                    {%>
                                <option value="<%=rsbrand.getString("brand_id")%>"      > <%=rsbrand.getString("brand_name")%></option>   
                                     <%  
                                    }
                                    %></td>
                                    </tr>
                                    
                                    
                                     <tr>
                                <td>Medicine Type</td><td><select id="ddl_medtype" onchange="sel(this.value,ddl_medbrand.value)" name="ddl_medtype" >
                                <option>-----select-------</option>
                                 <%
                        
                                 String sel1="select * from tbl_medicineType";
                                 ResultSet rs1=obj.select(sel1);
                                 while(rs1.next())
                                    {%>
                                <option value="<%=rs1.getString("medtype_id")%>"      > <%=rs1.getString("medtype_type")%></option>   
                                     <%  
                                    }
                                    %>
                                    </select></td>
                                    </tr>
                                                                  
                                  
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    <tr id="">
                                     <td>Medicine</td><td><select id="ddl_med" onchange="getUnitPrice(this .value)" name="ddl_med">
                                     <option>-----select-------</option>
                                     <%
                                        String sel2="select * from tbl_medicine";
                                    ResultSet rs2=obj.select(sel2);
                                    while(rs2.next())
                                     {%>
                                     <option value="<%=rs2.getString("med_id")%>"     > <%=rs2.getString("med_name")%></option>   
                                     <%  
                                      }
                                    %>
                                         </select></td>
                                         <td><div id="setprice" name="pricevalue"></div></td>
                                    
                                    </tr>
                                    <tr>
                                        <td>Quantity</td><td><input type="text" value="" id="txt_med" onkeyup="setTotal(this.value,pricevalue.value)" name="txt_med" ><input type="text" name="txt_settotal" id="settoatl"></td>
                                    <tr><td><input type="button" id="btn_add" onclick="oder(ddl_medtype.value,ddl_med.value,txt_med.value,txt_settotal.value)"  name="btn_add" value="ADD"></td></tr>
                                    </table>
             <table border=".1">
             
            <td><input type="submit" id="btn_submit" name="btn_submit" value="Submit"></td>
            <td><input type="reset" id="btn_reset" name="btn_reset" value="Cancel"></td>
            </tr>
            </table>
                    
                    
                    <div id="temp">
                        
                        
                        
                        
                    </div>
                    
                    
                    
               
</form>
    </center>              
    </body>
</html>


