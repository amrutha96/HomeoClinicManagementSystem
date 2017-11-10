<%@page import="java.util.*"%>
<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>
<%
ArrayList<String> medicinelist=new ArrayList<String>();
String sel="select * from tbl_medicine";
ResultSet rs=obj.select(sel);
while(rs.next())
{
  medicinelist.add(rs.getString("med_name"));
}
String s=request.getParameter("txtmedname");
        
            for(String st:medicinelist)
            {
                if(st.toLowerCase().startsWith(s.toLowerCase()))
                {
                    out.println(st);
                }
            }

%>