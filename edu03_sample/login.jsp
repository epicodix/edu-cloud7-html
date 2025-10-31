<%@ page pageEncoding="utf-8"%>

<html>

<body>

<%

  String id, pw;  

  id = request.getParameter("id");

  pw = request.getParameter("pw");

  out.println("id "+ id + "<br>");

  out.println("pw "+ pw + "<br>");

  if ( pw.equals("2") )

    out.println("로그인 성공<br>");

  else

    out.println("로그인 실패<br>");

%>

<a href="/"> GoToHome </a><br>

</body>

</html>
