package DBPKG;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VottingDAO {
    private JDBConnect jdbc;

    // DAO 생성자
    public VottingDAO(JDBConnect jdbc) {
        this.jdbc = jdbc;
    }

    // 투표번호와 이름을 가져오는 메서드
    public List<VottingDTO> getVoteNumbers() throws SQLException {
        List<VottingDTO> voteNumbers = new ArrayList<>();
        String sql = "SELECT m_no, m_name FROM tbl_member_202005"; // 회원 번호와 이름을 선택합니다.

        try (Connection conn = jdbc.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             java.sql.ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String m_no = rs.getString("m_no");
                String m_name = rs.getString("m_name");
                
                voteNumbers.add(new VottingDTO(m_no, m_name));
            }
        }
        return voteNumbers;
    }

    // 투표 정보를 삽입하는 메서드
    public void submitVote(String jumin, String name, String voteNo, String voteTime, String votePlace, String check) throws SQLException {
        String sql = "INSERT INTO tbl_vote_202005 VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = jdbc.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, jumin);
            pstmt.setString(2, name);
            pstmt.setString(3, voteNo);
            pstmt.setString(4, voteTime);
            pstmt.setString(5, votePlace);
            pstmt.setString(6, check);

            pstmt.executeUpdate();
        }
    }
}
