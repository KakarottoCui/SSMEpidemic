<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户录入</title>
    <meta charset="utf-8">
    <jsp:include page="../template/bootstrap_common.jsp"></jsp:include>
</head>
<body>
<div class="row1">
    <%-- 工具栏--%>
    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/wellcome.jsp">主页</a></li>
        <li>用户录入</li>
    </ul>

    <form action="${pageContext.request.contextPath}/user/input" method="post" class="form-horizontal">
        <div class="modal-body col-md-8">
            <div class="form-group col-md-6" style="margin-left: 20px;margin-right: 20px">
                账号：<input type="text" class="form-control" placeholder="请输入账号" autocomplete="off" id="account" name="account" onblur="check()">
            </div>
            <div class="col-md-2">
                <strong style="color: red; margin-top: 20px;line-height: 70px" id="output"></strong>
            </div>
            <div class="form-group col-md-6" style="margin-left: 20px;margin-right: 20px;">
                用户名：<input type="text" class="form-control" placeholder="请输入用户名" autocomplete="off" name="userName">
            </div>
            <div class="form-group col-md-6" style="margin-left: 20px;margin-right: 20px;">
                密码：<input type="password" class="form-control" placeholder="请输入密码" autocomplete="off" name="password">
            </div>
        </div>
        <div class="col-md-8">
            <div class="form-group col-md-6" style="margin-left: 20px;margin-right: 20px;">
                <button type="submit" class="btn btn-primary form-control">提交</button>
            </div>
            <c:if test="${not empty msg1}">
                <div style="text-align: center;color: red" id="mes">
                    ${msg1}
                </div>
            </c:if>
        </div>
    </form>

    <script>
        function check() {
            var date = $("#account").val();
            if(date && date.length>0){
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/ajax/query",
                    type:"POST",
                    contentType:"application/json",//传递给前端数据的类型
                    data:date,
                    dataType:'json',//后台响应给前台的数据类型
                    success:function (resp) {
                        if(resp.code===0){
                            document.getElementById('output').innerText='已存在该账号！';
                        }
                    }
                })
            }
        }

        $('#account').on('focus',function () {
            var output=$("#output");
            if(!output.empty()){
                output.empty();
            }
            var mes=$("#mes");
            if(!mes.empty()){
                mes.empty();
            }
        })
            // var div = $("#update");
            // div.empty();
    </script>

</div>
</body>
</html>
