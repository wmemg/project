<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
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
                <a href="url(css/img/bg.action" class="backgroundChanger active" title="White"></a>
                <a href="url(css/img/dark-bg.action" class="backgroundChanger dark" title="Dark"></a>
                <a href="url(css/img/wood.action" class="backgroundChanger dark" title="Wood"></a>
                <a href="url(css/img/altbg/smoothwall.action" class="backgroundChanger" title="Smoothwall"></a>
                <a href="url(css/img/altbg/black_denim.action" class="backgroundChanger dark" title="black_denim"></a>
                <a href="url(css/img/altbg/carbon.action" class="backgroundChanger dark" title="Carbon"></a>
                <a href="url(css/img/altbg/double_lined.action" class="backgroundChanger" title="Double lined"></a>
                <div class="clear"></div>
            </div>
            <div class="grid3">
                <div class="titre">Bloc style</div>
                <a href="black.action" class="blocChanger" title="Black" style="background:url(css/img/bloctitle.png);"></a>
                <a href="white.action" class="blocChanger active" title="White" style="background:url(css/img/white-title.png);"></a>
                <a href="wood.action" class="blocChanger" title="Wood" style="background:url(css/img/wood-title.jpg);"></a>
                <div class="clear"></div>
            </div>
            <div class="grid3">
                <div class="titre">Sidebar style</div>
                <a href="grey.action" class="sidebarChanger active" title="Grey" style="background:#494949"></a>
                <a href="black.action" class="sidebarChanger" title="Black" style="background:#262626"></a>
                <a href="white.action" class="sidebarChanger" title="White" style="background:#EEEEEE"></a>
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
                        ������
                    </a>
                </li>
                <li class="current"><a href="#"><img src="img/icons/menu/home.png" alt="" /> ����OA</a>
                    <ul>
                        <li><a href="index.action">������</a></li>
                        <c:if test="${user.permission eq 2}"><li><a href="manageannounce.action">�������</a></li></c:if>
                        <c:if test="${user.permission ne 0}"><li><a href="table.action?p=table">��������</a></li></c:if>
                        <li><a href="tabs.action?p=tabs">�����ƶ�</a></li>
                       	<c:if test="${user.permission ne 0}"><li class="current"><a href="gallery.action?p=gallery">�ҵ��ĵ�</a></li></c:if>
                        <li><a href="typography.action?p=typo">��ѧ�ƻ�����</a></li>
                        <li><a href="calendar.action?p=calendar">�ճ̰���</a></li>
                    </ul>
                </li>
                
                <c:if test="${user.permission eq 2}">
                <li><a href="#"><img src="img/icons/menu/books.png" alt="" /> ѧ������</a>
                    <ul>
                        <li><a href="addfile.action">����¼��</a></li>
                        <li><a href="searchfile.action">������ѯ</a></li>
                    </ul>
                </li>
                </c:if>
                
                
                
                <li><a href="#"><img src="img/icons/menu/chart.png" alt="" /> �ɼ�����</a>
                    <ul>
                    	<c:if test="${user.permission eq 2}"><li><a href="manageexam.action">������Ϣ����</a></li></c:if>
                        <c:if test="${user.permission ne 0}"><li><a href="addscore.action">�ɼ�¼��</a></li></c:if>
                        <li><a href="searchscore.action">�ɼ���ѯ</a></li>
                        <c:if test="${user.permission ne 0}"><li><a href="chart.action">�ɼ�ͳ��</a></li></c:if>
                    </ul>
                </li>
                
                
                
                <c:if test="${user.permission eq 2}">	
                <li><a href="#"><img src="img/icons/menu/inbox.png" alt="" />�춯����</a>
                    <ul>
                        <li><a href="changeclass.action">ѧ������</a></li>
                        <li><a href="changeschool.action">ѧ��תѧ</a></li>
                        <li><a href="reentryschool.action">ѧ����ѧ</a></li>
                        <li><a href="suspendschool.action">ѧ����ѧ</a></li>
                        <li><a href="leaveschool.action">ѧ����ѧ</a></li>
                        <li><a href="searchchange.action">�춯��ѯ</a></li>
                    </ul>
                </li>
                </c:if>
                
                
                
                
                <c:if test="${user.permission eq 2}">
                <li><a href="#"><img src="img/icons/menu/settings.png" alt="" />��������</a>
                    <ul>
                        <li><a href="settingdepartment.action">��������</a></li>
                        <li><a href="settingpost.action">��λ����</a></li>
                    </ul>
                </li>
                </c:if>
                
                
                <c:if test="${user.permission eq 2}">
                <li><a href="#"><img src="img/icons/menu/settings.png" alt="" />ϵͳȨ�޹���</a>
                    <ul>
                        <li><a href="settingroot.action">Ȩ�޹���</a></li>
                        <li><a href="settinguser.action">�û�����</a></li>
                    </ul>
                </li>
                </c:if>
            </ul>


        </div>
                
                
                
                
        <!--            
              CONTENT 
                        --> 
        <div id="content" class="white">
            <h1><img src="img/icons/pictures.png" alt="" /> Gallery</h1>
<div class="bloc">
    <div class="title">Picture Gallery</div>
    <div class="content">
        <p>You can have gallery inside a block our outside</p>
        <ul class="gallery">
                        <li>
                <a href="#"><img src="http://lorempixum.com/120/80/food/0" alt=""/></a>
                <span class="info">Image name</span>
                <a href="#" title="delete Image" class="del">Delete</a>
                <a href="#" class="over"><span>Edit this image</span></a>
                <a href="../../../lorempixum.com/800/600/food/0/index25b2.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
            </li>
                        <li>
                <a href="#"><img src="http://lorempixum.com/120/80/food/1" alt=""/></a>
                <span class="info">Image name</span>
                <a href="#" title="delete Image" class="del">Delete</a>
                <a href="#" class="over"><span>Edit this image</span></a>
                <a href="../../../lorempixum.com/800/600/food/1/index25b2.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
            </li>
                        <li>
                <a href="#"><img src="http://lorempixum.com/120/80/food/2" alt=""/></a>
                <span class="info">Image name</span>
                <a href="#" title="delete Image" class="del">Delete</a>
                <a href="#" class="over"><span>Edit this image</span></a>
                <a href="../../../lorempixum.com/800/600/food/2/index25b2.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
            </li>
                        <li>
                <a href="#"><img src="http://lorempixum.com/120/80/food/3" alt=""/></a>
                <span class="info">Image name</span>
                <a href="#" title="delete Image" class="del">Delete</a>
                <a href="#" class="over"><span>Edit this image</span></a>
                <a href="../../../lorempixum.com/800/600/food/3/index25b2.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
            </li>
                        <li>
                <a href="#"><img src="http://lorempixum.com/120/80/food/4" alt=""/></a>
                <span class="info">Image name</span>
                <a href="#" title="delete Image" class="del">Delete</a>
                <a href="#" class="over"><span>Edit this image</span></a>
                <a href="../../../lorempixum.com/800/600/food/4/index25b2.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
            </li>
                        <li>
                <a href="#"><img src="http://lorempixum.com/120/80/food/5" alt=""/></a>
                <span class="info">Image name</span>
                <a href="#" title="delete Image" class="del">Delete</a>
                <a href="#" class="over"><span>Edit this image</span></a>
                <a href="../../../lorempixum.com/800/600/food/5/index25b2.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
            </li>
                        <li>
                <a href="#"><img src="http://lorempixum.com/120/80/food/6" alt=""/></a>
                <span class="info">Image name</span>
                <a href="#" title="delete Image" class="del">Delete</a>
                <a href="#" class="over"><span>Edit this image</span></a>
                <a href="../../../lorempixum.com/800/600/food/625b2html.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
            </li>
                        <li>
                <a href="#"><img src="http://lorempixum.com/120/80/food/7" alt=""/></a>
                <span class="info">Image name</span>
                <a href="#" title="delete Image" class="del">Delete</a>
                <a href="#" class="over"><span>Edit this image</span></a>
                <a href="../../../lorempixum.com/800/600/food/7/index25b2.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
            </li>
                        <li>
                <a href="#"><img src="http://lorempixum.com/120/80/food/8" alt=""/></a>
                <span class="info">Image name</span>
                <a href="#" title="delete Image" class="del">Delete</a>
                <a href="#" class="over"><span>Edit this image</span></a>
                <a href="../../../lorempixum.com/800/600/food/8/index25b2.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
            </li>
                        <li>
                <a href="#"><img src="http://lorempixum.com/120/80/food/9" alt=""/></a>
                <span class="info">Image name</span>
                <a href="#" title="delete Image" class="del">Delete</a>
                <a href="#" class="over"><span>Edit this image</span></a>
                <a href="../../../lorempixum.com/800/600/food/9/index25b2.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
            </li>
			<li>
			<script type="text/javascript"><!--
google_ad_client = "ca-pub-3413404722490728";
/* ����������468+60navigation.html */
google_ad_slot = "9534515323";
google_ad_width = 468;
google_ad_height = 60;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
			</li>
                    </ul>
        <div class="cb"></div>
    </div>
</div>


<ul class="gallery">
        <li>
        <a href="#"><img src="http://lorempixum.com/120/80/food/0" alt=""/></a>
        <span class="info">Image name</span>
        <a href="#" title="delete Image" class="del">Delete</a>
        <a href="#" class="over"><span>Edit this image</span></a>
        <a href="../../../lorempixum.com/800/600/food/0/index25b2.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
    </li>
        <li>
        <a href="#"><img src="http://lorempixum.com/120/80/food/1" alt=""/></a>
        <span class="info">Image name</span>
        <a href="#" title="delete Image" class="del">Delete</a>
        <a href="#" class="over"><span>Edit this image</span></a>
        <a href="../../../lorempixum.com/800/600/food/1/index25b2.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
    </li>
        <li>
        <a href="#"><img src="http://lorempixum.com/120/80/food/2" alt=""/></a>
        <span class="info">Image name</span>
        <a href="#" title="delete Image" class="del">Delete</a>
        <a href="#" class="over"><span>Edit this image</span></a>
        <a href="../../../lorempixum.com/800/600/food/2/index25b2.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
    </li>
        <li>
        <a href="#"><img src="http://lorempixum.com/120/80/food/3" alt=""/></a>
        <span class="info">Image name</span>
        <a href="#" title="delete Image" class="del">Delete</a>
        <a href="#" class="over"><span>Edit this image</span></a>
        <a href="../../../lorempixum.com/800/600/food/3/index25b2.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
    </li>
        <li>
        <a href="#"><img src="http://lorempixum.com/120/80/food/4" alt=""/></a>
        <span class="info">Image name</span>
        <a href="#" title="delete Image" class="del">Delete</a>
        <a href="#" class="over"><span>Edit this image</span></a>
        <a href="../../../lorempixum.com/800/600/food/4/index25b2.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
    </li>
        <li>
        <a href="#"><img src="http://lorempixum.com/120/80/food/5" alt=""/></a>
        <span class="info">Image name</span>
        <a href="#" title="delete Image" class="del">Delete</a>
        <a href="#" class="over"><span>Edit this image</span></a>
        <a href="../../../lorempixum.com/800/600/food/5/index25b2.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
    </li>
        <li>
        <a href="#"><img src="http://lorempixum.com/120/80/food/6" alt=""/></a>
        <span class="info">Image name</span>
        <a href="#" title="delete Image" class="del">Delete</a>
        <a href="#" class="over"><span>Edit this image</span></a>
        <a href="../../../lorempixum.com/800/600/food/625b2html.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
    </li>
        <li>
        <a href="#"><img src="http://lorempixum.com/120/80/food/7" alt=""/></a>
        <span class="info">Image name</span>
        <a href="#" title="delete Image" class="del">Delete</a>
        <a href="#" class="over"><span>Edit this image</span></a>
        <a href="../../../lorempixum.com/800/600/food/7/index25b2.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
    </li>
        <li>
        <a href="#"><img src="http://lorempixum.com/120/80/food/8" alt=""/></a>
        <span class="info">Image name</span>
        <a href="#" title="delete Image" class="del">Delete</a>
        <a href="#" class="over"><span>Edit this image</span></a>
        <a href="../../../lorempixum.com/800/600/food/8/index25b2.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
    </li>
        <li>
        <a href="#"><img src="http://lorempixum.com/120/80/food/9" alt=""/></a>
        <span class="info">Image name</span>
        <a href="#" title="delete Image" class="del">Delete</a>
        <a href="#" class="over"><span>Edit this image</span></a>
        <a href="../../../lorempixum.com/800/600/food/9/index25b2.action?.jpg" class="large zoombox" title="full-size">Enlarge</a>
    </li>
    </ul>

<div class="cb"></div>        </div>
        
        
    </body>
</html>