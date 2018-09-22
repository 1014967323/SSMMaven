package cn.dxjava.www.pojo;

public class Role_PowerName {
    private String rolename;
    private String pname;

    public Role_PowerName(String rolename,String pname){
        this.rolename = rolename;
        this.pname = pname;
    }

    public Role_PowerName(){}

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }
}
