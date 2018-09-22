package cn.dxjava.www.pojo;

public class Admin {

    private int uid;
    private String uname;
    private String uemail;
    private String utel;
    private String upsw;
    private String rolename;
    private String rolegrantdate;

    public Admin(){}

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public String getUtel() {
        return utel;
    }

    public void setUtel(String utel) {
        this.utel = utel;
    }

    public String getUpsw() {
        return upsw;
    }

    public void setUpsw(String upsw) {
        this.upsw = upsw;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public String getRolegrantdate() {
        return rolegrantdate;
    }

    public void setRolegrantdate(String rolegrantdate) {
        this.rolegrantdate = rolegrantdate;
    }
}
