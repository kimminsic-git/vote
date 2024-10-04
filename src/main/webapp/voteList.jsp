<%@page import="DBPKG.VoteDTO"%>
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
<style>
	.main-section h2{
	margin-top: 10px;
}
</style>
</head>
<body>
<header><jsp:include page="header.jsp" /></header>

<main>
	<section class="main-section">
		<h2>투표검수조회</h2><br>
			<table border="1">
				<tr>
					<th>성명</th>
					<th>생년월일</th>
					<th>나이</th>
					<th>성별</th>
					<th>후보번호</th>
					<th>투표시간</th>
					<th>유권자확인</th>
				</tr>
			 <%
                JDBConnect jdbc = new JDBConnect();
                List<VoteDTO> votes = null;

                try {
                    MemberDAO memberDAO = new MemberDAO(jdbc);
                    votes = memberDAO.getvotepeople(); // getvotepeople 메서드 호출

                    for (VoteDTO vote : votes) {
            %>
                        <tr>
                            <td><%= vote.getName() %></td>
                            <td><%= vote.getBirth() %></td>
                            <td><%= vote.getAge() %></td>
                            <td><%= vote.getGender() %></td>
                            <td><%= vote.getVoteNumber() %></td>
                            <td><%= vote.getTime() %></td>
                            <td><%= vote.getConfirm() %></td>
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