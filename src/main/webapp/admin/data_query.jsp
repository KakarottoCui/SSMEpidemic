<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/11/20
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>疫情数据查询</title>
    <jsp:include page="../template/bootstrap_common.jsp"></jsp:include>
</head>
<body>
<div class="row1">
    <%-- 工具栏--%>
    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/wellcome.jsp">主页</a></li>
        <li>数据查询</li>
    </ul>
    <%--查询框--%>
    <div class="row">
        <div class="col-md-2">
            <div class="input-group">
                <input type="text" class="form-control" size="16" placeholder="请输入省份" value="" id="input">
            </div>
        </div>
        <div>
            <button type="button" class="btn btn-primary" id="btnQuery">查询</button>
        </div>
    </div>
    <br>
    <%--显示查询数据的表格--%>
    <div class="row1">
        <table class="table table-striped table-hover table-bordered">
            <thead>
            <tr>
                <th>省份</th>
                <th>确诊人数</th>
                <th>疑似人数</th>
                <th>隔离人数</th>
                <th>治愈人数</th>
                <th>死亡人数</th>
            </tr>
            </thead>
            <%-- 动态数据，从后台获取--%>
            <tbody id="body1"></tbody>
        </table>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        //定义个用来给表格中装载数据的函数
        var fillToTable = function (epidemics) {
            var tbody1 = $("#body1");
            tbody1.empty();
            $.each(epidemics, function (index, epidemic) {
                var tr = $("<tr>");
                var td = $("<td>");
                td.text(epidemic.provinceName);
                tr.append(td);
                td = $("<td>");
                td.html("" + epidemic.affirmedTotal);
                tr.append(td);

                td = $("<td>");
                td.html("" + epidemic.suspectedTotal);
                tr.append(td);


                td = $("<td>");
                td.html("" + epidemic.isolatedTotal);
                tr.append(td);

                td = $("<td>");
                td.html("" + epidemic.curedTotal);
                tr.append(td);

                td = $("<td>");
                td.html("" + epidemic.deadTotal);
                tr.append(td);

                tbody1.append(tr);
            });
        };

        //发送请求获取最新疫情数据
        $.get("${pageContext.request.contextPath}/epidemicData/ajax/lastestData", {}, function (resp) {
            if (resp.code < 0) {
                alert(resp.msg);
            } else {
                fillToTable(resp.data);
            }
        }, "json");
    });

    $("#btnQuery").click(queryEpidemicByProvinceName);

    function queryEpidemicByProvinceName() {
        var data = $("#input").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/epidemicData/ajax/queryProvince",
            type:"POST",
            contentType:"application/json",//传递给前端数据的类型
            data:data,
            dataType:'json',//后台响应给前台的数据类型
            success:function (resp) {
                if(resp.code<0){
                    alert(resp.msg);
                    //$("#msg").html(resp.msg);
                }else{
                    fillEpidemicInfo(resp.data);
                }
            }
        })
    }

    function fillEpidemicInfo(data) {
        var tbody1 = $("#body1");
        tbody1.empty();

        //给表格中装载数据
        var tr = $("<tr>");
        var td = $("<td>");
        td.text(data.provinceName);
        tr.append(td);
        td = $("<td>");
        td.html("" + data.affirmedTotal);
        tr.append(td);

        td = $("<td>");
        td.html("" + data.suspectedTotal);
        tr.append(td);


        td = $("<td>");
        td.html("" + data.isolatedTotal);
        tr.append(td);

        td = $("<td>");
        td.html("" + data.curedTotal);
        tr.append(td);

        td = $("<td>");
        td.html("" + data.deadTotal);
        tr.append(td);

        tbody1.append(tr);
    }
</script>
</body>
</html>
