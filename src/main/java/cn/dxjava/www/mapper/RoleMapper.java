package cn.dxjava.www.mapper;

import cn.dxjava.www.pojo.Admin;
import cn.dxjava.www.pojo.Role_Power;
import cn.dxjava.www.pojo.Role_PowerName;
import cn.dxjava.www.pojo.User_Role;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import java.util.List;


public interface RoleMapper {

    public User_Role findRole(User_Role user_role);

    @Select("select * from role_power where rolename = #{rolename} order by pid")
    public List<Role_Power> findPower(User_Role user_role);

    @Select("SELECT ROLENAME,PNAME from power p,role_power rp  WHERE p.PID = rp.PID")
    public List<Role_PowerName> findAllRolePower();

    @Select("select pname from power where pid = #{pid}")
    public String findPowerByPid(@Param("pid") int pid);

    // 查找所有角色
    @Select("select rolename from role")
    public List<Admin> findAllRole();

    // 根据角色名删除角色
    @Delete("delete from role where rolename = #{rolename}")
    public int deleteRole(@Param("rolename") String rolename);

    // 根据角色名 删除用户角色
    @Delete("delete from user_role where rolename = #{rolename}")
    public int deleteUserRole(@Param("rolename") String rolename);
}
