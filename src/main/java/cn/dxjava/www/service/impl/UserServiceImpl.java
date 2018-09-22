package cn.dxjava.www.service.impl;

import cn.dxjava.www.mapper.UserMapper;
import cn.dxjava.www.pojo.CUser;
import cn.dxjava.www.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation= Propagation.REQUIRED, rollbackFor=Exception.class)
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    //标注该方法查询的结果进入缓存，再次访问时直接读取缓存中的数据
    @Cacheable("login")
    @Override
    public CUser login(CUser user){

        return userMapper.login(user);
    }

    @Cacheable("getUserInfo")
    @Override
    public CUser getUserInfo(CUser user){

        return userMapper.getUserInfo(user);
    }

    //清空缓存，allEntries变量表示所有对象的缓存都清除
    // 更新时，及时更新redis
    @CacheEvict(value = {"login","getUserInfo"},allEntries = true)
    @Override
    public boolean updatePsw(int uid,String upsw){

        return userMapper.updatePsw(uid,upsw)>0;
    }

    @CacheEvict(value = {"login","getUserInfo"},allEntries = true)
    @Override
    public boolean updateInfo(CUser user){

        return userMapper.updateInfo(user)>0;
    }
}
