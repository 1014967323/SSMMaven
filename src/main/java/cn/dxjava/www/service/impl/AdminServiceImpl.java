package cn.dxjava.www.service.impl;

import cn.dxjava.www.mapper.AdminMapper;
import cn.dxjava.www.mapper.UserMapper;
import cn.dxjava.www.pojo.Admin;
import cn.dxjava.www.pojo.CUser;
import cn.dxjava.www.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper adminMapper;
    @Autowired
    UserMapper userMapper;

    @Override
    public List<Admin> selectAdminInfo(){

        return adminMapper.selectAdminInfo();
    }

    @Override
    public boolean resetPsw(List<CUser> uids){

        return adminMapper.resetPsw(uids) > 0;
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    public boolean addUser(Admin admin){
        boolean b1 = false,b2 = false;

        if (userMapper.addUser(admin) > 0)  b1 = true;
        if (adminMapper.addUserRole(admin) > 0)  b2 = true;

        return b1&b2;
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    public boolean updaUser(Admin admin){
        boolean b1 = false,b2 = false;

        if (userMapper.upUser(admin) > 0)  b1 = true;
        if (adminMapper.upUserRole(admin) > 0)  b2 = true;

        return b1&b2;
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    public boolean delUser(int uid){
        boolean b1 = false,b2 = false;

        if (adminMapper.delUserRole(uid) > 0)  b1 = true;
        if (userMapper.delUser(uid) > 0)  b2 = true;

        return b1&b2;
    }
}
