package cn.dxjava.www.service.impl;


import cn.dxjava.www.mapper.PowerMapper;
import cn.dxjava.www.mapper.RoleMapper;
import cn.dxjava.www.pojo.Admin;
import cn.dxjava.www.pojo.Role_Power;
import cn.dxjava.www.pojo.Role_PowerName;
import cn.dxjava.www.pojo.User_Role;
import cn.dxjava.www.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    RoleMapper roleMapper;

    @Autowired
    PowerMapper powerMapper;

    @Override
    public User_Role findRole(User_Role user_role){

        return roleMapper.findRole(user_role);
    }

    @Override
    public List<Role_Power> findPower(User_Role user_role){

        return roleMapper.findPower(user_role);
    }

    @Override
    public List<Role_PowerName> findAllRolePower() {

        return roleMapper.findAllRolePower();
    }

    @Override
    public String findPowerByPid(int pid){

        return roleMapper.findPowerByPid(pid);
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    public boolean deleteRole(String rolename){
        boolean b1 = false,b2 = false,b3 = false;
        if (roleMapper.deleteUserRole(rolename) > 0) b1 = true;
        if (powerMapper.deleteRolePower(rolename) > 0) b2 = true;
        if (roleMapper.deleteRole(rolename) > 0) b3 = true;

        return b1&b2&b3;
    }

    @Override
    public List<Admin> findAllRole(){

        return roleMapper.findAllRole();
    }
}
