package cn.dxjava.www.service;

import cn.dxjava.www.pojo.Admin;
import cn.dxjava.www.pojo.CUser;

import java.util.List;

public interface AdminService {

    /**
     * 查询所有管理员信息
     * @return
     */
    public List<Admin> selectAdminInfo();

    /**
     * 批量重置密码
     * @param uids
     * @return
     */
    public boolean resetPsw(List<CUser> uids);

    /**
     * 添加用户 以及 所属角色
     * @param admin
     * @return
     */
    public boolean addUser(Admin admin);

    /**
     * 修改用户 以及 所属角色
     * @param admin
     * @return
     */
    public boolean updaUser(Admin admin);

    /**
     * 删除用户 以及 所属角色
     * @param uid
     * @return
     */
    public boolean delUser(int uid);
}
