package Controller;
import java.io.Serializable;

public class ProfileBean implements Serializable {
   //DECLARE PRIVATE ATTRIBUTES
    private String name;
    private String studentId;
    private String program;
    private String email;
    private String whatsapp;
    private String instagram;
    private String hobbies;
    private String introduction;
    
    //SETTER AND GETTER
    public String getName(){
        return name;
    }
    
    public String getStudentId(){
        return studentId;
    }
    
    public String getProgram(){
        return program;
    }
    
    public String getEmail(){
        return email;
    }
    
    public String getWhatsapp(){
        return whatsapp;
    }
    
    public String getInstagram(){
        return instagram;
    }
    
    public String getHobbies(){
        return hobbies;
    }
    
    public String getIntroduction(){
        return introduction;
    }
    
    public void setName(String name){
        this.name = name;
    }
    
    public void setStudentId(String studentId){
        this.studentId= studentId;
    }
    
    public void setProgram(String program){
        this.program = program;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
    public void setWhatsapp(String whatsapp){
        this.whatsapp = whatsapp;
    }
    
    public void setInstagram (String instagram){
        this.instagram = instagram;
    }
    
    public void setHobbies (String hobbies){
        this.hobbies = hobbies;
    }
    
    public void setIntroduction (String introduction){
        this.introduction = introduction;
    }
}