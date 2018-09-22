package cn.dxjava.www.service;

import cn.dxjava.www.pojo.Admin;
import cn.dxjava.www.pojo.Role_Power;
import cn.dxjava.www.pojo.Role_PowerName;
import cn.dxjava.www.pojo.User_Role;

import java.util.List;

public interface RoleService {
    /**
     * 根据用户id查找用户角色
     * @param user_role
     * @return
     */
    User_Role findRole(User_Role user_role);

    /**
     * 根据用户角色找用户权限
     * @param user_role
     * @return
     */
    List<Role_Power> findPower(User_Role user_role);

    /**
     * 查找各个角色拥有的权限
     * @return
     */
    List<Role_PowerName> findAllRolePower();

    /**
     * 根据权限id查找权限名
     * @param pid
     * @return
     */
    String findPowerByPid(int pid);

    /**
     * 根据角色名 删除角色 权限  用户角色表
     * @param rolename
     * @return
     */
    boolean deleteRole(String rolename);

    /**
     * 查找所有角色
     * @return
     */
    List<Admin> findAllRole();
}
