<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jiangyw
  Date: 2018/10/30
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的简历</title>
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
                    <section class="scrollable wrapper">
                        <div class="">
                            <h4 class="m-t-none">我的简历 <a href="<%=basePath%>/user/resume" class="pull-right" style="font-weight: normal;font-size: 12px;">新建简历</a></h4>

                            <ul class="list-group gutter list-group-lg list-group-sp sortable">
                                <c:forEach var="item" items="${resumes}" varStatus="status">
                                    <li class="list-group-item"> <span class="pull-right" >   <a href="<%=basePath%>/user/resume?id=${item.resumeId}"><i class="fa fa-search icon-muted fa-fw" title="查看详情"></i></a> </span> <span class="pull-left media-xs"><i class="fa fa-sort text-muted fa m-r-sm"></i> ${status.index+1}</span>
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
</body>
</html>
