<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Struct"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jxnu.lib.Connecting_To_Database"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jxnu.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%//权限验证
try{
if(request.getSession().getAttribute("level").toString().equals("0") )
response.sendRedirect("Permission_Denied.jsp");
}
catch(Exception e){
response.sendRedirect("Permission_Denied.jsp");
}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>数据总揽</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="assets/materialize/css/materialize.min.css" media="screen,projection" />
    <!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">

    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/materialize/js/materialize.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>
    <!-- Morris Chart Js -->
    <script src="assets/js/easypiechart.js"></script>
    <script src="assets/js/easypiechart-data.js"></script>
    <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>
    <!-- echarts Js -->
    <script src="assets/js/echarts.js"></script>

    <style>
        *{
            font-family: 微软雅黑;
        }
    </style>
	

  </head>
  
  <body>
  
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">

            <div class="navbar-header">
                <button type="button" class="navbar-toggle waves-effect waves-dark" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand waves-effect waves-dark" href="User_admin.jsp">
                    <i class="large material-icons">insert_chart</i>
                    <strong>Mansins</strong>
                </a>
                <div id="sideNav" href="">
                    <i class="material-icons dp48">toc</i>
                </div>
            </div>

            <ul class="nav navbar-top-links navbar-right">
                <li>
                    <a class="dropdown-button waves-effect waves-dark" data-activates="dropdown1">
                        <i class="fa fa-user fa-fw"></i>
                        <b>Admin</b>
                        <i class="material-icons right">arrow_drop_down</i>
                    </a>
                </li>
            </ul>

        </nav>
		<!-- Dropdown Structure -->
        <ul id="dropdown1" class="dropdown-content">
            <li><a href="index.jsp"><i class="fa fa-desktop fa-fw"></i> 返回主页</a>
            </li>
            <li><a href="UserMain"><i class="fa fa-user fa-fw"></i> 个人信息</a>
            </li>
            <li><a href="Logout"><i class="fa fa-sign-out fa-fw"></i> 登出</a>
            </li>
        </ul>
	    <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li>
                        <a class="active-menu waves-effect waves-dark" href="User_admin.jsp"><i class="fa fa-dashboard"></i> 数据总揽</a>
                    </li>
					<li>
                        <a href="chart.jsp" class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i> 图表</a>
                    </li>

                    <li>
                        <a href="#" class="waves-effect waves-dark"><i class="fa fa-sitemap"></i> 管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="Add_Books.jsp">添加图书</a>
                            </li>
                            <li>
                                <a href="Search_Book_Admin.jsp">修改图书信息</a>
                            </li>
                            <li>
                                <a href="Add_User_Admin.jsp">添加用户</a>
                            </li>
                            <li>
                                <a href="Search_User_Admin.jsp">修改用户信息</a>
                            </li>
                            <li>
                                <a href="Manage_Others_Admin.jsp">分页面数据管理</a>
                            </li>
                        </ul>
                    </li>

                </ul>
            </div>
        </nav>
        
        
         <%
						            Connecting_To_Database ctds = new Connecting_To_Database();
						            Connection conns = ctds.getConnection();
						            String sqls = "select * from test_chart";
						            Statement stmts = conns.createStatement();
						            ResultSet rss = stmts.executeQuery(sqls);
						            String FangWen =null;
						            String XiaoShou =null;
						            String Pinglun =null;
						            String JieChu =null;
						            String WeiHuan =null;
						            String DaiDing1 =null;
						            String DaiDing2 =null;
						            String chart1_1 =null;
						            String chart1_2 =null;
						            while(rss.next()){
						            FangWen = rss.getString("FangWen");
						            XiaoShou = rss.getString("XiaoShou");
						            Pinglun = rss.getString("Pinglun");
						            JieChu = rss.getString("JieChu");
						            WeiHuan = rss.getString("WeiHuan");
						            DaiDing1 = rss.getString("DaiDing1");
						            DaiDing2 = rss.getString("DaiDing2");
						            chart1_1 = rss.getString("chart1_1");
						            chart1_2 = rss.getString("chart1_2");
						            
						            }

						            //System.out.println(usersNumber);
						             %>

        <!-- /. NAV SIDE  -->
      
		<div id="page-wrapper">
            <div class="header">
                <h1 class="page-header">数据总揽</h1>
                <ol class="breadcrumb">
                    <li><a href="User_admin.jsp">Mansins</a></li>
                    <li><a>数据总揽</a></li>
                </ol>
            </div>

            <div id="page-inner">
                <div class="row">

                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <div class="card horizontal cardIcon waves-effect waves-dark">
						    <div class="card-image red">
						        <i class="fa fa-eye fa-5x"></i>
						    </div>
                            <div class="card-stacked">
						        <div class="card-content">
						            <h3><%=FangWen %></h3><!--——————————访问数----------------->
						        </div>
						        <div class="card-action">
						            <strong> 总访问量</strong>
						        </div>
						    </div>
						</div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <div class="card horizontal cardIcon waves-effect waves-dark">
						    <div class="card-image orange">
						        <i class="fa fa-shopping-cart fa-5x"></i>
						    </div>
						    <div class="card-stacked">
						        <div class="card-content">
						            <h3><%=XiaoShou %></h3><!--——————————销售量----------------->
						        </div>
						        <div class="card-action">
						            <strong> 总销售量</strong>
						        </div>
						    </div>
						</div> 
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <div class="card horizontal cardIcon waves-effect waves-dark">
						    <div class="card-image blue">
						        <i class="fa fa-comments fa-5x"></i>
						    </div>
						    <div class="card-stacked">
						        <div class="card-content">
						           <%
						            Connection conn1 = Connecting_To_Database.getConnection();
						            String sql1 = "select * from bookNumber";
						            Statement stmt1 = conn1.createStatement();
						            ResultSet rs1 = stmt1.executeQuery(sql1);
						            String bookNumber =null;
						            while(rs1.next()){
						            bookNumber = ""+rs1.getInt("bookNumber");
						            }
						            rs1.close();
						            stmt1.close();
						            conn1.close();
						            //System.out.println(usersNumber);
						             %>
						            <h3><%=bookNumber %></h3> <!--——————————评论量----------------->
						        </div>
						        <div class="card-action">
						            <strong> 总图书量</strong>
						        </div>
						    </div>
						</div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <div class="card horizontal cardIcon waves-effect waves-dark">
						    <div class="card-image">
                                <i class="fa fa-users fa-5x"></i>
                            </div>
						    <div class="card-stacked">
						        <div class="card-content">
						            <%
						            Connection conn = Connecting_To_Database.getConnection();
						            String sql = "select * from usersNumber";
						            Statement stmt = conn.createStatement();
						            ResultSet rs = stmt.executeQuery(sql);
						            String usersNumber =null;
						            while(rs.next()){
						            usersNumber = ""+rs.getInt("usersNumber");
						            }
						            rs.close();
						            stmt.close();
						            conn.close();
						            //System.out.println(usersNumber);
						             %>
						            <h3><%=usersNumber %></h3> <!--——————————用户量----------------->
						        </div>
						        <div class="card-action">
						            <strong> 总用户量</strong>
						        </div>
						    </div>
					    </div>
                    </div>

                </div>

                <!--——————————//比例图表----------------->
		        <div class="row">

			        <div class="col-xs-12 col-sm-6 col-md-3">
					    <div class="card-panel text-center">
						    <h4>借出</h4>
						    <div class="easypiechart" id="easypiechart-blue" data-percent="<%=JieChu %>" ><!--——————————借出比例----------------->
                                <span class="percent"><%=JieChu %>%</span><!--——————————借出比例----------------->
						    </div>
					    </div>
			        </div>

			        <div class="col-xs-12 col-sm-6 col-md-3">
					    <div class="card-panel text-center">
						    <h4>未还</h4>
						    <div class="easypiechart" id="easypiechart-red" data-percent="<%=WeiHuan %>" ><!--——————————未还比例----------------->
                                <span class="percent"><%=WeiHuan %>%</span><!--——————————未还比例----------------->
						    </div>
					    </div>
			        </div>

			        <div class="col-xs-12 col-sm-6 col-md-3">
					    <div class="card-panel text-center">
						    <h4>旧书</h4>
						    <div class="easypiechart" id="easypiechart-teal" data-percent="<%=DaiDing1 %>" ><!--——————————待定比例----------------->
                                <span class="percent"><%=DaiDing1 %>%</span><!--——————————待定比例----------------->
						    </div>
					    </div>
			        </div>

			        <div class="col-xs-12 col-sm-6 col-md-3">
					    <div class="card-panel text-center">
						    <h4>VIP用户</h4>
                            <div class="easypiechart" id="easypiechart-orange" data-percent="<%=DaiDing2 %>" ><!--——————————待定比例----------------->
                                <span class="percent"><%=DaiDing2 %>%</span><!--——————————待定比例----------------->
                            </div>
                        </div>
                    </div>
		        </div>
			

				<div class="row">

				    <div class="col-md-5">
                        <div class="card">
                            <div id="main1" style="width: 100%;height:400px;"></div>
                            <script type="text/javascript">
                                // 初始化
                                var myChart = echarts.init(document.getElementById('main1'));
                                // 指定图表的配置项和数据
                                var option = {
                                    title: {
                                        text: '月度营业表'
                                    },
                                    tooltip: {},
                                    legend: {
                                        data:['售出','借出']
                                    },
                                    toolbox: {
                                        feature: {
                                            saveAsImage: {}
                                        }
                                    },
                                    xAxis: {
                                        data: ["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]
                                    },
                                    yAxis: {},
                                    series: [{
                                        name: '售出',
                                        type: 'bar',
                                        data: <%=chart1_1 %>
                                    }, {
                                        name: '借出',
                                        type: 'bar',
                                        data: <%=chart1_2 %>
                                    }
                                    ]
                                };
                                myChart.setOption(option);
                            </script>
						</div>
					</div>		

                    <div class="col-md-7">
					    <div class="card">
                            <div id="main2" style="width: 100%;height:400px;"></div>
                            <script type="text/javascript">
                                // 初始化
                                var myChart = echarts.init(document.getElementById('main2'));
                                // 指定图表的配置项和数据
                                var option = {
                                    title: {
                                        text: '图2'
                                    },
                                    tooltip : {
                                        trigger: 'axis'
                                    },
                                    legend: {
                                        data:['图书收藏','读者评论','用户注册','网站访问']
                                    },
                                    toolbox: {
                                        feature: {
                                            saveAsImage: {}
                                        }
                                    },
                                    grid: {
                                        left: '3%',
                                        right: '4%',
                                        bottom: '3%',
                                        containLabel: true
                                    },
                                    xAxis : [
                                        {
                                            type : 'category',
                                            boundaryGap : false,
                                            data : ['周一','周二','周三','周四','周五','周六','周日']
                                        }
                                    ],
                                    yAxis : [
                                        {
                                            type : 'value'
                                        }
                                    ],
                                    series : [
                                        {
                                            name:'图书收藏',
                                            type:'line',
                                            stack: '总量',
                                            areaStyle: {normal: {}},
                                            data:[120, 132, 101, 134, 90, 230, 210]
                                        },
                                        {
                                            name:'读者评论',
                                            type:'line',
                                            stack: '总量',
                                            areaStyle: {normal: {}},
                                            data:[220, 182, 191, 234, 290, 330, 310]
                                        },
                                        {
                                            name:'用户注册',
                                            type:'line',
                                            stack: '总量',
                                            areaStyle: {normal: {}},
                                            data:[150, 232, 201, 154, 190, 330, 410]
                                        },
                                        {
                                            name:'网站访问',
                                            type:'line',
                                            stack: '总量',
                                            label: {
                                                normal: {
                                                    show: true,
                                                    position: 'top'
                                                }
                                            },
                                            areaStyle: {normal: {}},
                                            data:[820, 932, 901, 934, 1290, 1330, 1320]
                                        }
                                    ]
                                };
                                myChart.setOption(option);
                            </script>
					    </div>
					</div>
					
				</div> 
			 
				
				
                <div class="row">

                    <div class="col-md-9 col-sm-12 col-xs-12">
						<div class="card">
					        <div class="card-image">
					            <div id="morris-area-chart"></div>
                            </div>
					        <div class="card-action">
					            <b>待定</b>
					        </div>
					    </div>
                    </div>

                    <div class="col-md-3 col-sm-12 col-xs-12">
						<div class="card">
					        <div class="card-image">
					            <div id="morris-donut-chart"></div>
					        </div>
					        <div class="card-action">
					            <b>待定</b>
					        </div>
					    </div>
                    </div>

                </div>
                <!-- /. ROW  -->

            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
 
  
  </body>
</html>
