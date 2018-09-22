package cn.dxjava.www.pojo;

public class User_Role {

    private int uid;
    private String rolename;
    private String rolegrantdate;

    public  User_Role(){}

    public User_Role(int uid){
        this.uid = uid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
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
