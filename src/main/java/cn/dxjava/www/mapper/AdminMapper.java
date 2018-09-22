package cn.dxjava.www.mapper;

import cn.dxjava.www.pojo.Admin;
import cn.dxjava.www.pojo.CUser;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface AdminMapper {


    @Select("SELECT u.UNAME,u.UID,u.uemail,u.utel,u.UPSW,ur.rolename,ur.ROLEGRANTDATE from user u,user_role ur where u.uid = ur.uid")
    public List<Admin> selectAdminInfo();

    // 批量重置密码
    public int resetPsw(List<CUser> list);

    // 插入用户角色关联表
    @Insert("insert into user_role values(#{uid},#{rolename},sysdate())")
    public int addUserRole(Admin admin);

    @Update("update user_role set rolename = #{rolename},rolegrantdate = sysdate() where uid = #{uid}")
    public int upUserRole(Admin admin);

    @Delete("delete from user_role where uid = #{uid}")
    public int delUserRole(@Param("uid") int uid);
}
