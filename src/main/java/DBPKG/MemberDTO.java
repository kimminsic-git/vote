package DBPKG;

public class MemberDTO {
    private String memberNumber; // 회원번호
    private String name;         // 이름
    private String partyName;    // 소속 정당
    private String education;    // 학력
    private String socialNumber; // 주민번호
    private String city;         // 지역
    private String telephone;    // 전화번호

    // 생성자
    public MemberDTO(String memberNumber, String name, String partyName, String education, String socialNumber, String city, String telephone) {
        this.memberNumber = memberNumber;
        this.name = name;
        this.partyName = partyName;
        this.education = education;
        this.socialNumber = socialNumber;
        this.city = city;
        this.telephone = telephone;
    }

    // Getter와 Setter
    public String getMemberNumber() { return memberNumber; }
    public void setMemberNumber(String memberNumber) { this.memberNumber = memberNumber; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getPartyName() { return partyName; }
    public void setPartyName(String partyName) { this.partyName = partyName; }

    public String getEducation() { return education; }
    public void setEducation(String education) { this.education = education; }

    public String getSocialNumber() { return socialNumber; }
    public void setSocialNumber(String socialNumber) { this.socialNumber = socialNumber; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getTelephone() { return telephone; }
    public void setTelephone(String telephone) { this.telephone = telephone; }
}
