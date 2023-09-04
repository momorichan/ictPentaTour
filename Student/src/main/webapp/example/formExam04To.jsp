<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	Integer age = Integer.parseInt(request.getParameter("age"));
	String image = request.getParameter("image");
	String money = request.getParameter("money");
	String gender = request.getParameter("gender");
	String[] hobbies = request.getParameterValues("hobby");
	String job = request.getParameter("job");
	String comment = request.getParameter("comment");
	
	String hobby = "";
	if(hobbies == null){
		hobby = "";
	}else{
		for(int i = 0; i<hobbies.length;i++){
			hobby += hobbies[i] + ", ";
		}
		hobby = hobby.substring(0, hobby.length()-2);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : <%=name%><br>
	나이 : <%=age%><br>
	이미지 : <%=image%><br>
	숨김 : <%=money%><br>
	성별 : <%=gender%><br>
	취미 : <%=hobby%><br>
	직업 : <%=job%><br>
	코멘트 : <%=comment%><br>
	이름 : ${param.name}<br>
	나이 : ${param.age}<br>
	이미지 : ${param.image}<br>
	숨김 : ${param.money}<br>
	성별 : ${param.gender}<br>
	취미 : 
	${paramValues.hobby[0]}
	${paramValues.hobby[1]}
	${paramValues.hobby[2]}
	<br>
	직업 : ${param.job}<br>
	코멘트 : ${param.comment}<br>
</body>
</html>