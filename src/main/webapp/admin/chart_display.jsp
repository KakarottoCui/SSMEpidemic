<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/11/20
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>疫情图表展示</title>
    <style type="text/css">
        #body1 {
            background-color: #fff;
        }
    </style>
    <!-- Bootstrap -->
    <jsp:include page="../template/bootstrap_common.jsp"></jsp:include>
</head>
<body>
<div class="row1">
    <%-- 工具栏--%>
    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/wellcome.jsp">主页</a></li>
        <li>图表展示</li>
    </ul>
    <%--显示图表--%>
    <jsp:include page="../epidemic.jsp"></jsp:include>
</div>
<script type="text/javascript">
    document.getElementById('login').style.display="none";
</script>
</body>
</html>
