package DBPKG;

public class VottingDTO {
    private String memberNumber; // 회원 번호
    private String memberName;   // 회원 이름

    // 기본 생성자
    public VottingDTO() {
    }

    // 매개변수가 있는 생성자
    public VottingDTO(String memberNumber, String memberName) {
        this.memberNumber = memberNumber;
        this.memberName = memberName;
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

    @Override
    public String toString() {
        return "VottingDTO [memberNumber=" + memberNumber + ", memberName=" + memberName + "]";
    }
}
