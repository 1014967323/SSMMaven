package cn.dxjava.www.pojo;

public class Role_Power {
    private String rolename;
    private int pid;
    private String grantdate;

    public Role_Power(){

    }

    public Role_Power(int pid){
        this.pid = pid;
    }

    public Role_Power(String rolename){
        this.rolename = rolename;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getGrantdate() {
        return grantdate;
    }

    public void setGrantdate(String grantdate) {
        this.grantdate = grantdate;
    }
}
