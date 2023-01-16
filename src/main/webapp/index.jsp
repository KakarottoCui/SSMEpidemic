<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新冠病毒-科普</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav2.css">
    <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script>
        const APIKEY = "1531150663469519b4bf4e6ba73a5e08";
        $(document).ready(function () {
            let intervalID=loading();

            $.get("http://api.tianapi.com/txapi/ncov/index?key=" + APIKEY, function (data, status) {
                let news = data.newslist[0].news;
                let newsDiv = document.getElementById("news")

                clearInterval(intervalID);

                newsDiv.firstElementChild.innerText = "疫情新闻"
                for (let tip of news) {
                    let title = document.createElement("h4");
                    let p = document.createElement("p");
                    title.innerText = tip.title;
                    p.innerText = tip.summary;
                    newsDiv.append(title);
                    newsDiv.append(p);
                }
            })
        });


        //添加新闻加载动画
        function loading() {
            let title = $("#news").children().first().get(0);
            let count = 0;
            return setInterval(function () {
                if (count == 0) {
                    title.innerText = "疫情新闻-加载中";
                } else {
                    title.innerText += "."
                }
                count++;
                count %= 4;
            }, 1000);
        }
    </script>
</head>
<body>
<div class='top'>
    <ul>
        <li><a href="./epidemic.jsp">国内疫情</a></li>
        <li><a href="index.jsp">新冠病毒</a></li>
    </ul>
</div>

<div class="blue_block">
    <h2 class="title">新型冠状病毒肺炎(Corona Virus Disease 2019，COVID-19)</h2>

</div>


<div style="width: 800px;margin: 20px auto;min-height: 300px">

    <img style="float: left;margin-right: 30px" src="img/virus.png">
    <p style="padding-top: 60px;" class="text">新型冠状病毒肺炎（Corona Virus Disease
        2019，COVID-19），简称“新冠肺炎”，世界卫生组织命名为“2019冠状病毒病”，是指2019新型冠状病毒感染导致的肺炎。2019年12月以来，
        湖北省武汉市部分医院陆续发现了多例有华南海鲜市场暴露史的不明原因肺炎病例，
        现已证实为2019新型冠状病毒感染引起的急性呼吸道传染病。</p>
    <div id="news" style="width: 800px;margin-top: 120px;margin-bottom: 40px">
        <h1 class="ptitle">疫情新闻-加载中...</h1>
    </div>
</div>

<div class="blue_block">
    <h2>传播途径</h2>
    <div class="box">
        <h4>直接传播</h4>
        <p>患者喷嚏、咳嗽、说话的飞沫，呼出的气体近距离直接吸入导致的感染</p>
    </div>
    <div class="box">
        <h4>气溶胶传播</h4>
        <p>飞沫混合在空气中，形成气溶胶，吸入后导致感染</p>
    </div>
    <div class="box">
        <h4>接触传播</h4>
        <p>飞沫沉积在物品表面，接触污染手后，再接触口腔、鼻腔、眼睛等粘膜，导致感染</p>
    </div>
</div>
<div class="center">

    <h1 class="ptitle">防护措施</h1>

    <div>
        <h5>一、加强个人防护</h5>
        <p>
            1.避免前往人群密集的公共场所。避免接触发热呼吸道感染病人，如需接触时要佩戴口罩。<br>
            2.勤洗手。尤其在手被呼吸道分泌物污染时、触摸过公共设施后、照顾发热呼吸道感染或呕吐腹泻病人后、探访医院后、处理被污染的物品以及接触动物、动物饲料或动物粪便后。<br>
            3.不要随地吐痰。打喷嚏或咳嗽时用纸巾或袖肘遮住口、鼻。<br>
            4.加强锻炼，规律作息，保持室内空气流通。<br>
        </p>
    </div>

    <div>
        <h5>二、避免接触野生禽畜</h5>
        <p>
            1.避免接触禽畜、野生动物及其排泄物和分泌物，避免购买活禽和野生动物。<br>
            2.避免前往动物农场和屠宰场、活禽动物交易市场或摊位、野生动物栖息地或等场所。必须前往时要做好防护，尤其是职业暴露人群。<br>
            3.避免食用野生动物。不要食用已经患病的动物及其制品；要从正规渠道购买冰鲜禽肉，食用禽肉蛋奶时要充分煮熟，处理生鲜制品时，器具要生熟分开并及时清洗，避免交叉污染。<br>
        </p>
    </div>
    <div>
        <h5>三、杜绝带病上班、聚会</h5>
        <p>如有发烧、咳嗽等呼吸道感染的症状，居家休息，减少外出和旅行，天气良好时居室多通风，接触他人请佩戴口罩。要避免带病上班、上课及聚会。<br>
        </p>
    </div>
    <div>
        <h5>四、及时就医</h5>
        <p>从武汉等地外出旅行归来，如出现发热咳嗽等呼吸道感染症状，应根据病情就近选择医院发热门诊就医，并戴上口罩就诊，同时告知医生类似病人或动物接触史、旅行史等。<br>
        </p>
    </div>
</div>

<div class="blue_block">
    <h2>症状</h2>
    <p class="center" style="text-align: left">人感染了冠状病毒后常见体征有呼吸道症状、发热、咳嗽、气促和呼吸困难等。在较严重病例中，感染可导致肺炎、严重急性呼吸综合征、肾衰竭，甚至死亡。</p>
</div>

<div id="chart" style="width: 1280px;height:720px;margin: 20px auto"></div>
<script>
    let myChart = echarts.init(document.getElementById('chart'));
    let option = {
        title: {
            text: "与肺炎症状类似的疾病",
            left: "center"
        },
        series: {
            type: 'sunburst',
            data: [
                {
                    name: "发热",
                    value: 4,
                    children: [
                        {
                            name: "流感",
                            value: 1
                        }
                        , {
                            name: "急性上呼吸道感染",
                            value: 1
                        }, {
                            name: "肺炎",
                            value: 1
                        }, {
                            name: "肺结核",
                            value: 1
                        }
                    ]
                }, {
                    name: "咳嗽",
                    value: 3,
                    children: [
                        {
                            name: "流感",
                            value: 1
                        }, {
                            name: "感冒",
                            value: 1
                        }, {
                            name: "上呼吸道感染",
                            value: 1
                        }
                    ]
                }, {
                    name: "气促",
                    value: 4,
                    children: [
                        {
                            name: "肺炎",
                            value: 1
                        }, {
                            name: "胸膜炎",
                            value: 1
                        }, {
                            name: "胸腔积液",
                            value: 1
                        }, {
                            name: "气胸",
                            value: 1
                        }
                    ]
                }, {
                    name: "呼吸困难",
                    value: 2,
                    children: [
                        {
                            name: "急性性支气管炎",
                            value: 1
                        }, {
                            name: "慢性支气管炎",
                            value: 1
                        }
                    ]
                },
            ]

        }
    };


    myChart.setOption(option);
</script>
</body>
</html>