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
            <a href="url(css/img/bg.html" class="backgroundChanger active" title="White"></a>
            <a href="url(css/img/dark-bg.html" class="backgroundChanger dark" title="Dark"></a>
            <a href="url(css/img/wood.html" class="backgroundChanger dark" title="Wood"></a>
            <a href="url(css/img/altbg/smoothwall.html" class="backgroundChanger" title="Smoothwall"></a>
            <a href="url(css/img/altbg/black_denim.html" class="backgroundChanger dark" title="black_denim"></a>
            <a href="url(css/img/altbg/carbon.html" class="backgroundChanger dark" title="Carbon"></a>
            <a href="url(css/img/altbg/double_lined.html" class="backgroundChanger" title="Double lined"></a>
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
                        ������
                    </a>
                </li>
                <li><a href="#"><img src="img/icons/menu/home.png" alt="" /> ����OA</a>
                    <ul>
                        <li><a href="index.action">������</a></li>
                        <c:if test="${user.permission eq 2}"><li><a href="manageannounce.action">�������</a></li></c:if>
                        <c:if test="${user.permission ne 0}"><li><a href="table.action?p=table">��������</a></li></c:if>
                        <li><a href="tabs.action?p=tabs">�����ƶ�</a></li>
                       	<c:if test="${user.permission ne 0}"><li><a href="gallery.action?p=gallery">�ҵ��ĵ�</a></li></c:if>
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
                <li class="current"><a href="#"><img src="img/icons/menu/settings.png" alt="" />��������</a>
                    <ul>
                        <li><a href="settingdepartment.action">��������</a></li>
                        <li class="current"><a href="settingpost.action">��λ����</a></li>
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
        <div style="width: 1000px height: 67px;">
        <h1 style="width: 200px;float:left;"><img src="img/icons/posts.png" alt="" /> ��λ����</h1>
        <div class="work">
            <div action="#" class="search-work">
                <input type="text" value="" name="q" class="text"/>
            </div>
            <div action="#" class="workbutton">
                <img src="img/icons/menu/search.png" alt="" />
            </div>
            <div action="#" class="workbutton">
                <img src="img/icons/trash-shredder.png" alt="" />
            </div>
        </div>
        </div>
        <div class="bloc">
    <div class="title">������λ����</div>
    <div class="content">
        <div class="input">
            <label for="file">ѡ�����ļ�</label>
            <input type="file" id="file" />
        </div>
        <div class="submit">
            <input type="submit" value="���벢����" />
            <input type="reset" value="���벢����" class="black"/>
            <input type="reset" value="���벢ɾ��" class="white"/>
        </div>
    </div>
</div>        

<div class="bloc">
    <div class="title">������λ</div>
    <div class="content">
        <form enctype="multipart/form-data" action="ashx/login.ashx" method="post">
            <table class="inputfile">
                <tr>
                    <td class="inputlabel"><label>��λ���ƣ�</label></td>
                    <td class="input-input"><input type="text" /></td>
                    <td class="inputlabel"><label>�������ţ�</label></td>
                    <td>
                        <select>
                        <option value="1">�Ź�ѧԺ</option>
                        <option value="2">У��ί</option>
                        <option value="3">����ѧԺ</option>
                        <option value="3">��ԴѧԺ</option>
                        <option value="3">�鱦ѧԺ</option>
                        <option value="3">����ѧԺ</option>
                        <option value="3">����ѧԺ</option>
                        <option value="3">����ѧԺ</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="inputlabel"><label>�� �� �ˣ�</label></td>
                    <td><input type="text" /></td>
                    <td class="inputlabel"><label>����ʱ�䣺</label></td>
                    <td><input type="text" /></td>
                </tr>
                <tr>
                    <td class="inputlabel"><label>��    Ա��</label></td>
                    <td><input type="text" /></td>
                    <td class="inputlabel"><label>��λ��ţ�</label></td>
                    <td><input type="text" /></td>
                </tr>
            </table>
        </form>
        <div class="submit" style="padding-left: 680px;padding-top: 5px;">
            <input type="reset" value="��  ��" class="black" style="margin-right: 50px;" />
            <input type="reset" value="��  ��" class="white"/>
        </div>      
    </div>
    </div>
    <div class="bloc">
        <div class="title">
            ѧ������
        </div>
        <div class="content">
            <table>
                <thead>
                    <tr>
                        <th><input type="checkbox" class="checkall"/></th>
                        <th>��λ����</th>
                        <th>��λ���</th>
                        <th>��������</th>
                        <th>������</th>
                        <th>��Ա</th>
                        <th>����ʱ��</th>
                        <th>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp����</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">����</a></td>
                        <td>007</td>
                        <td>��Ϣ����ѧԺ</td>
                        <td>����</td>
                        <td>���� ����</td>
                        <td>2016.05.03</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">����</a></td>
                        <td>007</td>
                        <td>��Ϣ����ѧԺ</td>
                        <td>����</td>
                        <td>���� ����</td>
                        <td>2016.05.03</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">����</a></td>
                        <td>007</td>
                        <td>��Ϣ����ѧԺ</td>
                        <td>����</td>
                        <td>���� ����</td>
                        <td>2016.05.03</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">����</a></td>
                        <td>007</td>
                        <td>��Ϣ����ѧԺ</td>
                        <td>����</td>
                        <td>���� ����</td>
                        <td>2016.05.03</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">����</a></td>
                        <td>007</td>
                        <td>��Ϣ����ѧԺ</td>
                        <td>����</td>
                        <td>���� ����</td>
                        <td>2016.05.03</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>             
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">����</a></td>
                        <td>007</td>
                        <td>��Ϣ����ѧԺ</td>
                        <td>����</td>
                        <td>���� ����</td>
                        <td>2016.05.03</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">����</a></td>
                        <td>007</td>
                        <td>��Ϣ����ѧԺ</td>
                        <td>����</td>
                        <td>���� ����</td>
                        <td>2016.05.03</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">����</a></td>
                        <td>007</td>
                        <td>��Ϣ����ѧԺ</td>
                        <td>����</td>
                        <td>���� ����</td>
                        <td>2016.05.03</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">����</a></td>
                        <td>007</td>
                        <td>��Ϣ����ѧԺ</td>
                        <td>����</td>
                        <td>���� ����</td>
                        <td>2016.05.03</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                                    
                </tbody>
            </table>
            <div class="left input">
                <!--ȫ��ɾ����ť����������������-->

            </div>
            <div id="pageDiv" class="pagination">
					<a href="#">��һҳ</a>&nbsp;&nbsp;&nbsp;<a href="#">��һҳ</a>
				</div>
        </div>   
    </div>
    </div>
    </div>
</body>
</html>