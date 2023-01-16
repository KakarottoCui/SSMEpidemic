<%--
  Created by IntelliJ IDEA.
  User: FPF
  Date: 2020/5/13
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理界面</title>
    <jsp:include page="template/bootstrap_common.jsp"></jsp:include>
</head>
<body>
<div style="margin: 20px;">
    <%--头部设置--%>
    <jsp:include page="template/top.jsp"></jsp:include>
    <div class="row">
        <%--左边的菜单部分--%>
        <div class="col-md-2">
            <jsp:include page="template/menu.jsp"></jsp:include>
        </div>
        <%--右边的内容窗口--%>
        <div class="col-md-10">
            <iframe frameborder="0" name="imain" src="wellcome.jsp" style="height: 800px;width: 100%;"></iframe>
        </div>

    </div>
</div>
</body>
</html>
