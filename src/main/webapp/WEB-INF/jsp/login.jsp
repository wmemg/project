<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
    
<!DOCTYPE html>
<html lang="en">
<head>
<title>login</title>

<style type="text/css">
html{overflow-y:scroll;vertical-align:baseline;}
body{font-family:Microsoft YaHei,Segoe UI,Tahoma,Arial,Verdana,sans-serif;font-size:12px;color:#fff;height:100%;line-height:1;background:#999}
*{margin:0;padding:0}
ul,li{list-style:none}
h1{font-size:30px;font-weight:700;text-shadow:0 1px 4px rgba(0,0,0,.2)}
.login-box{width:410px;margin:120px auto 0 auto;text-align:center;padding:30px;background:url(img/mask.png);border-radius:10px;}
.login-box .name,.login-box .password,.login-box .code,.login-box .remember{font-size:16px;text-shadow:0 1px 2px rgba(0,0,0,.1)}
.login-box .login{width: 350px;margin-left: 30px;}
.login-box label{display:inline-block;width:70px;text-align:right;vertical-align:middle}
 @font-face {font-family: myFont; src: url('css/fonts/GBK.TTF');}
.login-box h1{font-family: myFont;font-size: 40px;}
.login-box #code{width:120px}
.login-box .codeImg{float:right;margin-top:26px;margin-right: 20px;}
.login-box img{width:110px;height:42px;border:none}
input[type=text],input[type=password]{width:250px;height:42px;margin-top:25px;padding:0px 15px;border:1px solid rgba(255,255,255,.35);border-radius:6px;color:#fff;letter-spacing:2px;font-size:16px;background:transparent;}
.login{cursor:pointer;width:100%;height:44px;padding:0;background:#ef4300;border:1px solid #ff730e;border-radius:6px;font-weight:700;color:#fff;font-size:24px;letter-spacing:15px;text-shadow:0 1px 2px rgba(0,0,0,.1)}
input:focus{outline:none;box-shadow:0 2px 3px 0 rgba(0,0,0,.1) inset,0 2px 7px 0 rgba(0,0,0,.2)}
.login:hover{box-shadow:0 15px 30px 0 rgba(255,255,255,.15) inset,0 2px 7px 0 rgba(0,0,0,.2)}
.screenbg{position:fixed;bottom:0;left:0;z-index:-999;overflow:hidden;width:100%;height:100%;min-height:100%;}
.screenbg ul li{display:block;list-style:none;position:fixed;overflow:hidden;top:0;left:0;width:100%;height:100%;z-index:-1000;float:right;}
.screenbg ul a{left:0;top:0;width:100%;height:100%;display:inline-block;margin:0;padding:0;cursor:default;}
.screenbg a img{vertical-align:middle;display:inline;border:none;display:block;list-style:none;position:fixed;overflow:hidden;top:0;left:0;width:100%;height:100%;z-index:-1000;float:right;}
.bottom{margin:8px auto 0 auto;width:100%;position:fixed;text-align:center;bottom:0;left:0;overflow:hidden;padding-bottom:8px;color:#ccc;word-spacing:3px;zoom:1;}
.bottom a{color:#FFF;text-decoration:none;}
.bottom a:hover{text-decoration:underline;}
.erroralter{height: 50px;}
</style>


<%-- <spring:url value="js/jquery-1.8.2.min.js" var="jQ" /> --%>

<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".screenbg ul li").each(function(){
		$(this).css("opacity","0");
	});
	$(".screenbg ul li:first").css("opacity","1");
	var index = 0;
	var t;
	var li = $(".screenbg ul li");	
	var number = li.size();
	function change(index){
		li.css("visibility","visible");
		li.eq(index).siblings().animate({opacity:0},3000);
		li.eq(index).animate({opacity:1},3000);
	}
	function show(){
		index = index + 1;
		if(index<=number-1){
			change(index);
		}else{
			index = 0;
			change(index);
		}
	}
	t = setInterval(show,8000);
	//根据窗口宽度生成图片宽度
	var width = $(window).width();
	$(".screenbg ul img").css("width",width+"px");
});
</script>

</head>

<body>
<%-- <spring:url value="UI/img" var="img" /> --%>
<div class="login-box">
	<h1>中国地质大学校讯通</h1>
	<form method="post" action="login.action">
		<div class="name">
			<label>账 号：</label>
			<input type="text" name="username" id="" tabindex="1" autocomplete="off" />
		</div>
		<div class="password">
			<label>密  码：</label>
			<input type="password" name="password" maxlength="16" id="" tabindex="2"/>
		</div>
		<div class="code">
			<label>验证码：</label>
			<input type="text" name="check" maxlength="6" id="code" tabindex="3"/>
			<div class="codeImg">
				<img src="img/captcha.jpeg.jpg" />
			</div>
		</div>
		<div class="erroralter">
			<h3 style="padding-top:20px;color:white">${msg}</h3>
		</div>
		<div>
			<input  type="submit"  tabindex="5" class="login" value="登 录"/>
		</div>
	</form>
</div>

<div class="bottom">©2014 Leting <a href="javascript:;" target="_blank">关于</a> <span>京ICP证030173号</span><img width="13" height="16" src="img/copy_rignt_24.png" /></div>

<div class="screenbg">
	<ul>
		<li><a href="javascript:;"><img src="img/0.jpg"></a></li>
		<li><a href="javascript:;"><img src="img/1.jpg"></a></li>
		<li><a href="javascript:;"><img src="img/2.jpg"></a></li>
	</ul>
</div>

</body>
</html>