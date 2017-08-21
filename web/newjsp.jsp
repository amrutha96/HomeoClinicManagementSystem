
<jsp:useBean id="obj" class="db_student.db_connection"> </jsp:useBean>
<html>
<head>
<script>
	function  fname()
		{
		var x1=document.getElementById("p1").value;
		var x2=document.getElementById("p2").value;
		if(document.getElementById("name").value==="")
		{
			alert("!!name must be filled!!!!!!");
		}
		else if(document.getElementById("txa1").value==="")
		{
			alert("!!address must be filled!!!!!!");
			}
 		else if(document.getElementById("txa2").value==="")
{
alert("!!email must be filled!!!!!!");
}
else if((frm1.gen[0].checked===false)&&(frm1.gen[1].checked===false))
{
    alert("select gender");
}
else if(document.getElementById("se").value==="select")
{	
alert("!!select qualification !!!!!!");
}
else if(document.getElementById("p1").value==="")
{	
alert("!!password must be filled!!!!!!");
}
else if(document.getElementById("p2").value==="")
{	
alert("!!re enter pswd must be filled!!!!!!");
}
else if(x1===x2)
{
alert("sucess");

}
else
{
alert("not match");
}
}

	</script>
</head>

<body>
    <%
        String submit=request.getParameter("btsubmit");
        if(submit!=null)
        {
            String name=request.getParameter("Name");
            String addr=request.getParameter("textarea1");
            String gend=request.getParameter("gen");
            String emai=request.getParameter("textarea2");
            String qua=request.getParameter("select");
            String pswd1=request.getParameter("password");
            String ins= "insert into tbl_student(std_name,std_address,std_gen,std_email,std_qua,std_pswd)values('"+name+"','"+addr+"','"+gend+"','"+emai+"','"+qua+"','"+pswd1+"')";
            boolean b=obj.insert(ins);
            System.out.println(b);
        }
        %>
<form  name="frm1" >
<center>
	<table>

<th>REGISTRATION FORM</th>
		<tr>
                    <td>name</td><td><input type="text" id="name" name="Name"></td>
		</tr>
			<tr>
			<td>address</td><td><textarea id="txa1" name="textarea1"></textarea></td>
			</tr>
				<tr>
				<td>Gender</td><td> <input type="radio" value="mail" id="r1" name="gen">male</td>
				<td><input type="radio" id="r1" value="female" name="gen">female</td>
				</tr>
		<tr>
			<td>Email</td><td><input type="email" id="txa2" name="textarea2"></td>
		</tr>
		<tr>
			<td>Qualification</td><td>
                            <select id="sel_reg" name="sel_reg">
                               <option value="select">select</option> 
			<option value="BTech">BTech</option>
			<option value="MCA">MCA</option>
			<option value="MBA">MBA</option></select>
			</td>
		</tr>
		<tr>
			<td>Password</td><td><input type="password" id="p1" name="password"></td>
		</tr>
		<tr>
			<td>Re enter password</td><td><input type="password" id="p2" name="repswd" ></td>
		</tr>
		<tr>
			<td><input type="submit" id="b1" value="submit" name="btsubmit" onclick="fname()"></td>
			<td><input type="reset" id="b2" value="reset" name="btreset"></td></tr>
	</table>
	</center>
	</form>
	</body>
	</html>
