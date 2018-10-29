<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jiangyw
  Date: 2018/10/29
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>游客主页</title>
    <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link rel="stylesheet" href="<%=basePath%>/css/app.v2.css" type="text/css" />
</head>
<body>
<section class="vbox">
    <header class="bg-dark dk header navbar navbar-fixed-top-xs">
        <jsp:include page="/user/header"/>
    </header>
    <section>
        <section class="hbox stretch">

            <section id="content">
                <section class="vbox">
                    <header class="header bg-light bg-gradient b-b">
                        <p>List groups</p>
                    </header>
                    <section class="scrollable wrapper">
                        <div class="">
                            <h4 class="m-t-none">招聘信息列表</h4>
                            <ul class="list-group gutter list-group-lg list-group-sp sortable">
                                <c:forEach var="item" items="${recruitments}" varStatus="status">
                                    <li class="list-group-item"> <span class="pull-right" >   <a href="<%=basePath%>/user/recruitment?id=${item.recruitmentId}"><i class="fa fa-search icon-muted fa-fw" title="查看详情"></i></a> </span> <span class="pull-left media-xs"><i class="fa fa-sort text-muted fa m-r-sm"></i> ${status.index+1}</span>
                                        <div class="clear"> ${item.title} </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>


                    </section>
                </section>
                <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a> </section>
            <aside class="bg-light lter b-l aside-md hide" id="notes">
                <div class="wrapper">Notification</div>
            </aside>
        </section>
    </section>
</section>
<script src="<%=basePath%>/js/app.v2.js"></script>
</body>
</html>
