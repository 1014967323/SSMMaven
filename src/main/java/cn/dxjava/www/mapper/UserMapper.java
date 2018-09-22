package cn.dxjava.www.mapper;

import cn.dxjava.www.pojo.Admin;
import cn.dxjava.www.pojo.CUser;
import org.apache.ibatis.annotations.*;

public interface UserMapper {

    CUser login(CUser user);

    // 增加用户
    @Insert("insert into user(uid,uname,utel,uemail,upsw) values(#{uid},#{uname},#{utel},#{uemail},#{upsw})")
    int addUser(Admin admin);

    @Select("select * from user where uid = #{uid}")
    CUser getUserInfo(CUser user);

    @Update("update user set upsw = #{upsw} where uid = #{uid}")
    int updatePsw(@Param("uid") int uid, @Param("upsw") String upsw);

    @Update("update user set uname = #{uname},utel = #{utel},uemail = #{uemail} where uid = #{uid}")
    int updateInfo(CUser user);

    @Update("update user set uname = #{uname},utel = #{utel},uemail = #{uemail} where uid = #{uid}")
    int upUser(Admin admin);

    @Delete("delete from user where uid = #{uid}")
    int delUser(@Param("uid") int uid);
}
