<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>
<html lang="en">
<head>
<title>Wecare</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://platform.twitter.com/widgets.js"></script>
<script src="assets/js/jquery.js"></script>
<script src="assets/js/google-code-prettify/prettify.js"></script>
<script src="assets/js/bootstrap-transition.js"></script>
<script src="assets/js/bootstrap-alert.js"></script>
<script src="assets/js/bootstrap-modal.js"></script>
<script src="assets/js/bootstrap-dropdown.js"></script>
<script src="assets/js/bootstrap-scrollspy.js"></script>
<script src="assets/js/bootstrap-tab.js"></script>
<script src="assets/js/bootstrap-tooltip.js"></script>
<script src="assets/js/bootstrap-popover.js"></script>
<script src="assets/js/bootstrap-button.js"></script>
<script src="assets/js/bootstrap-collapse.js"></script>
<script src="assets/js/bootstrap-carousel.js"></script>
<script src="assets/js/bootstrap-typeahead.js"></script>
<script src="assets/js/bootstrap-affix.js"></script>
<script src="assets/js/application.js"></script>
<script src="assets/js/superfish.js"></script>
<script src="assets/js/custom.js"></script>
<script>
$(document).ready(function () {
    var showCaseItems = $('.show-case-item').hide();
    var splashes = $('.splash').hide();
    splashes.eq(0).show();
    showCaseItems.eq(0).show();
    var prevIndex = -1;
    var nextIndex = 0;
    var currentIndex = 0;
    $('#banner-pagination li a').click(function () {
        nextIndex = parseInt($(this).attr('rel'));
        if (nextIndex != currentIndex) {
            $('#banner-pagination li a').html('<img src="assets/img/slidedot.png" alt="slide">');
            $(this).html('<img src="assets/img/slidedot-active.png" alt="slide">');
            currentIndex = nextIndex;
            if (prevIndex < 0) prevIndex = 0;
            splashes.eq(prevIndex).css({
                opacity: 1
            }).animate({
                opacity: 0
            }, 500, function () {
                $(this).hide();
            });
            splashes.eq(nextIndex).show().css({
                opacity: 0
            }).animate({
                opacity: 1
            }, 500, function () {});
            showCaseItems.eq(prevIndex).css({
                opacity: 1
            }).animate({
                opacity: 0
            }, 500, function () {
                $(this).hide();
                showCaseItems.eq(nextIndex).show().css({
                    opacity: 0
                }).animate({
                    opacity: 1
                }, 200, function () {});
            });
            prevIndex = nextIndex;
        }
        return false;
    });
});
</script>
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="assets/css/docs.css" rel="stylesheet">
<link href="assets/js/google-code-prettify/prettify.css" rel="stylesheet">
<!--[if lt IE 9]>
<script src="assets/js/html5.js"></script>
<![endif]-->
<link rel="shortcut icon" href="assets/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
</head>
<body data-spy="scroll"  data-target=".bs-docs-sidebar">
<div class="jumbotron masthead" style="min-height: 600px">
  <div class="splash"> <img src="assets/img/home-banner-bg.jpg" alt=""> </div>
    <div class="nav-agency">
    <div class="navbar navbar-static-top">
      <div class="navbar-inner">
          <div class="container"> <a class="brand" href="index.html"> <img src="assets/img/images.jpg" alt="" width="100"></a>
          <div id="main-nav">
            <div class="nav-collapse collapse">
              <ul class="nav">
                  <li class="active"><a href="../GUEST/Login.jsp">Home</a> </li>
                                                
               
                  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> Feedback <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                      <li><a href="../GUEST/feedback.jsp">View Feedback</a></li>
                                     </ul>
                </li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> Registration <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                     <li><a href="brand.jsp"> Brand</a><br></li>
                      <li><a href="MedicineType.jsp"> Medicine Type</a><br></li>
                      </ul>
                </li>
                 <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> Schedule My Day <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="Doctorscheduling.jsp">Schedule</a></li>
                                     </ul>
                </li>
                  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> Feedback <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                      <li><a href="../GUEST/feedback.jsp">View Feedback</a></li>
                                     </ul>
                </li>
                
                
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>