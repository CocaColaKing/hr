<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.jyw.hr.model.Visitor" %><%--
  Created by IntelliJ IDEA.
  User: jyw
  Date: 2018/10/30
  Time: 0:09
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    Visitor visitor = (Visitor) session.getAttribute("visitor");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="visitor" value="<%=visitor%>"/>
<div class="navbar-header aside-md">
    <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen" data-target="#nav"> <i class="fa fa-bars"></i> </a>
    <a href="<%=basePath%>/user/index" style="width: 300px;" class="navbar-brand" data-toggle="fullscreen"><%--<img src="images/logo.png" class="m-r-sm">--%>人力资源系统</a>
    <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".nav-user"> <i class="fa fa-cog"></i> </a>
</div>
<ul class="nav navbar-nav navbar-right hidden-xs nav-user">
    <li class="hidden-xs"><a href="#" class="dropdown-toggle dk" data-toggle="dropdown"> <i class="fa fa-bell"></i>
        <c:if test="${interviews.size()>0}">
        <span class="badge badge-sm up bg-danger m-l-n-sm">${interviews.size()}</span>
        </c:if>
    </a>
        <%--<c:if test="${interviews.size()<=0}">--%>
            <%--<span class="badge badge-sm up bg-danger m-l-n-sm"></span> </a>--%>
        <%--</c:if>--%>
        <section class="dropdown-menu aside-xl">
            <section class="panel bg-white">
                <header class="panel-heading b-light bg-light"><strong>你有 <span
                        >${interviews.size()}</span> 条面试通知</strong></header>
                <div class="list-group list-group-alt animated fadeInRight">
                    <c:forEach var="item" items="${interviews}">
                        <a href="#" class="media list-group-item"> <span
                                class="media-body block m-b-none"> ${item.note}<br>
                            <small class="text-muted"><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd"/> </small> </span> </a>
                    </c:forEach>
                </div>
            </section>
        </section>
    </li>

    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span
            class="thumb-sm avatar pull-left">  </span> ${visitor.loginName} <b class="caret"></b> </a>
        <ul class="dropdown-menu animated fadeInRight">
            <span class="arrow top"></span>
            <li><a href="<%=basePath%>/user/myResumes">我的简历</a></li>
            <li class="divider"></li>
            <li><a href="<%=basePath%>" <%--data-toggle="ajaxModal"--%> >登出</a></li>
        </ul>
    </li>
</ul>
