<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Your Admin Panel</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


<!-- jQuery AND jQueryUI -->
<script type="text/javascript" src="js/libs/jquery/1.6/jquery.min.js"></script>
<script type="text/javascript"
	src="js/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>

<!-- Compressed Version
        <link type="text/css" rel="stylesheet" href="min/b=CoreAdmin&f=css/reset.css,css/style.css,css/jqueryui/jqueryui.css,js/jwysiwyg/jquery.wysiwyg.old-school.css,js/zoombox/zoombox.css" />
        <script type="text/javascript" src="min/b=CoreAdmin/js&f=cookie/jquery.cookie.js,jwysiwyg/jquery.wysiwyg.js,tooltipsy.min.js,iphone-style-checkboxes.js,excanvas.js,zoombox/zoombox.js,visualize.jQuery.js,jquery.uniform.min.js,main.js"></script>
        -->
<link rel="stylesheet" href="css/min.css" />
<script type="text/javascript" src="js/min.js"></script>

</head>
<body>

	<script type="text/javascript" src="content/settings/main.js"></script>
	<link rel="stylesheet" href="content/settings/style.css" />


	<div class="settings" id="settings">
		<div class="wrapper">
			<div class="grid3">
				<div class="titre">Backgrounds</div>
				<a href="url(css/img/bg.action" class="backgroundChanger active"
					title="White"></a> <a href="url(css/img/dark-bg.action"
					class="backgroundChanger dark" title="Dark"></a> <a
					href="url(css/img/wood.action" class="backgroundChanger dark"
					title="Wood"></a> <a href="url(css/img/altbg/smoothwall.action"
					class="backgroundChanger" title="Smoothwall"></a> <a
					href="url(css/img/altbg/black_denim.action"
					class="backgroundChanger dark" title="black_denim"></a> <a
					href="url(css/img/altbg/carbon.action"
					class="backgroundChanger dark" title="Carbon"></a> <a
					href="url(css/img/altbg/double_lined.action"
					class="backgroundChanger" title="Double lined"></a>
				<div class="clear"></div>
			</div>
			<div class="grid3">
				<div class="titre">Bloc style</div>
				<a href="black.action" class="blocChanger" title="Black"
					style="background: url(css/img/bloctitle.png);"></a> <a
					href="white.action" class="blocChanger active" title="White"
					style="background: url(css/img/white-title.png);"></a> <a
					href="wood.action" class="blocChanger" title="Wood"
					style="background: url(css/img/wood-title.jpg);"></a>
				<div class="clear"></div>
			</div>
			<div class="grid3">
				<div class="titre">Sidebar style</div>
				<a href="grey.action" class="sidebarChanger active" title="Grey"
					style="background: #494949"></a> <a href="black.action"
					class="sidebarChanger" title="Black" style="background: #262626"></a>
				<a href="white.action" class="sidebarChanger" title="White"
					style="background: #EEEEEE"></a>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
		<a class="settingbutton" href="#"> </a>
	</div>
	<!--              
                HEAD
                        -->
	<div id="head">
		<div class="left">
			<a href="#" class="button profile"><img
				src="img/icons/top/huser.png" alt="" /></a> Hi, <a
				href="persionsetting.action">${user.username}</a> | <a
				href="logout.action">Logout</a>
		</div>
		<div class="right">
			<form action="#" id="search" class="search placeholder">
				<label>Looking for something ?</label> <input type="text" value=""
					name="q" class="text" /> <input type="submit" value="rechercher"
					class="submit" />
			</form>
		</div>
	</div>


	<!--            
                SIDEBAR
                         -->
	<div id="sidebar">
		<ul>
			<li><a href="index.action"> <img
					src="img/icons/menu/clipboard.png" alt="" /> 公告栏
			</a></li>
			<li><a href="#"><img src="img/icons/menu/home.png" alt="" />
					教育OA</a>
				<ul>
					<li><a href="index.action">公告栏</a></li>
					<c:if test="${user.permission eq 2}">
						<li><a href="manageannounce.action">公告管理</a></li>
					</c:if>
					<c:if test="${user.permission ne 0}">
						<li><a href="table.action?p=table">工作交办</a></li>
					</c:if>
					<li><a href="tabs.action?p=tabs">规章制度</a></li>
					<c:if test="${user.permission ne 0}">
						<li><a href="gallery.action?p=gallery">我的文档</a></li>
					</c:if>
					<li><a href="typography.action?p=typo">教学计划安排</a></li>
					<li><a href="calendar.action?p=calendar">日程安排</a></li>
				</ul></li>

			<c:if test="${user.permission eq 2}">
				<li><a href="#"><img src="img/icons/menu/books.png" alt="" />
						学生档案</a>
					<ul>
						<li><a href="addfile.action">档案录入</a></li>
						<li><a href="searchfile.action">档案查询</a></li>
					</ul></li>
			</c:if>



			<li class="current"><a href="#"><img
					src="img/icons/menu/chart.png" alt="" /> 成绩管理</a>
				<ul>
					<c:if test="${user.permission eq 2}">
						<li><a href="manageexam.action">考试信息设置</a></li>
					</c:if>
					<c:if test="${user.permission ne 0}">
						<li><a href="addscore.action">成绩录入</a></li>
					</c:if>
					<li><a href="searchscore.action">成绩查询</a></li>
					<c:if test="${user.permission ne 0}">
						<li class="current"><a href="chart.action">成绩统计</a></li>
					</c:if>
				</ul></li>



			<c:if test="${user.permission eq 2}">
				<li><a href="#"><img src="img/icons/menu/inbox.png" alt="" />异动管理</a>
					<ul>
						<li><a href="changeclass.action">学生调班</a></li>
						<li><a href="changeschool.action">学生转学</a></li>
						<li><a href="reentryschool.action">学生复学</a></li>
						<li><a href="suspendschool.action">学生休学</a></li>
						<li><a href="leaveschool.action">学生退学</a></li>
						<li><a href="searchchange.action">异动查询</a></li>
					</ul></li>
			</c:if>




			<c:if test="${user.permission eq 2}">
				<li><a href="#"><img src="img/icons/menu/settings.png"
						alt="" />部门设置</a>
					<ul>
						<li><a href="settingdepartment.action">部门设置</a></li>
						<li><a href="settingpost.action">岗位设置</a></li>
					</ul></li>
			</c:if>


			<c:if test="${user.permission eq 2}">
				<li><a href="#"><img src="img/icons/menu/settings.png"
						alt="" />系统权限管理</a>
					<ul>
						<li><a href="settingroot.action">权限管理</a></li>
						<li><a href="settinguser.action">用户管理</a></li>
					</ul></li>
			</c:if>
		</ul>


	</div>




	<!--            
              CONTENT 
                        -->

	<div id="content" class="white">

		<h1>
			<img src="img/icons/chart.png" alt="" /> Charts
		</h1>

		<div class="bloc">
			<div class="title">
				Charts
				<div class="tabs" id="charts">
					<a href="#line">Line</a> <a href="#area">Area</a> <a href="#pie">Pie</a>
					<a href="#bar">Bar</a>
				</div>
			</div>
			<div>
				<div class="content" id="line">
					<table class="graph type-line dots tips">
						<caption>2009 Employee Sales by Department</caption>
						<thead>
							<tr>
								<td></td>
								<th scope="col">food</th>
								<th scope="col">auto</th>
								<th scope="col">household</th>
								<th scope="col">furniture</th>
								<th scope="col">kitchen</th>
								<th scope="col">bath</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">Mary</th>
								<td>190</td>
								<td>160</td>
								<td>40</td>
								<td>120</td>
								<td>30</td>
								<td>70</td>
							</tr>
							<tr>
								<th scope="row">Tom</th>
								<td>3</td>
								<td>40</td>
								<td>30</td>
								<td>45</td>
								<td>35</td>
								<td>49</td>
							</tr>
							<tr>
								<th scope="row">Brad</th>
								<td>10</td>
								<td>180</td>
								<td>10</td>
								<td>85</td>
								<td>25</td>
								<td>79</td>
							</tr>
							<tr>
								<th scope="row">Kate</th>
								<td>40</td>
								<td>80</td>
								<td>90</td>
								<td>25</td>
								<td>15</td>
								<td>119</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="content" id="area">
					<table class="graph type-area">
						<caption>2009 Employee Sales by Department</caption>
						<thead>
							<tr>
								<td></td>
								<th scope="col">food</th>
								<th scope="col">auto</th>
								<th scope="col">household</th>
								<th scope="col">furniture</th>
								<th scope="col">kitchen</th>
								<th scope="col">bath</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">Mary</th>
								<td>190</td>
								<td>160</td>
								<td>40</td>
								<td>120</td>
								<td>30</td>
								<td>70</td>
							</tr>
							<tr>
								<th scope="row">Tom</th>
								<td>3</td>
								<td>40</td>
								<td>30</td>
								<td>45</td>
								<td>35</td>
								<td>49</td>
							</tr>
							<tr>
								<th scope="row">Brad</th>
								<td>10</td>
								<td>180</td>
								<td>10</td>
								<td>85</td>
								<td>25</td>
								<td>79</td>
							</tr>
							<tr>
								<th scope="row">Kate</th>
								<td>40</td>
								<td>80</td>
								<td>90</td>
								<td>25</td>
								<td>15</td>
								<td>119</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="content" id="pie">
					<table class="graph type-pie tips">
						<caption>2009 Employee Sales by Department</caption>
						<thead>
							<tr>
								<td></td>
								<th scope="col">food</th>
								<th scope="col">auto</th>
								<th scope="col">household</th>
								<th scope="col">furniture</th>
								<th scope="col">kitchen</th>
								<th scope="col">bath</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">Mary</th>
								<td>190</td>
								<td>160</td>
								<td>40</td>
								<td>120</td>
								<td>30</td>
								<td>70</td>
							</tr>
							<tr>
								<th scope="row">Tom</th>
								<td>3</td>
								<td>40</td>
								<td>30</td>
								<td>45</td>
								<td>35</td>
								<td>49</td>
							</tr>
							<tr>
								<th scope="row">Brad</th>
								<td>10</td>
								<td>180</td>
								<td>10</td>
								<td>85</td>
								<td>25</td>
								<td>79</td>
							</tr>
							<tr>
								<th scope="row">Kate</th>
								<td>40</td>
								<td>80</td>
								<td>90</td>
								<td>25</td>
								<td>15</td>
								<td>119</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="content" id="bar">
					<table class="graph type-bar">
						<caption>2009 Employee Sales by Department</caption>
						<thead>
							<tr>
								<td></td>
								<th scope="col">food</th>
								<th scope="col">auto</th>
								<th scope="col">household</th>
								<th scope="col">furniture</th>
								<th scope="col">kitchen</th>
								<th scope="col">bath</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">Mary</th>
								<td>190</td>
								<td>160</td>
								<td>40</td>
								<td>120</td>
								<td>30</td>
								<td>70</td>
							</tr>
							<tr>
								<th scope="row">Tom</th>
								<td>3</td>
								<td>40</td>
								<td>30</td>
								<td>45</td>
								<td>35</td>
								<td>49</td>
							</tr>
							<tr>
								<th scope="row">Brad</th>
								<td>10</td>
								<td>180</td>
								<td>10</td>
								<td>85</td>
								<td>25</td>
								<td>79</td>
							</tr>
							<tr>
								<th scope="row">Kate</th>
								<td>40</td>
								<td>80</td>
								<td>90</td>
								<td>25</td>
								<td>15</td>
								<td>119</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>