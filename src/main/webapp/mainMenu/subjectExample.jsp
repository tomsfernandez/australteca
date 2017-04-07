<%@ page import="org.securityfilter.example.MyConstants" %><%--
  Created by IntelliJ IDEA.
  User: tomasforman
  Date: 6/4/17
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <title><%=MyConstants.MY_HOME_TITLE%></title>
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/css/mainMenu.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery-3.2.0.min.js"></script>
</head>
<body>
<%@include file="/mainMenu/mainMenu.jsp" %>


<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel with-nav-tabs panel-default">
                <div class="panel-heading">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab1default" data-toggle="tab">Apuntes</a></li>
                        <li><a href="#tab2default" data-toggle="tab">Profesores</a></li>
                        <li><a href="#tab3default" data-toggle="tab">Comentarios</a></li>
                    </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1default">Default 1</div>
                        <div class="tab-pane fade" id="tab2default">Default 2</div>
                        <div class="tab-pane fade" id="tab3default">Default 3</div>
                        <div class="tab-pane fade" id="tab4default">Default 4</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript" src="/js/bootstrap.min.js"></script>


</body>
</html>
