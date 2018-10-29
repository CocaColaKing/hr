<%--
  Created by IntelliJ IDEA.
  User: jyw
  Date: 2018/10/30
  Time: 0:09
  To change this template use File | Settings | File Templates.
--%>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul class="nav navbar-nav navbar-right hidden-xs nav-user">
    <li class="hidden-xs"> <a href="#" class="dropdown-toggle dk" data-toggle="dropdown"> <i class="fa fa-bell"></i> <span class="badge badge-sm up bg-danger m-l-n-sm count">2</span> </a>
        <section class="dropdown-menu aside-xl">
            <section class="panel bg-white">
                <header class="panel-heading b-light bg-light"> <strong>You have <span class="count">2</span> notifications</strong> </header>
                <div class="list-group list-group-alt animated fadeInRight"> <a href="#" class="media list-group-item"> <span class="pull-left thumb-sm"> <img src="images/avatar.jpg" alt="John said" class="img-circle"> </span> <span class="media-body block m-b-none"> Use awesome animate.css<br>
              <small class="text-muted">10 minutes ago</small> </span> </a> <a href="#" class="media list-group-item"> <span class="media-body block m-b-none"> 1.0 initial released<br>
              <small class="text-muted">1 hour ago</small> </span> </a> </div>
                <footer class="panel-footer text-sm"> <a href="#" class="pull-right"><i class="fa fa-cog"></i></a> <a href="#notes" data-toggle="class:show animated fadeInRight">See all the notifications</a> </footer>
            </section>
        </section>
    </li>

    <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span class="thumb-sm avatar pull-left">  </span> John.Smith <b class="caret"></b> </a>
        <ul class="dropdown-menu animated fadeInRight">
            <span class="arrow top"></span>
            <li> <a href="<%=basePath%>/user/resume">编辑简历</a> </li>
            <li class="divider"></li>
            <li> <a href="modal.lockme.html" data-toggle="ajaxModal" >登出</a> </li>
        </ul>
    </li>
</ul>
