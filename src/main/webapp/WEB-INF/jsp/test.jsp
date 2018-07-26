<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
<table>
<c:forEach items="${allusers}" var="alluser">
            <tr>
                <td>${alluser.id}</td>
                <td>${alluser.userName}</td>
                <td>${alluser.age}</td>
            </tr>
</c:forEach>
</table>
</body>
</html>