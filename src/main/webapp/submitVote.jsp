<%@page import="DBPKG.VottingDAO"%>
<%@page import="DBPKG.JDBConnect"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>투표 제출</title>
    <script>
        function showAlert(message, redirectUrl) {
            alert(message);
            window.location.href = redirectUrl;
        }
    </script>
</head>
<body>
    <%
    String jumin = request.getParameter("jumin");
            String name = request.getParameter("name");
            String voteNo = request.getParameter("voteNo");
            String voteTime = request.getParameter("voteTime");
            String votePlace = request.getParameter("votePlace");
            String check = request.getParameter("check");

            JDBConnect jdbc = new JDBConnect();
            VottingDAO vottingDAO = new VottingDAO(jdbc);

            try {
                vottingDAO.submitVote(jumin, name, voteNo, voteTime, votePlace, check);
                // 성공 시 메시지와 리디렉션
                out.println("<script>showAlert('투표가 성공적으로 제출되었습니다!', 'voteMember.jsp');</script>");
            } catch (SQLException e) {
                e.printStackTrace();
                // 실패 시 메시지와 리디렉션
                out.println("<script>showAlert('오류가 발생했습니다: " + e.getMessage() + "', 'voteMember.jsp');</script>");
            } finally {
                if (jdbc != null) {
                    jdbc.close();
                }
            }
    %>
</body>
</html>
