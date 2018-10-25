<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html class="bg-dark">
<head>
    <title>登录</title>
    <%--<base href="<%=basePath%>">--%>
    <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link rel="stylesheet" href="<%=basePath%>/css/app.v2.css" type="text/css" />
    <link rel="stylesheet" href="<%=basePath%>/css/app.css" type="text/css" />
    <%--<link rel="stylesheet" href="<%=basePath%>/css/font.css" type="text/css" cache="false" />--%>
</head>
<body>
<section id="content" class="m-t-lg wrapper-md animated fadeInUp">
    <div class="container aside-xxl"> <a class="navbar-brand block" href="#"> </a>
        <section class="panel panel-default bg-white m-t-lg">
            <header class="panel-heading text-center"> <strong>人力资源系统</strong> </header>
            <form id="loginForm" class="panel-body wrapper-lg" method="post" enctype="multipart/form-data" onsubmit="return login()">
                <div class="form-group">
                    <label class="control-label">帐号</label>
                    <input type="text" name="loginName" placeholder="" onfocus="this.placeholder=''" onblur="this.placeholder=''" class="form-control input-lg">
                </div>
                <div class="form-group">
                    <label class="control-label">密码</label>
                    <input type="password" name="password" id="inputPassword" onfocus="this.placeholder=''" onblur="this.placeholder=''" placeholder="" class="form-control input-lg">
                </div>
                <%--<div class="checkbox">--%>
                <%--<label>--%>
                <%--<input type="checkbox">--%>
                <%--Keep me logged in </label>--%>
                <%--</div>--%>
                <%--<a href="#" class="pull-right m-t-xs"><small>Forgot password?</small></a>--%>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">登录</button>
                    <a href="user/register" class="pull-right m-t-xs" onclick="javascript:void (0)"><small>注册</small></a>
                </div>
                <%--<div class="line line-dashed"></div>--%>
                <%--<a href="#" class="btn btn-facebook btn-block m-b-sm"><i class="fa fa-facebook pull-left"></i>Sign in with Facebook</a> <a href="#" class="btn btn-twitter btn-block"><i class="fa fa-twitter pull-left"></i>Sign in with Twitter</a>--%>
                <%--<div class="line line-dashed"></div>--%>
                <%--<p class="text-muted text-center"><small>Do not have an account?</small></p>--%>
                <%--<a href="signup.html" class="btn btn-default btn-block">Create an account</a>--%>
                <div class="text-center m-t-md" style="color: red" id="dangerMsg"></div>
            </form>
        </section>
    </div>
</section>
<!-- footer -->
<footer id="footer">
    <div class="text-center padder">
        <p> <small>iotek<br>
            &copy; 2018</small> </p>
    </div>
</footer>
<script src="<%=basePath%>/js/app.v2.js"></script>
<script src="<%=basePath%>/js/app.js"></script>
<script src="<%=basePath%>/js/jquery.form.min.js"></script>
<script>
    if("<%=request.getParameter("msg")%>"==="error"){
        $("#dangerMsg").html("用户名或密码错误");
    }

    if("<%=request.getAttribute("fail")%>"==="fail"){
        alert("登录过期，请重新登录");
    }

    checkBrowser();

    function login() {
        checkBrowser();


        if($("input[name='account']").val()===""){
            alert("用户名不能为空");
            return false;
        }
        if($("input[name='password']").val()===""){
            alert("密码不能为空");
            return false;
        }
        loading();
        $("#loginForm").ajaxSubmit({
            url:"<%=basePath%>/login/login",
            dataType:"json",
            success:function (res) {
                loadingEnd();
                if(res == 0){
                    alert("用户名或密码错误")
                }else if(res == 1 ){
                    alert("登录成功");
                }
                <%--if(res.result==-1){--%>
                    <%--alert("用户名或密码错误");--%>
                <%--}else if(res.result==-2){--%>
                    <%--alert("帐号未通过审核，需要联系管理员");--%>
                <%--}else if(res.result==0){--%>
                    <%--location.href="<%=basePath%>/member/index";--%>
                <%--}else if(res.result==1){--%>
                    <%--location.href="<%=basePath%>/admin/index";--%>
                <%--}else {--%>
                    <%--location.href="<%=basePath%>/bid_open/index";--%>
                <%--}--%>
            },
            error:function () {

            }
        });
        return false;
    }

    function register() {
        checkBrowser();
        window.open("<%=basePath%>/member/register");
    }

    function checkBrowser() {
        var Sys = {};
        var ua = navigator.userAgent.toLowerCase();
        console.log(ua);
        var s;
        (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
            (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
                (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
                    (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
                        (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;

        if (Sys.ie) {
            if (confirm("浏览器版本过旧，请使用Chrome内核浏览器。点击“确定”按钮下载")) {
                window.open("http://chrome.360.cn/index8.html");
            }
        }
    }



</script>
</body>
</html>