package cn.dxjava.www.service;

import cn.dxjava.www.pojo.CUser;


public interface UserService {

    public CUser login(CUser user);

    public CUser getUserInfo(CUser user);

    public boolean updatePsw(int uid, String upsw);

    public boolean updateInfo(CUser user);
}
