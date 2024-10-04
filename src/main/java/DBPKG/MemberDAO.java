package DBPKG;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
    private JDBConnect jdbc;

    // DAO 생성자
    public MemberDAO(JDBConnect jdbc) {
        this.jdbc = jdbc;
    }

    // 회원 목록을 가져오는 메서드
    public List<MemberDTO> getMembers() throws SQLException {
        List<MemberDTO> members = new ArrayList<>();
        String sql = "SELECT a.m_no, a.m_name, b.p_name, a.p_school, a.m_jumin, a.m_city, b.P_TEL1, b.P_TEL2, b.P_TEL3 "
                    + "FROM tbl_member_202005 a "
                    + "JOIN tbl_party_202005 b ON b.p_code = a.p_code";

        try (PreparedStatement pstmt = jdbc.getConnection().prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String memberNumber = rs.getString("m_no");
                String name = rs.getString("m_name");
                String partyName = rs.getString("p_name");
                int educationCode = rs.getInt("p_school");
                String socialNumber = rs.getString("m_jumin");
                String city = rs.getString("m_city");
                String tel1 = rs.getString("P_TEL1");
                String tel2 = rs.getString("P_TEL2");
                String tel3 = rs.getString("P_TEL3");
                String telephone = tel1 + "-" + tel2 + "-" + tel3;

                String education;
                switch (educationCode) {
                    case 1: education = "고졸"; break;
                    case 2: education = "학사"; break;
                    case 3: education = "석사"; break;
                    case 4: education = "박사"; break;
                    default: education = "정보 없음"; break;
                }

                String formattedSocialNumber = socialNumber.substring(0, 6) + "-" + socialNumber.substring(6);

                members.add(new MemberDTO(memberNumber, name, partyName, education, formattedSocialNumber, city, telephone));
            }
        }
        return members;
    }
    public List<VoteDTO> getvotepeople() throws SQLException {
        List<VoteDTO> vote = new ArrayList<>();
        String sql = "SELECT v_name, v_jumin, v_no, v_time, v_confirm "
                    + "FROM tbl_vote_202005 "
                    + "WHERE v_area ='제1투표장'";

        try (PreparedStatement pstmt = jdbc.getConnection().prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String v_name = rs.getString("v_name");
                String v_jumin = rs.getString("v_jumin");
	                String year ="19" + v_jumin.substring(0,2);
	                String month = v_jumin.substring(2,4);
	                String day = v_jumin.substring(4,6);
	                String birth = year +"년"+month+"월"+day+"일생";
	            String age;
		            LocalDate bir = LocalDate.of(Integer.parseInt(year),Integer.parseInt(month),Integer.parseInt(day));
		            LocalDate today = LocalDate.now();
	            	age ="만 " +Period.between(bir, today).getYears()+"세";
	            int gender = Integer.parseInt(v_jumin.substring(6,7));
		            String genders;
		            switch (gender) {
		            case 1: case 3: genders = "남성"; break;
		            case 2: case 4: genders = "여성"; break;
		            default: genders = "정보 없음"; break;
		            }	            
                String v_no = rs.getString("v_no");
                String v_time = rs.getString("v_time");
                	String time = v_time.substring(0,2)+":"+v_time.substring(2,4);
                String v_confirm = rs.getString("v_confirm");
                	String confirm = "";
                	if (v_confirm.equals("N")) {
                	    confirm = "미확인";
                	} else if (v_confirm.equals("Y")) {
                	    confirm = "확인";
                	}
                
                vote.add(new VoteDTO(v_name, birth, age, genders, v_no, time, confirm));
            }
        }
        return vote;
    }
    public List<VottedDTO> votted() throws SQLException {
        List<VottedDTO> vottd = new ArrayList<>();
        String sql = "SELECT a.m_no, a.m_name, COUNT(v_no) AS totalvote "
        			+"FROM tbl_member_202005 a "
        			+"JOIN tbl_vote_202005 b ON b.v_no = a.m_no "
        			+"WHERE b.v_confirm = 'Y' "
        			+"GROUP BY m_no, a.m_name "
        			+"ORDER BY totalvote desc";

        try (PreparedStatement pstmt = jdbc.getConnection().prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
            	String no =rs.getString("m_no");
            	String name =rs.getString("m_name");
            	String totalvote =rs.getString("totalvote");

            	vottd.add(new VottedDTO(no, name, totalvote));
            }
        }
        return vottd;
    }
}
