<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="org.australteca.Constants" %>
<%@ page import="static org.australteca.Constants.USER_SUBJECT_LIST" %>
<%@ page import="static org.australteca.Constants.USER_SUBJECT_LIST" %><%--
  Created by IntelliJ IDEA.
  User: tomasforman
  Date: 29/3/17
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale1.0">
    <title><%=Constants.MY_HOME_TITLE%></title>
    <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/css/mainMenu.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/css/home.css"/>" rel="stylesheet" type="text/css">

</head>
<body>
    <div class="active-home">
        <%@include file="/jsp/mainMenu.jsp" %>
    </div>

    <div class="container">
        <div class="col-sm-12">

            <!---------------- subjects ------------->
            <div class="bs-calltoaction bs-calltoaction-subjects">
                <div class="row">
                    <div class="panel-heading">
                        <h1 class="cta-title">Mis materias</h1>
                    </div>
                    <div class="panel-body">
                        <c:set var="subjectListParam" value="<%=USER_SUBJECT_LIST%>"/>
                        <c:set var="subjectList" value='${requestScope[subjectListParam]}' />
                        <c:forEach items="${subjectList}" var="subject">
                            <div class="col col-md-4">
                                <a href="<c:url value="/servlet/postSubject?subjectName=${subject.subjectName}"/>" class="btn btn-lg btn-block btn-primary"><c:out value="${subject.subjectName}"/></a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!--------------- Work --------------->
            <div class="bs-calltoaction bs-calltoaction-work">
                <div class="row">
                    <div class="panel-heading">
                        <h1 class="cta-title">Mis Proyectos</h1>
                    </div>

                    <div class="panel-body">

                            <c:set var="publicationListParam" value="<%=Constants.USER_PUBLICATION_LIST%>"/>
                            <c:set var="publicationList" value="${requestScope[publicationListParam]}"/>
                            <c:forEach var="publication" items="${publicationList}" varStatus="loop">
                                <c:set var="role" value="Trabajo"/>
                                <%--<c:if test="${publication.role == role}">--%>
                                    <div id="publicationPanel${loop.count}" class="col col-md-6">
                                        <div id="publication${loop.count}" class="favoriteWork">
                                            <div class="panel-heading work-heading clearfix">
                                                <h4 class="pull-left"><c:out value="${publication.name}"/> </h4>


                                                <c:set var="remoteUser" value="<%=request.getRemoteUser()%>"/>
                                                <c:if test="${publication.author.email != remoteUser}">
                                                <div class="checkbox_wrapper pull-right">
                                                    <input class="checkbox" type="checkbox" id="favoriteWork${loop.count}" checked onclick="changeFavorite('${publication.id}', 'favoriteWork${loop.count}', 'publicationPanel${loop.count}')">
                                                    <label></label>
                                                </div>
                                                </c:if>
                                                <c:if test="${publication.author.email == remoteUser}">
                                                    <button type="button" id="deleteButton" class="btn btn-default btnremovework pull-right"  onclick="removePublication('${publication.id}', 'publicationPanel${loop.count}')"><i class="glyphicon glyphicon-trash"></i></button>
                                                </c:if>


                                            </div>
                                            <div class="arrow-down"></div>
                                            <div class="panel-body">

                                            <p><c:out value="${publication.description}"/></p>

                                            <div class="panel-body showMore" id="show${publication.name}" hidden>
                                                <p><c:out value="${publication.requirements}"/></p>
                                                <p><c:out value="${publication.tasks}"/></p>
                                                <button type="button" class="btn btn-success pull-right" onclick="modalBox(document.getElementById('sendRequest'))">Enviar peticion</button>
                                            </div>

                                            <button type="button" class="btn btn-default btn-show-more pull-right" onclick="show('#show${publication.name}')"><i>Mostrar mas</i></button>
                                            </div>
                                        </div>
                                    </div>
                                <%--</c:if>--%>
                            </c:forEach>





                    </div>
                </div>
            </div>


            <!------------- Activity------------>
            <div class="bs-calltoaction bs-calltoaction-statistics">
                <div class="row">
                    <div class="panel-heading">
                        <h1 class="activity-title">Mi actividad</h1>
                    </div>
                    <div class="panel-body">
                        <div class="col col-md-4 center-column">
                            <h4>Archivos compartidos</h4>
                            <div class="circle-file activity-1">
                                <p>12</p>
                            </div>
                        </div>
                        <div class="col col-md-4 center-column">
                            <h4>Archivos descargados</h4>
                            <div class="circle-file activity-3">
                                <p>45</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


        </div>
    </div>


    <script type="text/javascript" src="<c:url value="/js/jquery-3.2.0.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/bootstrap.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/home.js"/>"></script>
</body>
</html>
