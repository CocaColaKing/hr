<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jyw
  Date: 2018/10/30
  Time: 0:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html>
<html>
<head>
    <title>编辑简历</title>
    <link href="<%=basePath%>/css/app.v2.css" rel="stylesheet"/>

</head>
<body>
<article class="vbox">
    <header class="bg-dark dk header navbar navbar-fixed-top-xs">
        <jsp:include page="/user/header"/>
    </header>
    <section>
        <section class="hbox stretch">
            <section id="content">
                <section class="vbox">
                    <section class="scrollable">
                        <ul class="breadcrumb no-border no-radius b-b b-light pull-in text-center">
                            <li>
                                <a href="#">编辑简历</a>
                            </li>
                        </ul>
                        <section class="">
                            <section class="scrollable wrapper w-f">
                                <section class="panel panel-default padder padder-v">
                                    <form id="infoForm" action="<%=basePath%>/user/ajaxResume" method="post" enctype="multipart/form-data" class="form-horizontal" onsubmit="return editResume()">
                                        <input type="text" class="hidden" value="${resume.resumeId}" name="resumeId" placeholder="">
                                        <input type="text" class="hidden" value="${resume.visitorId}" name="visitorId" placeholder="">
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">真实姓名:</label>
                                            <div class="col-sm-2">
                                                <input name="realName" class="form-control" placeholder="" value="${resume.realName}" />
                                            </div>

                                            <label class="col-sm-1 control-label">专业:</label>
                                            <div class="col-sm-2">
                                                <label>
                                                    <input  name="major"  class="form-control " value="${resume.major}" placeholder="" />
                                                </label>
                                            </div>

                                            <label class="col-sm-1 control-label">毕业院校:</label>
                                            <div class="col-sm-2">
                                                <label>
                                                    <input  name="school" class="form-control " value="${resume.school}" placeholder="" />
                                                </label>
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">学历:</label>
                                            <div class="col-sm-2">
                                                <input name="education" class="form-control" value="${resume.education}" placeholder="" >
                                            </div>

                                            <label class="col-sm-1 control-label">性别:</label>
                                            <div class="col-sm-2">
                                                <div class="col-sm-6 radio">
                                                    <label><input type="radio" name="gender" checked value="先生">先生</label>
                                                </div>
                                                <div class="col-sm-6 radio">
                                                    <label><input type="radio" name="gender" value="女士">女士</label>
                                                </div>
                                            </div>

                                            <label class="col-sm-1 control-label">出生年月日:</label>
                                            <div class="col-sm-2">
                                                <input name="birthday" class="form-control" value="${resume.birthday}" placeholder="">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">邮箱:</label>
                                            <div class="col-sm-2">
                                                <input class="form-control " name="email" value="${resume.email}" placeholder="" >
                                            </div>

                                            <label class="col-sm-1 control-label">手机号码:</label>
                                            <div class="col-sm-2">
                                                <input class="form-control " name="mobile" value="${resume.mobile}" placeholder="" onkeyup="value=value.replace(/\D/g,'')">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">住址:</label>
                                            <div class="col-sm-8">
                                                <input class="form-control " name="address" value="${resume.address}" placeholder="" >
                                            </div>

                                        </div>

                                        <div class="form-group">


                                            <label class="col-sm-1 control-label">兴趣爱好:</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" name="hobby" value="${resume.hobby}" placeholder="" >
                                            </div>

                                        </div>


                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">自我描述:</label>
                                            <div class="col-sm-10">
                                                <textarea class="form-control" name="description"  placeholder="" >${resume.description}</textarea>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">工作经验:</label>
                                            <div class="col-sm-10">
                                                <textarea class="form-control" name="workExperience"  placeholder="" >${resume.workExperience}</textarea>
                                            </div>
                                        </div>


                                        <div class="col-sm-12 text-center">
                                            <button type="submit" class="btn btn-primary" id="save">确认</button>
                                            <button type="button" class="btn btn-primary" onclick="history.back()">返回</button>
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
<script src="<%=basePath%>/js/app.v2.js"></script>
<script src="<%=basePath%>/js/jquery.form.min.js"></script>

<script>
    function editResume() {



        var mobile=$("input[name='mobile']").val();
        if(mobile===""){
            alert("手机号码必填");
            return false;
        }

        if(mobile.length!=11){
            alert("手机号码错误");
            return false;
        }



        $("#infoForm").ajaxSubmit({
            success:function (res) {

                if (res==1){
                    alert("编辑成功");
                    history.back();
                }
            },
            error:function () {

            }
        });
        return false;
    }
</script>
</body>
</html>
