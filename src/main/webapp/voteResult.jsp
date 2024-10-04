<%@page import="DBPKG.VottedDTO"%>
<%@page import="DBPKG.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="DBPKG.MemberDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<header><jsp:include page="header.jsp" /></header>

<main>
	<section class="main-section">
		<h2>후보자등수</h2><br>
			<table border="1">
				<tr>
					<th>후보번호</th>
					<th>성명</th>
					<th>총투표건수</th>
				</tr>
			 <%
                JDBConnect jdbc = new JDBConnect();
                List<VottedDTO> votes = null;

                try {
                    MemberDAO memberDAO = new MemberDAO(jdbc);
                    votes = memberDAO.votted(); // getvotepeople 메서드 호출

                    for (VottedDTO vote : votes) {
            %>
                        <tr>
                            <td><%= vote.getMemberNumber() %></td>
                            <td><%= vote.getMemberName() %></td>
                            <td><%= vote.getTotalVote() %></td>
                        </tr>
            <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("오류가 발생했습니다");
                } finally {
                    if (jdbc != null) {
                        jdbc.close(); // 연결 닫기
                    }
                }
            %>
			</table>
	</section>
</main>
 
<footer><jsp:include page="footer.jsp" /></footer>
</body>
</html>	