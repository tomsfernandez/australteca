<%@ page import="org.australteca.Constants"%>
<%@ page import="static org.australteca.Constants.LOGIN_FORM_ACTION" %>
<%@ page import="static org.australteca.Constants.LOGIN_FORM_ID" %>
<%@ page import="static org.australteca.Constants.NAME_PARAM" %>
<%@ page import="static org.australteca.Constants.*" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title><%=Constants.MY_HOME_TITLE%></title>
  <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="css/loginForm.css" rel="stylesheet" type="text/css">
</head>

<body>

<div class="principal">
<nav class="navbar navbar-inverse container-fluid" role="navigation">
  <div>
    <div class="navbar-header "> 
         <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target=".navbar-ex1-collapse">
          <span class="sr-only">Desplegar navegacion</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
    	<a class="navbar-brand"><img class="logo" src="images/logo.png"></a>
    </div>
    
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <form class="navbar-form navbar-right" id="<%=LOGIN_FORM_ID%>" action="<%=response.encodeURL(LOGIN_FORM_ACTION)%>" method="POST">
          <div class="form-group">
            <label id="email"for="email">Email</label>
            <input type="email" name="<%=Constants.LOGIN_USERNAME_FIELD%>">
          </div>
          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" name="<%=Constants.LOGIN_PASSWORD_FIELD%>">
          </div>
          <input type="Submit" class="btn btn-default btn-xs"  value="Iniciar sesion">
        </form>
      <% if(session.getAttribute("loginSucceded") != null && !(boolean) session.getAttribute("loginSucceded")){%>
        <!-- hacer algo -->
        <% }%>
        <% session.removeAttribute("loginSucceded"); %>
    </div>
  </div>
</nav>





<form id="<%=Constants.REGISTER_FORM_ID%>" action="/register" method="POST">
    <div class="container-fluid">
      <div class="row centered-form  ">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">Registrate <small>Es gratis! Y siempre lo sera!</small></h3>
            </div>
            <div class="panel-body">
              <form role="form">
                <div class="row">
                  <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                      <input type="text" name= "<%=NAME_PARAM%>" class="form-control input-sm" placeholder="Nombre" required/>
                    </div>
                  </div>
                  <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                      <input type="text" name= "<%=LAST_NAME_PARAM%>" class="form-control input-sm" placeholder="Apellido" required/>
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <input type="email" name= "<%=EMAIL_PARAM%>" pattern="^[A-Za-z0-9._%-]+@ing.austral.edu.ar"
                         placeholder="Email: ejemplo@ing.austral.edu.ar" class="form-control input-sm" required/>
                </div>

                <div class="row">
                  <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                      <input type="password" name="<%= PASSWORD_PARAM%>" pattern=".{0}|.{8,}" id="password" class="form-control input-sm"
                             placeholder="Contrasena"  required title="Mínimo 8 caracteres"/>
                    </div>
                  </div>
                  <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                      <input type="password" name="<%= PASSWORD_CONFIRMATION_PARAM%>" pattern=".{0}|.{8,}" class="form-control input-sm"
                             placeholder="Confirmar contrasena"  required title="Mínimo 8 caracteres"/>
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <select class="select form-control" name="<%=CAREER_PARAM%>">
                    <option value="<%=INGENIERIA_INF_VALUE%>" selected>Ingenieria informatica</option>
                    <li class="divider"></li>
                    <option value="<%= INGENIERIA_IND_VALUE%>">Ingenieria indutrial</option>
                  </select>
                </div>

                <input type="submit" value="Unirme!" class="form-control btn btn-info btn-block">

              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
</form>

  <div class="lema">
    <h2>Una comunidad para compartir lo que conoces.</h2>
    <h2>Y buscar lo que no sabes.</h2>

  </div>

</div>


<footer class="footPage">
  <div class="container">
    <p> Todos los derechos reservados </p>
  </div>
</footer>


<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>

<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>