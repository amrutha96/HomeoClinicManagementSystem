<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Credit Card Form 1.0</title>
  
  
  
      <link rel="stylesheet" href="css/style.css">

  
</head>

<body>
    <%
    
     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        Date dt = new Date();
                        String dta = sdf.format(dt);

    
    
    
    %>
    
    
    
  <div class="card-container">
  <div class="card-wrapper"></div>

  <div class="form-container">
      <form action="HomePage.jsp">
      <label for="number">Card Number</label>
      <input placeholder="XXXX  XXXX  XXXX  XXXX" minlength="16" required="" maxlength="16"  type="text" name="number">
      <label for="name">Name on Card</label>
      <input placeholder="Full Name" required="" type="text" name="name"><br>

      <div class="cardForm-Field50">
        <label for="expiry">Expiry Date</label><rb>
        <input placeholder="MM/YY" min="<%=dta%>" required="" type="date" name="expiry" class="secondRow">
      </div>
      <div class="cardForm-Field50">
        <label for="cvc">Security Code</label><br>
        <input placeholder="XXX"  maxlength="3" required=""  minlength="3" type="text" name="cvc" class="secondRow incorrectInfo">
      </div>
        
        

      <!-- Button Default -->
      <input type="submit" value="Proceed" class="button CardDefault">
      
      <!-- Button Pay -->
    

      
    </form>
  </div>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://jquerycreditcardvalidator.com/jquery.creditCardValidator.js'></script>

    <script src="js/index.js"></script>

</body>
</html>
