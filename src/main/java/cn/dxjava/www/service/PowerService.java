package cn.dxjava.www.service;

import cn.dxjava.www.pojo.Role_Power;
import cn.dxjava.www.pojo.Role_PowerName;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PowerService {

    /**
     * 根据权限名查找权限id
     * @return
     */
    public Role_Power FindPidByPowerName(String pname);

    /**
     * 批量插入角色权限   角色
     * @param list rolename
     * @return
     */
    public boolean insertRolePower(List<Role_Power> list, String rolename);

    /**
     * 更新角色权限
     * @param rolename
     * @return
     */
    public boolean updateRolePower(List<Role_Power> list, String rolename);
}
