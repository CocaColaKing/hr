<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: jyw
  Date: 2018/10/29
  Time: 23:31
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
    <title>招聘信息详情</title>
    <link rel="stylesheet" href="<%=basePath%>/css/app.v2.css" type="text/css" />

</head>
<body>
<header class="bg-dark dk header navbar navbar-fixed-top-xs">
    <jsp:include page="/user/header"/>
</header>
<section>
    <section class="hbox stretch">
        <!-- /.aside -->
        <section id="content">
            <section class="vbox">
                <section class="scrollable">
                    <ul class="breadcrumb no-border no-radius b-b b-light pull-in" style="padding-left: 30px;">
                        <li>
                            <a href="#">招聘信息</a>
                        </li>
                    </ul>
                    <section class="">
                        <section class="scrollable wrapper w-f">
                            <section class="panel panel-default padder padder-v">
                                <form id="infoForm" name="infoForm" action="#" method="post" enctype="multipart/form-data" class="form-horizontal">
                                    <div class="form-group text-center">
                                        <h1>${recruitment.title}</h1>
                                    </div>

                                    <div class="form-group text-right">
                                        <span><fmt:formatDate value="${recruitment.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </span>
                                    </div>




                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">信息描述:</label>
                                        <div class="col-sm-10">
                                            <%--<textarea title="" id="editor_id" name="description"  style="height:300px;width: 100%;">--%>
                                            ${recruitment.description}
                                            <%--</textarea>--%>
                                        </div>
                                    </div>



                                    <div class="col-sm-12 text-center">
                                        <button class="btn btn-primary" type="button">投递简历</button>
                                        <span class="btn btn-primary" onclick="history.back()">返回</span>
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
<script src="<%=basePath%>/js/app.v2.js"></script> <!-- Bootstrap --> <!-- App -->
<script>
    function send() {
        $.post("<%=basePath%>/user/sendResume",{recruitmentId:"${param.id}"},function (res) {
            if(res ==1){
                alert("投递简历成功");
                history.back();
            }else if(res == 0){
                alert("不好意思，您暂无简历，请您先编辑简历再投递本职位");
            }else {
                alert("投递失败");
            }
        })
    }
</script>
</body>
</html>
