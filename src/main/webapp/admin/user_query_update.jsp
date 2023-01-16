<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/11/23
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户编辑</title>
    <meta charset="utf-8">
    <jsp:include page="../template/bootstrap_common.jsp"></jsp:include>
</head>
<body>

<div>
    <%-- 工具栏--%>
    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/wellcome.jsp">主页</a></li>
        <li>用户编辑</li>
    </ul>

    <%--查询框--%>
    <div class="row">
        <div class="col-md-2">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="请输入账号" size="16" name="searchAccount" id="searchAccount">
            </div>
        </div>
        <div>
            <button type="button" class="btn btn-primary" id="btnQuery">查询</button>
        </div>
    </div>
    <br>

    <%--修改框--%>
    <div class="col-md-5" id="update">

    </div>
</div>
<script>
    /**
     * 初始化
     */
    $(function () {
        //给提交按钮绑定事件处理函数
        $("#btnQuery").click(queryUserByAccount)

    });


    function queryUserByAccount() {
        //var account = $("input[name=account]");
        //var obj ={};
        //obj.account = account.get(0).value;
        //alert(JSON.stringify(obj));
        var date = $("#searchAccount").val();
        // var data={};//封装数据为json
        // data.date = date;
        $.ajax({
            url:"${pageContext.request.contextPath}/user/ajax/query",
            type:"POST",
            contentType:"application/json",//传递给前端数据的类型
            data:date,
            dataType:'json',//后台响应给前台的数据类型
            success:function (resp) {
                if(resp.code<0){
                    alert(resp.msg);
                    //$("#msg").html(resp.msg);
                }else{
                    fillUserToUpdate(resp.data);
                }
            }
        })
    }

    function fillUserToUpdate(data) {
        //清空表格
        var div = $("#update");
        div.empty();

        var div2=$("<div>")
        div2.html('<input hidden type="text" name="userId" id="userId" value=' + data.userId + '>');
        div.append(div2);

        div2=$("<div>")
        var br = $("<br>");
        div2.html('账号：<input type="text" name="account" id="account" readonly class="form-control" value='+ data.account +'>');
        div.append(div2);
        div.append(br);

        div2=$("<div>")
        br = $("<br>");
        div2.html('用户名：<input type="text" name="userName" id="userName" class="form-control" value='+data.userName+'>');
        div.append(div2);
        div.append(br);

        div2=$("<div>")
        br = $("<br>");
        div2.html('密码：<input type="text" name="password" id="password" class="form-control" value='+data.password+'>');
        div.append(div2);
        div.append(br);

        div2=$("<div>")
        div2.html('<button type="button" class="btn btn-primary" id="userUpdate">修改</button>');
        div.append(div2);

        $("#userUpdate").click(updateUser)
    }

    function updateUser() {
        var userId = $("#userId").val();
        var account = $("#account").val();
        var userName = $("#userName").val();
        var password = $("#password").val();
        var data={};//封装数据为json
        data.userId = userId;
        data.account = account;
        data.userName = userName;
        data.password = password;
        $.ajax({
            url:"${pageContext.request.contextPath}/user/ajax/update",
            type:"POST",
            contentType:"application/json",//传递给前端数据的类型
            data:JSON.stringify(data),
            dataType:'json',//后台响应给前台的数据类型
            success:function (resp) {
                    alert(resp.msg);
                    clear();
            }
        })
    }

    function clear() {
        //alert(111);
        //清空所有输入框
        $("#searchAccount").val("");
        $("#account").val("");
        $("#userName").val("");
        $("#password").val("");
    }

</script>
</body>
</html>
