package cn.dxjava.www.pojo;

import java.io.Serializable;

public class CUser implements Serializable{
    private int uid;
    private String uname;
    private String utel;
    private String uemail;
    private String upsw;
    private boolean[] power={false,false,false,false,false,false,false};

    public CUser(){}

    public CUser(int uid){
        this.uid = uid;
    }

    public boolean[] getPower() {
        return power;
    }

    public void setPower(boolean[] power) {
        this.power = power;
    }


    public String getUtel() {
        return utel;
    }

    public void setUtel(String utel) {
        this.utel = utel;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUpsw() {
        return upsw;
    }

    public void setUpsw(String upsw) {
        this.upsw = upsw;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

}
