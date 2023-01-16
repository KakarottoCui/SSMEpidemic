<%--
  Created by IntelliJ IDEA.
  User: FPF
  Date: 2020/5/14
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>疫情数据录入</title>
    <jsp:include page="../template/bootstrap_common.jsp"></jsp:include>
</head>
<body>
<div class="row1">
    <%-- 工具栏--%>
    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/wellcome.jsp">主页</a></li>
        <li>数据录入</li>
    </ul>
    <%--日期组件--%>
    <div class="row">
        <div class="col-md-3">
            <div class="input-group date" id="datepicker" data-date-format="yyyy-mm-dd">
                <div class="input-group-addon">数据日期</div>
                <input type="text" class="form-control" size="16" value="" readonly id="dataDate">
                <div class="input-group-addon"><span class="add-on glyphicon glyphicon-calendar"></span></div>
            </div>
        </div>
        <div class="col-md-3">
            <button type="button" class="btn btn-primary" id="btnSubmit">提交<span
                    class="glyphicon glyphicon-log-in"></span></button>
        </div>
    </div>
    <br>
    <%--显示录入数据的表格--%>
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
    <div class="row1">
        <div id="msg"></div>
    </div>
</div>
<script type="text/javascript">
    var provinces = null;//存放查询出来的省份信息
    /**
     * 初始化
     */
    $(function () {
        //设置日期框输入的初始值和取值范围
        var datepicker = $("#datepicker");
        datepicker.datepicker({
            language: 'zh-CN',
            autoclose: true
        });
        var current = new Date();//获取系统日期
        datepicker.datepicker("setDate", current);
        var date1 = new Date();
        //限定可以操作的日期
        date1.setDate(current.getDate() - 6);
        datepicker.datepicker("setStartDate", date1);
        datepicker.datepicker("setEndDate", current);
        //给日期选择框设置事件处理函数
        datepicker.datepicker().on("changeDate", loadProvinceList);
        //加载省份列表
        loadProvinceList();
        //给提交按钮绑定事件处理函数
        $("#btnSubmit").click(checkAndSubmitData)

    });

    /**
     * 录入数据
     */
    function checkAndSubmitData() {
        var valid = true;
        //获取输入框对象
        var affirmed = $("input[name=affirmed]");//确诊
        var suspected = $("input[name=suspected]");//疑似
        var isolated = $("input[name=isolated]");//隔离
        var cured = $("input[name=cured]");//治愈
        var dead = $("input[name=dead]");//死亡
        //验证输入框中的值是否是数值
        affirmed.each(function (index,element) {
            if(isNaN(Number(element.value))){
                valid = false;
            }
        });
        if(valid){
            //提交
            var dataArray =[];//数组，存放所有数据，包含多个省份
            for (var i=0; i<provinces.length;i++) {
                var obj ={};//对象，存放一个省份的信息
                obj.provinceId = provinces[i].provinceId;//provinceId
                obj.affirmed = affirmed.get(i).value;
                obj.suspected=suspected.get(i).value;
                obj.isolated=isolated.get(i).value;
                obj.cured=cured.get(i).value;
                obj.dead=dead.get(i).value;

                dataArray.push(obj);
            }
            //日期
            var date = $("#dataDate").val();
            var data={};//封装数据为json,字段写法对应DailyEpidemicInfo.java
            data.date = date;
            data.array = dataArray;

            //  json是一种数据格式：如果是对象，用{}表示，如果是数组用[]表示
            //  {"account":"zhangsan","password":"23","aihao":["唱歌"，"跳舞"，"游泳"]}
            //发起请求
            $.ajax({
                url:"${pageContext.request.contextPath}/epidemicData/ajax/input",
                type:"POST",
                contentType:"application/json",//传递给前端数据的类型
                data:JSON.stringify(data),//json数据
                dataType:'json',//后台响应给前台的数据类型
                success:function (resp) {
                    if(resp.code<0){
                        //alert(resp.msg);
                        $("#msg").html(resp.msg);
                    }else{
                        fillProvinceToTable(resp.data);
                    }
                }
            })
        }else{
            $("#msg").html("请检查你的输入，确保输入有效的数据！");
        }
    }

    /**
     * 获取省份列表
     */
    function loadProvinceList() {
        //获取当前日期框中的值
        var date = $("#dataDate").val();
        //请求服务器
        $.get("${pageContext.request.contextPath}/province/ajax/noDataList", {date: date}, function (resp) {
            if (resp.code < 0) {
                //alert(resp.msg);
                $("#msg").html(resp.msg);
            } else {
                console.log(JSON.stringify(resp.data))
                //填充表格
                fillProvinceToTable(resp.data);
            }
        }, "json");
    }

    /**
     * 动态填充表格
     * @param array:查询到的省份信息
     */
    function fillProvinceToTable(array) {
        //清空消息
        $("#msg").html("");
        //清空表格
        var tbody1 = $("#body1");
        tbody1.empty();
        if (array && array.length > 0) {//非空验证
            provinces = array;//省份信息，集合
            //遍历数组/集合，将数据填充到table中
            $.each(array, function (index, province) {
                //声明对象
                var tr = $("<tr>");
                var td = $("<td>");
                td.text(province.provinceName);//省份名字
                tr.append(td);

                td = $("<td>");
                td.html('<input type="text" name="affirmed" size="4" maxlength="8" class="form-control" value="0">');
                tr.append(td);//确诊人数

                td = $("<td>");
                td.html('<input type="text" name="suspected" size="4" maxlength="8" class="form-control" value="0">');
                tr.append(td);//疑似人数

                td = $("<td>");
                td.html('<input type="text" name="cured" size="4" maxlength="8" class="form-control" value="0">');
                tr.append(td);//治愈人数，

                td = $("<td>");
                td.html('<input type="text" name="isolated" size="4" maxlength="8" class="form-control" value="0">');
                tr.append(td);//隔离人数，

                td = $("<td>");
                td.html('<input type="text" name="dead" size="4" maxlength="8" class="form-control" value="0">');
                tr.append(td);//死亡人数

                tbody1.append(tr);
            });
        } else {
            $("#msg").html("本日所有省份都已经录入了数据！")
        }
    }
</script>

</body>
</html>
