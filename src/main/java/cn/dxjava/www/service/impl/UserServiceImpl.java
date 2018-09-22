package cn.dxjava.www.service.impl;

import cn.dxjava.www.mapper.UserMapper;
import cn.dxjava.www.pojo.CUser;
import cn.dxjava.www.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Override
    public CUser login(CUser user){

        return userMapper.login(user);
    }

    @Override
    public CUser getUserInfo(CUser user){

        return userMapper.getUserInfo(user);
    }

    @Override
    public boolean updatePsw(int uid,String upsw){

        return userMapper.updatePsw(uid,upsw)>0;
    }

    @Override
    public boolean updateInfo(CUser user){

        return userMapper.updateInfo(user)>0;
    }
}
