<%--
  Created by IntelliJ IDEA.
  User: FPF
  Date: 2020/5/13
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="panel-group" id="menu">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a href="#div1" data-toggle="collapse" data-parent="#menu">数据管理</a>
            </h4>
        </div>
        <div id="div1" class="panel-collapse in">
            <div class="list-group">
                <a href="${pageContext.request.contextPath}/admin/data_input.jsp" target="imain" class="list-group-item">数据录入</a>
                <a href="${pageContext.request.contextPath}/admin/data_query.jsp" target="imain" class="list-group-item">数据查询</a>
                <a href="${pageContext.request.contextPath}/admin/chart_display.jsp" target="imain" class="list-group-item">图表展示</a>
            </div>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a href="#div2" class="collapsed" data-toggle="collapse" data-parent="#menu">系统管理</a>
            </h4>
        </div>
        <div id="div2" class="panel-collapse in">
            <div class="list-group">
                <a href="${pageContext.request.contextPath}/admin/user_input.jsp" target="imain" class="list-group-item">用户录入</a>
                <a href="${pageContext.request.contextPath}/admin/user_query_update.jsp" target="imain"  class="list-group-item">用户编辑</a>
            </div>
        </div>
    </div>
</div>