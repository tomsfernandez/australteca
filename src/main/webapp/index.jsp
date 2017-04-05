<%@ page import="org.securityfilter.example.Constants"%>
<%@ page import="org.securityfilter.example.MyConstants" %>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title><%=MyConstants.MY_HOME_TITLE%></title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/loginForm.css" rel="stylesheet" type="text/css">
    </head>

    <body>
        <%@include file="/mainMenu/mainMenu.jsp" %>
        Welcome to the Security Filter example application. Use the menu above to navigate the site.

        <h2>POST to the Secure Page</h2>
        This form POSTs to the Secure Page. By entering a value here
        and clicking the submit button below, you can
        verify that POSTed parameters are maintained through the login sequence.

        <form id="<%=Constants.HOME_FORM_ID%>"
              action="<%=response.encodeURL(request.getContextPath() + "/securePage.jsp")%>" method="POST">
            <input type="text" name="<%=Constants.HOME_POST_FIELD%>">
            <input type="submit">
        </form>
    </body>

</html>