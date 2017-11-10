<%-- 
    Document   : AjaxNextPatient
    Created on : Nov 6, 2017, 12:03:25 PM
    Author     : student22
--%>



<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>

 <%
            String opNumber = "";
            String name = "";
            int count=Integer.parseInt(request.getParameter("count"));
            String token=request.getParameter("tocken");
            String tocken[] = token.split(",");
            String id=request.getParameter("opid");
            String insq="insert into tbl_prescriptionhead(doctor_Id,pat_opnumber,prescriptionHead_date) values('"+session.getAttribute("did")+"','"+id+"',CURDATE())";
            boolean b=obj.insert(insq);
            String prescriptionHead_id=""; 
            String selq="select MAX(prescriptionHead_id) as prescriptionHead_id from tbl_prescriptionhead where doctor_Id='"+session.getAttribute("did")+"' and prescriptionHead_date=CURDATE()";
            ResultSet rsq=obj.select(selq);
            if(rsq.next())
            {
                prescriptionHead_id=rsq.getString("prescriptionHead_id");
            }
            
            
            
            String del="delete from tbl_temppresciption where doctor_id='"+session.getAttribute("did")+"'";
            obj.insert(del);
            
            
            
            
            
            String sel="select * from tbl_temppresciption where doctor_id='"+session.getAttribute("did")+"' ";
            ResultSet rs=obj.select(sel);
            while(rs.next())
            {
                String insdet="insert into tbl_prescriptiondetails (prescriptionDetails_desc,prescriptionDetails_otherdata,prescriptionDetails_qrty,medicine_id) values('"+rs.getString("tempPresciption_pres")+"','"+rs.getString("tempPresciption_other")+"','"+rs.getString("tempPresciption_qty")+"','"+rs.getString("medicine_id")+"')";
           obj.insert(insdet);
            
            }
            
            
            
            
            
            
            
            
            
            
            if(count<tocken.length){
            String selpat = "select * from tbl_booking b,tbl_patient p where b.op_number=p.pat_opnumber and b.book_tocken='" + tocken[count] + "' and b.book_date=CURDATE() and b.doctor_id='" + session.getAttribute("did") + "'";
            ResultSet rspat = obj.select(selpat);
            if (rspat.next()) {
                opNumber = rspat.getString("pat_opnumber");
                name = rspat.getString("pat_name");
            

        %>
<div>
            <div style="border: 1px #a9302a solid;margin-left: 500px;max-width: 500px;padding: 10px" >
                <table>
                    <tr>
                        <th>OP Number</th><td><input type="text" name="txtOp" value="<%=opNumber%>"> </td>
                    </tr>
                    <tr>
                        <th>Patient Name</th><td><%=name%></td>
                    </tr>
                    <tr ><td colspan="3"><input type="button" name="btn_next" value="Next>>" onclick="next(txtOp.value,hidTocken.value)"></td></tr>
                </table>

            </div>
                    <div style="border: 1px #a9302a solid;margin-left: 500px;max-width: 500px;padding: 10px">
                        <table>
                            <tr><td>Medicine Name</td><td> <input type="text" id="txtmedname" name="txtmedname" ></td></tr>
                            <tr><td>Quantity</td><td> <input type="text" name="txtmedqty" ></td></tr>
                            <tr><td>Prescription</td><td> <textarea name="txtmedpres"></textarea></td></tr>
                             <tr><td>Other Data</td><td> <textarea name="txtmeddata"></textarea></td></tr>
                             <tr ><td colspan="3"><input type="button" name="btn_next" value="Add>>" onclick="addPres(txtmedname.value,txtmedqty.value,txtmedpres.value,txtmeddata.value)"></td></tr>
                        </table>
                    </div>

        </div>
                    <%}}
                    
                    else
{
out.print("No Patients Available...");
}
                    
                    
                    %>