<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.jxnu.lib.Connecting_To_Database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
//cookie的获取和判定
Cookie[] cookies = request.getCookies();
String values = null;
String url = null;
boolean judge = false; //判断cookie是否存在和是否符合规范的Boolean值
if(cookies != null){ 						
								
for(Cookie cookie : cookies){
if(cookie.getName().equals("Name")){
values = cookie.getValue();
judge = true;
}
if(cookie.getName().equals("url")){
url = cookie.getValue();
}}}
String Id = (String)request.getSession().getAttribute("Id"); if(Id==null) judge=false;else judge=true; 
//String levels = (String)request.getSession().getAttribute("level");
String collectd = request.getAttribute("collectd").toString();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>BookInfo</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/styleS.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/Main.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/Main_bright.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/BookInfo.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/star.css" rel="stylesheet" type="text/css" media="all" />

    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/FX.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style>
        table{
            table-layout: fixed;
            width: 100%;
        }
        body{
            background-color: #fffff9;
        }
        .nav{
            font-family: 微软雅黑;
        }
    </style>

  </head>
  
  <body>
<!-- 导航栏 -->
<nav class="bigM">
    <div class="m">
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <div class="navbar-header">
                    <img class="P4" src="images/P4_White.png">
                </div>
                <div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
            </ul>
            <form class="navbar-form" role="form"  action="FindBooks.do"   method="post" accept-charset="UTF-8">
                    <input type="text" placeholder="书名/作者/出版社/类型/专栏" class="search-control bt1" name="bookname">
                    <a class="bt1" href=""><input type="image" class="BT" src="images/BT.jpg" border="0" onmouseover="this.src='images/BT1.jpg'" onmouseout="this.src='images/BT.jpg'"></a>
            </form>
        </div>
    </div>
</nav>
<!-- //导航栏 -->

<!-- 二级导航栏 -->
<nav class="bigm">
    <div class="m2">
        <ul class="nav2 nav">
            <a href="" class="n1">原创</a>
            <a href="" class="n1">分类</a>
            <a href="" class="n1">专栏</a>
            <a href="" class="n1">连载</a>
            <a href="" class="n1">免费</a>
			<% if(judge==false) {%><a href="Login.html"  class="n2">登录</a><%} %>
			<%if(judge==true) {%><a href="UserMain"  style="font-size:10px;" class="n2"> <%out.println(URLDecoder.decode(values, "UTF-8"));%></a><%} %>
			<a href="index.jsp" class="n2">返回主页</a>
        </ul>
    </div>
</nav>
<!-- //二级导航栏 -->

<div class="m1">
    <div class="article-profile-section article-profile-primary">

        <div class="cover shadow-cover">
            <img src="<%=request.getAttribute("Book_Img") %>">
        </div>

        <div class="">
            <div class="fen">
                <div id="view" onmouseover="showDiv(1)" >
                    <img class="FX" src="images/FX.jpg">
                </div>
                <div id="area" style="display:none;" onmouseout="showDiv(1)">
                    <a href="" title="分享到QQ空间"><img class="TB" src="images/KJ.jpg"></a>
                    <a href="" title="分享到QQ好友"><img class="TB" src="images/QQ.jpg"></a>
                    <a href="" title="分享到微博"><img class="TB" src="images/WB.jpg"></a>
                    <a href="" title="分享到微信"><img class="TB" src="images/WX.jpg"></a>
                </div>
                <div id="out" onmouseover="showDiv(0)" class="SH">快去分享你的收获吧！</div>
            </div>

            <p class="article-title"><b><%=request.getAttribute("Book_Name") %></b></p>

            <div class="article-meta">
                <p>作者
                    <span class="labeled-text"><a href=""><%=request.getAttribute("Author") %></a></span>
                </p>
                <p>类别
                    <span class="labeled-text"> <%=request.getAttribute("Types_Of_Book") %></span>
                </p>
                <p>发行日期
                    <span class="labeled-text"><%=request.getAttribute("Date_Issued") %></span>
                </p>
            </div>

            <div class="rating rating-light">
                <span title="3.5"class="rating" data-rate="3.5">
                    <i class="star-1">★</i>
                    <i class="star-2">★</i>
                    <i class="star-3">★</i>
                    <i class="star-4">★</i>
                    <i class="star-5">★</i>
                </span>
                <span >|<a href="">1人评价</a></span>
            </div>

            <span class="fen YD">
                <span>
                    <label>全本定价</label>
                    <span>
                        <span class="current-price-count ">￥<%=request.getAttribute("Price") %></span>
                    </span>
                </span>
                <a href="PY_jiaoyi.jsp" class="btn btn-info">
                    <span class="btn-text" style="color: #fff">购买</span>
                </a>
            </span>

            <div class="YD">
            
                <%/*未登录情况*/if(judge==false){%><!-- 收藏按钮 -->
                <a href="Please_Login.jsp">
                    <img class="YDjpg" src="images/YD.jpg" border="0" onmouseover="this.src='images/YD1.jpg'" onmouseout="this.src='images/YD.jpg'">
                </a>
                <%}%><!-- 收藏按钮 -->
                
                <%/*已登录 未收藏 情况*/if(judge==true && collectd=="0"){%><!-- 收藏按钮 -->
                <a href="AddCollect?Book_Id=<%=request.getParameter("book_id") %>">
                    <img class="YDjpg" src="images/YD.jpg" border="0" onmouseover="this.src='images/YD1.jpg'" onmouseout="this.src='images/YD.jpg'">
                </a>
                <%}%><!-- 收藏按钮 -->
                
                <%/*已登录 已收藏情况*/if(judge==true && collectd=="1"){%><!-- 收藏按钮 -->
                <a href="DeleteCollect?Book_Id=<%=request.getParameter("book_id") %>&page=BookInfo.jsp">
                    <img class="YDjpg" src="images/QXSC1.png" border="0" onmouseover="this.src='images/QXSC2.png'" onmouseout="this.src='images/QXSC1.png'">
                </a>
                <%}%><!-- 收藏按钮 -->
                
                
                <span class="read-count"><%=request.getAttribute("Borrowd") %> 阅读</span>
                
               <%try{ %>
               <%if(request.getSession().getAttribute("level").toString().equals("1")) {%> <a href="ShowBookInfo?book_id=<%=request.getAttribute("Book_Id") %>" class="btn btnYellow">
                    <span class="btn-text" style="color: #fff">修改图书</span>
                </a><%} }catch(Exception e){}//管理员管理模块%>
            </div>

        </div>
    </div>


    <div class="article-profile-section article-profile-intros">
        <div class="article-profile-intro-tabs">
            <ul>
                <li class="ark-tab-activated">图书简介</li>
                <li class="">作者：<%=request.getAttribute("Author") %></li>
            </ul>
        </div>

        <div class="">
            <div class="">
                <div class="info">
                   
                    <textarea disabled="disabled" style="resize: none;border:none;background:#fffff9;width:100%;height:500px;"><%=request.getAttribute("book_info") %></textarea>
                    
                </div>
            </div>
        </div>

    </div>

    <div class="article-profile-section reviews">
    
        <div class="info PL">
			<p>评论</p>
        </div>
        
        <%if(judge==true) {%>
        <div class="PLK">
			<div class="Input_Box">  
				<form action="AddComments?Book_Id=<%=request.getParameter("book_id") %>" method="post" accept-charset="UTF-8">
					<textarea name="Comments_Info" class="Input_text"> </textarea>
            		<div class="Input_Foot">
            			<input type="submit" class="postBtn" value="确定">
            		</div> 
				</form>
         	</div>     
      	</div>
      	<%} %>
      	
      	<%if(judge==false) {%>
      	<div class="PLK">
			<div class="Input_Box">     
            	<textarea class="Input_text" disabled="disabled">请登录之后再进行评论~</textarea>
            	<div class="Input_Foot">
            		<a class="postBtn">确定</a> 
            	</div>     
         	</div>     
      	</div>
      	<%} %>
        
        <div>
        	<div class="info PL">
        		<p>书友评论<span> </span></p>
        	</div>
        	
        	
        	<%
        	Connection conn = Connecting_To_Database.getConnection();
        	String sqls = "select * from comments where Book_Id='"+request.getParameter("book_id")+"'";
        	Statement stmt = conn.createStatement();
        	ResultSet rs = stmt.executeQuery(sqls);
        	while(rs.next()){
        	
        	 %>
        	
        	<!-- 评论1 -->
        	<div class="topxian marbottom10">
        		<div class="UserImg">
        			<img style="width:70px;height:70px;" alt="这里要显示用户名" src="<%=rs.getString("User_Img") %>">
        		</div>
        		<div class="UserPL">
        			<a class="Namecolor" href="#!" style="color:#0e27be;" onmouseover="this.style.color='#7984c7'" onmouseout="this.style.color='#0e27be'"><%=rs.getString("User_Name") %>:</a>
        			<p class="neirong"><%=rs.getString("Comments_Info") %></p>
        			<div class="dz_hf_sc borderleft">
        				
        				<%try{if(request.getSession().getAttribute("Id").toString().equals(rs.getString("User_Id")) || request.getSession().getAttribute("level").toString().equals("1") ){ %>
        				<a href="DeleteComments?Book_Id=<%=rs.getString("Book_Id")%>&Comments_Id=<%=rs.getString("Comments_Id")%>&User_Id=<%=rs.getString("User_Id") %>" style="color:#444444;" onmouseover="this.style.color='#a0a0a0'" onmouseout="this.style.color='#444444'">
        					&nbsp;删除
        				</a><%}}catch(Exception e){} %>
        				
        			</div>
        			<div class="dz_hf_sc borderleft">&nbsp;回复&nbsp;</div>
        			<div class="dz_hf_sc">点赞&nbsp;</div>
        			<div class="span-des">&nbsp;<%=rs.getString("Comments_Time") %></div>
        		</div>
        	</div>
        	<!-- //评论1 -->
        	
        	<%} %>
        	
        	
        	<div class="xiawu"></div> <!-- 不需要动，最下面留的空白 -->
        </div>
        
    </div>

</div>
  </body>
</html>
