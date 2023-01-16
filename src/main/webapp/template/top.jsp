<%--
  Created by IntelliJ IDEA.
  User: FPF
  Date: 2020/5/13
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row" style="background: #337ab7;margin: 1px;">
    <div class="col-md-6" style="padding:20px;height: auto;font-size: 40px;font-family: 楷体;color:white;text-shadow: 2px 2px 2px blue;">疫情管理系统</div>
    <div class="col-md-2 col-md-offset-4" style="padding: 20px;color:white;font-size: 18px;">
        <p>欢迎您：<span class="label label-info">${loginedUser.userName}</span></p>
        <a href="${pageContext.request.contextPath}/user/logout" class="btn btn-danger">退出登录</a>
    </div>
</div>