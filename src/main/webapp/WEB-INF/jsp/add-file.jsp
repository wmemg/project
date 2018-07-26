<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <title>Your Admin Panel</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

        
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
                <li  class="current"><a href="#"><img src="img/icons/menu/books.png" alt="" /> ѧ������</a>
                    <ul>
                        <li  class="current"><a href="addfile.action">����¼��</a></li>
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
            <h1><img src="img/icons/posts.png" alt="" /> ѧ������</h1>

<div class="bloc">
    <div class="title">����¼��</div>
    <div class="content">
   
    <form action="addFileByFile.action" method="post" enctype="multipart/form-data">
        <div class="input">
            <label for="file">ѡ�����ļ�</label>
            <input type="file" name="myfile" />
        </div>
        <div class="submit">
            <input type="submit" value="���벢����" />
            <input type="reset" value="���벢����" class="black"/>
            <input type="reset" value="���벢ɾ��" class="white"/>
            <h5 style="font-family:����;width:280px;float:right ;padding-right: 300px;padding-top: 10px;color:#8B3626;">${msg}</h5>
        </div>
    </form>
    
    </div>
</div>        

<div class="bloc">
    <div class="title">��������</div>
    <div class="content">
        <form action="addFile.action" method="post">
            <table class="inputfile">
                <tr>
                    <td class="inputlabel"><label>��    ����</label></td>
                    <td><div class="input"><input type="text" style="width:153px; margin-bottom:5px;" name="stuName"/></div><h4 style="margin-left:20px;color:#8B0000;">*</h4></td>
                    <td class="inputlabel"><label>ѧ    �ţ�</label></td>
                    <td><input type="text" name="stuId"/><h4 style="margin-left:20px;padding-top: 10px;color:#8B0000;">*</h4></td>
                </tr>
                <tr>
                    <td class="inputlabel"><label>��    ��</label></td>
                    <td>
                        <select name="stuSex" id="select">
                        <option value="��" >��</option>
                        <option value="Ů" >Ů</option>
                        </select>
                    </td>
                    <td class="inputlabel"><label>���֤�ţ�</label></td>
                    <td><input type="text" name="stuIdcard"/></td>
                </tr>
                <tr>
                    <td class="inputlabel"><label>��    �壺</label></td>
                    <td>
                        <select name="stuNation">
                        <option value="����" >����</option>
                        <option value="ά�����">ά�����</option>
                        <option value="����">����</option>
                        </select>
                    </td>
                    <td class="inputlabel"><label>��    ϵ��</label></td>
                    <td>
                        <select name="stuRelation1">
                        <option value="����" >����</option>
                        <option value="ĸ��" >ĸ��</option>
                        <option value="�ֵ�" >�ֵ�</option>
                        <option value="����" >����</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="inputlabel"><label>Ѫ    �ͣ�</label></td>
                    <td>
                        <select name="stuBloodtype" id="select">
                        <option value="A��" >A��</option>
                        <option value="B��">B��</option>
                        <option value="O��" >O��</option>
                        <option value="AB��" >AB��</option>
                        </select>
                    </td>
                    <td class="inputlabel"><label>�ҳ�������</label></td>
                    <td><input type="text" name="stuParentname1"/></td>
                </tr>
                <tr>
                    <td class="inputlabel"><label>��У���ڣ�</label></td>
                    <td><div class="input" >
                    <input type="text" class="datepicker" id="input4" style="margin-bottom:5px;" name="stuIntime"/>
                    </div></td>
                    <td class="inputlabel"><label>�ҳ��ֻ���</label></td>
                    <td><input type="text" name="stuParenttel"/></td>
                </tr>
                <tr>
                    <td class="inputlabel"><label>�������ڣ�</label></td>
                    <td><div class="input">
                    <input type="text" class="datepicker" id="input5" style="margin-bottom:5px;" name="stuBirthday"/>
                    </div></td>
                    <td class="inputlabel"><label>��    ϵ��</label></td>
                    <td>
                        <select name="stuRelation2">
                        <option value="����">����</option>
                        <option value="ĸ��">ĸ��</option>
                        <option value="�ֵ�">�ֵ�</option>
                        <option value="����">����</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="inputlabel"><label>��ͥסַ��</label></td>
                    <td><input type="text" name="stuAddress"/></td>
                    <td class="inputlabel"><label>�ҳ�������</label></td>
                    <td><input type="text" name="stuParentname2"/></td>
                </tr>
                <tr>
                    <td class="inputlabel"><label>��    �᣺</label></td>
                    <td><input type="text" name="stuNation"/></td>
                    <td class="inputlabel"><label>�ҳ��ֻ���</label></td>
                    <td><input type="text" name="stuParenttel"/></td>
                </tr>
                <tr>
                    <td class="inputlabel"><label>��ͥ�绰��</label></td>
                    <td><input type="text" name="stuParenttel"/></td>
                    <td class="inputlabel"><label>ѧ    Ժ��</label></td>
                    <td><input type="text" name="stuAcademy"/><h4 style="margin-left:20px;padding-top: 10px;color:#8B0000;">*</h4></td>
                </tr>
                    <td class="inputlabel"><label>��    ����</label></td>
                    <td><input type="text" name="stuClassId"/><h4 style="margin-left:20px;padding-top: 10px;color:#8B0000;">*</h4></td>
                    <td class="inputlabel"><label>ר    ҵ��</label></td>
                    <td><input type="text" name="stuDept"/><h4 style="margin-left:20px;padding-top: 10px;color:#8B0000;">*</h4></td>
                
            </table>
	        <div class="submit" style="padding-left: 150px;padding-top: 5px;">
            	<h5 style="font-family:����;width:280px;float:left ;padding-right: 300px;padding-top: 10px;color:#8B3626;">${msg}</h5>
            	<input type="reset" value="��  ��" class="black" style="margin-right: 50px;" />
            	<input type="submit" value="��  ��" class="white" />
        	</div>
         </form>
    </div>
</div>
        
        
    </body>
</html>