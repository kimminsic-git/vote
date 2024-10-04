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
		<h2>후보정보조회</h2><br>
			<table border="1">
				<tr>
					<th>후보번호</th>
					<th>성명</th>
					<th>소속정당</th>
					<th>학력</th>
					<th>주민번호</th>
					<th>지역수</th>
					<th>대표전화</th>
				</tr>
			<%
                JDBConnect jdbc = new JDBConnect();
                List<MemberDTO> members = null;

                try {
                    MemberDAO memberDAO = new MemberDAO(jdbc);
                    members = memberDAO.getMembers();

                    for (MemberDTO member : members) {
            %>
                        <tr>
                            <td><%= member.getMemberNumber() %></td>
                            <td><%= member.getName() %></td>
                            <td><%= member.getPartyName() %></td>
                            <td><%= member.getEducation() %></td>
                            <td><%= member.getSocialNumber() %></td>
                            <td><%= member.getCity() %></td>
                            <td><%= member.getTelephone() %></td>
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