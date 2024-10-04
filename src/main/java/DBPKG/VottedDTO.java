package DBPKG;

public class VottedDTO {
    private String memberNumber; // 회원 번호
    private String memberName;   // 회원 이름
    private String totalVote;    // 총 투표 수

    // 생성자
    public VottedDTO(String memberNumber, String memberName, String totalVote) {
        this.memberNumber = memberNumber;
        this.memberName = memberName;
        this.totalVote = totalVote;
    }

    // Getter와 Setter
    public String getMemberNumber() {
        return memberNumber;
    }

    public void setMemberNumber(String memberNumber) {
        this.memberNumber = memberNumber;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getTotalVote() {
        return totalVote;
    }

    public void setTotalVote(String totalVote) {
        this.totalVote = totalVote;
    }

}
