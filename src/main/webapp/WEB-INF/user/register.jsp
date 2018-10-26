<%--
  Created by IntelliJ IDEA.
  User: jyw
  Date: 2018/10/25
  Time: 23:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html lang="zh-CN" class="app">
<head>
    <meta charset="utf-8"/>
    <%--<base href="<%=basePath%>">--%>
    <title>会员注册</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <link href="<%=basePath%>/css/app.v2.css" rel="stylesheet"/>
    <link href="<%=basePath%>/css/app.css" rel="stylesheet"/>
    <link  href="<%=basePath%>/js/sweetalert2/sweetalert2.css" rel="stylesheet"/>

    <style>
        .contact-form {
            font-size: 12px;
        }

        .contact-form .row {
            margin: 10px 0;
        }

        .contact-form .row label select {
            display: inline-block;
            line-height: 34px;
        }

        .table td {
            vertical-align: middle !important;
        }
        .half{
            width: 40%;
            display: inline-block;
            padding: 0 12px;
            line-height: 30px;
        }
    </style>

</head>
<body>
<article class="vbox">
    <section>
        <section class="hbox stretch">
            <section id="content">
                <section class="vbox">
                    <section class="scrollable">
                        <ul class="breadcrumb no-border no-radius b-b b-light pull-in text-center">
                            <li>
                                <a href="#">会员注册</a>
                            </li>
                        </ul>
                        <section class="">
                            <section class="scrollable wrapper w-f">
                                <section class="panel panel-default padder padder-v">
                                    <form id="infoForm" action="<%=basePath%>/user/ajaxRegister" method="post" enctype="multipart/form-data" class="form-horizontal" onsubmit="return addMember()">
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">登录名:</label>
                                            <div class="col-sm-2">
                                                <input name="loginName" class="form-control must-write-input" placeholder="" onkeyup="value=value.replace(/\s+/,'')"/><span class="must-write text-center">*</span>
                                            </div>

                                            <label class="col-sm-1 control-label">密码:</label>
                                            <div class="col-sm-2">
                                                <label>
                                                    <input id="pwd1" name="pwd" type="password" class="form-control must-write-input" value="" placeholder="" onkeyup="value=value.replace(/\s+/,'')"/><span class="must-write text-center">*</span>
                                                </label>
                                            </div>

                                            <label class="col-sm-1 control-label">确认密码:</label>
                                            <div class="col-sm-2">
                                                <label>
                                                    <input id="pwd2" type="password" class="form-control must-write-input" value="" placeholder="" onkeyup="value=value.replace(/\s+/,'')"/><span class="must-write text-center">*</span>
                                                </label>
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">昵称:</label>
                                            <div class="col-sm-2">
                                                <input name="nikename" class="form-control" value="" placeholder="" onkeyup="value=value.replace(/\s+/,'')">
                                            </div>


                                            <label class="col-sm-1 control-label">手机号码:</label>
                                            <div class="col-sm-2">
                                                <input class="form-control must-write-input" name="mobile" value="" placeholder="" onkeyup="value=value.replace(/\D/g,'')"><span class="must-write text-center">*</span>
                                            </div>

                                            <label class="col-sm-1 control-label">电子邮箱:</label>
                                            <div class="col-sm-2">
                                                <input name="email" class="form-control" value="" placeholder="" onkeyup="value=value.replace(/\s+/,'')"/>
                                            </div>
                                        </div>


                                        <div class="col-sm-12 text-center">
                                            <button type="submit" class="btn btn-primary" id="save">确认</button>
                                        </div>
                                    </form>
                                </section>
                            </section>

                        </section>
                    </section>
                </section>
            </section>
        </section>
    </section>
</article>
<script src="<%=basePath%>/js/app.v2.js"></script> <!-- Bootstrap --> <!-- App -->
<script src="<%=basePath%>/js/app.js"></script>
<script src="<%=basePath%>/js/jquery.form.min.js"></script>

<script>

    function addMember() {


        var mobile=$("input[name='mobile']").val();
        var tel=$("input[name='tel']").val();
        var login_name=$("input[name='login_name']").val();
        var pwd1=$("#pwd1").val();
        var pwd2=$("#pwd2").val();
        if(login_name===""){
            alert("登录名必填");
            return false;
        }
        var loginNameCheck=/^[\u4E00-\u9FA5A-Za-z0-9]+$/;
        if(!loginNameCheck.exec(login_name)){
            alert("登录名只能包含中文、英文、数字");
            return false;
        }
        if(pwd1===""){
            alert("密码必填");
            return false;
        }
        if(pwd2===""){
            alert("请确认密码");
            return false;
        }
        if(pwd1!==pwd2){
            alert("两次密码输入不一致");
            return false;
        }

        if(mobile===""){
            alert("手机号码必填");
            return false;
        }


        if(mobile.length!=11){
            alert("手机号码错误");
            return false;
        }


        $("#infoForm").ajaxSubmit({
            dataType:"json",
            success:function (res) {
                if (res==1){
                    alert("注册成功");
                    window.close();
                }else if(res == 0) {
                    alert("登录名重复");
                }else {
                    alert("注册失败");
                }
            },
            error:function () {

            }
        });
        return false;
    }
    function hasRepeat(arr){
        var hash = {};
        for(var i in arr) {
            if(hash[arr[i]])
                return true;
            hash[arr[i]] = true;
        }
        return false;
    }
</script>
</body>
</html>
