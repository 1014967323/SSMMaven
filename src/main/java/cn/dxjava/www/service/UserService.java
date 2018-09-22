package cn.dxjava.www.service;

import cn.dxjava.www.pojo.CUser;


public interface UserService {

    CUser login(CUser user);

    CUser getUserInfo(CUser user);

    boolean updatePsw(int uid, String upsw);

    boolean updateInfo(CUser user);
}
