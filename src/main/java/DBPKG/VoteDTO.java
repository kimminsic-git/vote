package DBPKG;

public class VoteDTO {
    private String name;         // 이름
    private String birth;        // 생년월일
    private String age;             // 나이
    private String gender;       // 성별
    private String voteNumber;   // 투표번호
    private String time;     // 투표시간
    private String confirm;  // 투표확인

    // 생성자
    public VoteDTO(String name, String birth, String age, String gender, String voteNumber, String time, String confirm) {
        this.name = name;
        this.birth = birth;
        this.age = age;
        this.gender = gender;
        this.voteNumber = voteNumber;
        this.time = time;
        this.confirm = confirm;
    }

    // Getter와 Setter
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getBirth() { return birth; }
    public void setBirth(String birth) { this.birth = birth; }

    public String getAge() { return age; }
    public void setAge(String age) { this.age = age; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getVoteNumber() { return voteNumber; }
    public void setVoteNumber(String voteNumber) { this.voteNumber = voteNumber; }

    public String getTime() { return time; }
    public void setTime(String voteTime) { this.time = voteTime; }

    public String getConfirm() { return confirm; }
    public void setConfirm(String confirm) { this.confirm = confirm; }
}
