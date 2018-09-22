package cn.dxjava.www.mapper;

import cn.dxjava.www.pojo.Role_Power;
import cn.dxjava.www.pojo.Role_PowerName;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PowerMapper {

    // 根据权限名查找 pid
    Role_Power findPidByPowerName(@Param("pname") String pname);

    // 插入角色
    @Insert("insert into role values(#{rolename})")
    int insertRole(@Param("rolename") String rolename);

    // 批量插入 角色  权限
    int insertRolePower(List<Role_Power> list);

    // 根据角色名  删除权限
    @Delete("delete from role_power where rolename = #{rolename}")
    int deleteRolePower(@Param("rolename") String rolename);

}
