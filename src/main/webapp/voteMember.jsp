<%@page import="DBPKG.VottingDTO"%>
<%@page import="DBPKG.VottingDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="DBPKG.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
<link rel="stylesheet" href="style1.css">
<style>
    td {
        text-align: left;
        padding-left: 10px;
    }
    button {
    	padding: 5px;
    	width: 100px;
    }
</style>
<script>
function validateForm() {
    var jumin = document.forms["voteForm"]["jumin"].value;
    var name = document.forms["voteForm"]["name"].value;
    var voteNo = document.forms["voteForm"]["voteNo"].value;
    var voteTime = document.forms["voteForm"]["voteTime"].value;
    var votePlace = document.forms["voteForm"]["votePlace"].value;
    var check = document.querySelector('input[name="check"]:checked');
    
    var error = [];
    
    if (jumin == "") {
        error.push("주민번호가 입력되지 않았습니다!");
    }if (name == "") {
    	error.push("성명이 입력되지 않았습니다!");
    }if (voteNo == "") {
    	error.push("후보번호가 선택되지 않았습니다!");
    }if (voteTime == "") {
    	error.push("투표시간이 입력되지 않았습니다!");
    }if (votePlace == "") {
    	error.push("투표장소가 입력되지 않았습니다!");
    }if (!check) {
    	error.push("유권자확인이 선택되지 않았습니다!");
    }if (error.length > 0) {
    	alert(error.join("\n"));
    	return false;
    }
    return true;
}
</script>
</head>
<body>
<header><jsp:include page="header.jsp" /></header>

<main>
    <section class="main-section">
        <h2>투표하기</h2><br>
        <form name="voteForm" action="submitVote.jsp" method="post" onsubmit="return validateForm()">
            <table border="1">
                <tr>
                    <th>주민번호</th>
                    <td><input type="text" name="jumin" autofocus>예 : 8906153154726</td>
                </tr>
                <tr>
                    <th>성명</th>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <th>투표번호</th>
                    <td>
                        <select name="voteNo">
                            <option value="">선택</option>
                            <%
                            JDBConnect jdbc = new JDBConnect();
                                                            List<VottingDTO> voteNumbers = new ArrayList<>();
                                                            try {
                                                            	VottingDAO vottingDAO = new VottingDAO(jdbc);
                                                                voteNumbers = vottingDAO.getVoteNumbers();
                                                                for (VottingDTO vote : voteNumbers) {
                            %>
                                <option value="<%= vote.getMemberNumber() %>">[<%= vote.getMemberNumber() %>] <%= vote.getMemberName() %></option>
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
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>투표시간</th>
                    <td><input type="text" name="voteTime"></td>
                </tr>
                <tr>
                    <th>투표장소</th>
                    <td><input type="text" name="votePlace"></td>
                </tr>
                <tr>
                    <th>유권자확인</th>
                    <td>
                        <input type="radio" value="Y" name="check"> 확인
                        <input type="radio" value="N" name="check"> 미확인
                    </td>
                </tr>
                <tr>
                    <th colspan="2" height="40px">
                        <button type="submit">투표하기</button>
                        <button type="reset">다시하기</button>
                    </th>
                </tr>
            </table>
        </form>
    </section>
</main>

<footer><jsp:include page="footer.jsp" /></footer>
</body>
</html>
