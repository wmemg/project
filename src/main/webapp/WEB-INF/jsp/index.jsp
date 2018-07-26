<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
        <title>Your Admin Panel</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

        
        <!-- jQuery AND jQueryUI -->
        <script type="text/javascript" src="js/libs/jquery/1.6/jquery.min.js"></script>
        <script type="text/javascript" src="js/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>
        
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
                <a href="url(css/img/bg.png" class="backgroundChanger active" title="White"></a>
                <a href="url(css/img/dark-bg.png" class="backgroundChanger dark" title="Dark"></a>
                <a href="url(css/img/wood.png" class="backgroundChanger dark" title="Wood"></a>
                <a href="url(css/img/altbg/smoothwall.png" class="backgroundChanger" title="Smoothwall"></a>
                <a href="url(css/img/altbg/black_denim.png" class="backgroundChanger dark" title="black_denim"></a>
                <a href="url(css/img/altbg/carbon.png" class="backgroundChanger dark" title="Carbon"></a>
                <a href="url(css/img/altbg/double_lined.png" class="backgroundChanger" title="Double lined"></a>
                <div class="clear"></div>
            </div>
            <div class="grid3">
                <div class="titre">Bloc style</div>
                <a href="black.html" class="blocChanger" title="Black" style="background:url(css/img/bloctitle.png);"></a>
                <a href="white.html" class="blocChanger active" title="White" style="background:url(css/img/white-title.png);"></a>
                <a href="wood.html" class="blocChanger" title="Wood" style="background:url(css/img/wood-title.jpg);"></a>
                <div class="clear"></div>
            </div>
            <div class="grid3">
                <div class="titre">Sidebar style</div>
                <a href="grey.html" class="sidebarChanger active" title="Grey" style="background:#494949"></a>
                <a href="black.html" class="sidebarChanger" title="Black" style="background:#262626"></a>
                <a href="white.html" class="sidebarChanger" title="White" style="background:#EEEEEE"></a>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
        <a class="settingbutton" href="#">

        </a>
    </div>        
        <!--              
                HEAD
                        --> 
        <div id="head">
            <div class="left">
                <a href="#" class="button profile"><img src="img/icons/top/huser.png" alt="" /></a>
                Hi, 
                <a href="persionsetting.action">${user.username}</a>
                |
                <a href="logout.action">Logout</a>
            </div>
            <div class="right">
                <form action="#" id="search" class="search placeholder">
                    <label>Looking for something ?</label>
                    <input type="text" value="" name="q" class="text"/>
                    <input type="submit" value="rechercher" class="submit"/>
                </form>
            </div>
        </div>
                
                
        <!--            
                SIDEBAR
                         --> 
       <div id="sidebar">
            <ul>
                <li>
                    <a href="index.action">
                        <img src="img/icons/menu/clipboard.png" alt="" />
                        公告栏
                    </a>
                </li>              
                
                <li class="current"><a href="#"><img src="img/icons/menu/home.png" alt="" /> 教育OA</a>
                    <ul>
                        <li class="current"><a href="index.action">公告栏</a></li>
                        <c:if test="${user.permission eq 2}"><li><a href="manageannounce.action">公告管理</a></li></c:if>
                        <c:if test="${user.permission ne 0}"><li><a href="table.action?p=table">工作交办</a></li></c:if>
                        <li><a href="tabs.action?p=tabs">规章制度</a></li>
                       	<c:if test="${user.permission ne 0}"><li><a href="gallery.action?p=gallery">我的文档</a></li></c:if>
                        <li><a href="typography.action?p=typo">教学计划安排</a></li>
                        <li><a href="calendar.action?p=calendar">日程安排</a></li>
                    </ul>
                </li>
                
                <c:if test="${user.permission eq 2}">
                <li><a href="#"><img src="img/icons/menu/books.png" alt="" /> 学生档案</a>
                    <ul>
                        <li><a href="addfile.action">档案录入</a></li>
                        <li><a href="searchfile.action">档案查询</a></li>
                    </ul>
                </li>
                </c:if>
                
                
                
                <li><a href="#"><img src="img/icons/menu/chart.png" alt="" /> 成绩管理</a>
                    <ul>
                    	<c:if test="${user.permission eq 2}"><li><a href="manageexam.action">考试信息设置</a></li></c:if>
                        <c:if test="${user.permission ne 0}"><li><a href="addscore.action">成绩录入</a></li></c:if>
                        <li><a href="searchscore.action">成绩查询</a></li>
                        <c:if test="${user.permission ne 0}"><li><a href="chart.action">成绩统计</a></li></c:if>
                    </ul>
                </li>
                
                
                
                <c:if test="${user.permission eq 2}">	
                <li><a href="#"><img src="img/icons/menu/inbox.png" alt="" />异动管理</a>
                    <ul>
                        <li><a href="changeclass.action">学生调班</a></li>
                        <li><a href="changeschool.action">学生转学</a></li>
                        <li><a href="reentryschool.action">学生复学</a></li>
                        <li><a href="suspendschool.action">学生休学</a></li>
                        <li><a href="leaveschool.action">学生退学</a></li>
                        <li><a href="searchchange.action">异动查询</a></li>
                    </ul>
                </li>
                </c:if>
                
                
                
                
                <c:if test="${user.permission eq 2}">
                <li><a href="#"><img src="img/icons/menu/settings.png" alt="" />部门设置</a>
                    <ul>
                        <li><a href="settingdepartment.action">部门设置</a></li>
                        <li><a href="settingpost.action">岗位设置</a></li>
                    </ul>
                </li>
                </c:if>
                
                
                <c:if test="${user.permission eq 2}">
                <li><a href="#"><img src="img/icons/menu/settings.png" alt="" />系统权限管理</a>
                    <ul>
                        <li><a href="settingroot.action">权限管理</a></li>
                        <li><a href="settinguser.action">用户管理</a></li>
                    </ul>
                </li>
                </c:if>
            </ul>


        </div>
                            
        <!--            
              CONTENT 
                        --> 
        <div id="content" class="white">
            <h1 style="font-family: '楷体'; line-height: 32px;"><img src="img/icons/dashboard.png" alt="" /> 中国地质大学校讯通</h1>
                
<div class="bloc left">
    <div class="title">
        常用申请
    </div>
    <div class="content dashboard">
        <div class="center">
            <a href="#" class="shortcut">
                <img src="img/page.png" alt="" width="48" height="48"/>
                奖助学金申请
            </a>
            <a href="#" class="shortcut">
                <img src="img/room.png" alt="" width="48" height="48" />
                学生走读申请
            </a>
            <a href="#" class="shortcut">
                <img src="img/contact.png" alt="" width="48" height="48" />
                勤工助学申请
            </a>
            <a href="#" class="shortcut last">
                <img src="img/event.png" alt="" width="48" height="48" />
                助学贷款申请
            </a>
            <div class="cb"></div>
        </div>
        <p>&nbsp&nbsp申请报告打印填写后交至 <a href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D%E4%B8%AD%E5%9B%BD%E5%9C%B0%E8%B4%A8%E5%A4%A7%E5%AD%A6%E6%95%99%E5%8A%A1%E7%A7%91">教务处</a></p>
    </div>
</div>


                
<div class="bloc right">
    <div class="title">
        今日要闻
    </div>
    <div class="content">
         <div class="cb">
         	<ul><a href="dashboard.jsp?p=index">关于收看“2016年全国大中学生文艺会演”通知</a> <span class="time">2016-05-14</span></ul>
            <ul><a href="dashboard.jsp?p=index">中国地质大学第七届民族文化展演活动告示</a><span class="time">2016-05-14</span></ul>
            <ul><a href="dashboard.jsp?p=index">关于2016年上半年计算机等级考试的通知</a><span class="time">2016-05-14</span></ul>
            <ul><a href="dashboard.jsp?p=index">第四届区域气候变化监测与检测学术研讨会(第二轮通知)</a><span class="time">2016-05-14</span></ul>
         </div>
    </div>
</div>


<div class="cb"></div>


           
<div class="bloc">
    <div class="title">
        教务公告
    </div>
    <div class="content">
        <div class="cb">
            <ul><a href="dashboard.html?p=index">关于2016年上半年CET及小语种考试报名的通知</a> <span class="time">2016-05-11</span></ul>
            <ul><a href="dashboard.html?p=index">“超级课程表”非学校承认的课程表</a><span class="time">2016-05-05</span></ul>
            <ul><a href="dashboard.html?p=index">关于2016年上半年计算机等级考试的通知</a><span class="time">2016-05-01</span></ul>
            <ul><a href="dashboard.html?p=index">关于2016年上半年软件能力考试的通知</a><span class="time">2016-04-21</span></ul>
            <ul><a href="dashboard.html?p=index">关于举办“2016年中国户外教育与户外产业发展论坛”的通知</a><span class="time">2016-04-17</span></ul>
            <ul><a href="dashboard.html?p=index">“高校学生事务标准与评估”高级研修班通知</a><span class="time">2016-04-10</span></ul>
        </div>
    </div>
</div>   

<div class="bloc">
    <div class="title">
        学工公告
    </div>
    <div class="content">
        <div class="cb">
            <ul><a href="dashboard.html?p=index">2016年第四期宿舍文明联检简 </a> <span class="time">2016-05-11</span></ul>
            <ul><a href="dashboard.html?p=index">2016年第六期宿舍文明联检简报 </a><span class="time">2016-05-05</span></ul>
            <ul><a href="dashboard.html?p=index">我校4个学生寝室获评湖北省示范文明寝室 </a><span class="time">2016-05-01</span></ul>
            <ul><a href="dashboard.html?p=index">2015-2016学年新疆少数民族困难补助结果公示 </a><span class="time">2016-04-21</span></ul>
            <ul><a href="dashboard.html?p=index">关于“助学 筑梦 铸人”主题征文及视频获奖作品的公示 </a><span class="time">2016-04-17</span></ul>
            <ul><a href="dashboard.html?p=index">“高校学生事务标准与评估”高级研修班通知</a><span class="time">2016-04-10</span></ul>
        </div>
    </div>
</div>        

</div>
        
        
    </body>
</html>