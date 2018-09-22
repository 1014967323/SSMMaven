package cn.dxjava.www.service.impl;

import cn.dxjava.www.mapper.PowerMapper;
import cn.dxjava.www.pojo.Role_Power;
import cn.dxjava.www.pojo.Role_PowerName;
import cn.dxjava.www.service.PowerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PowerServiceImpl implements PowerService {

    @Autowired
    PowerMapper powerMapper;

    @Override
    public Role_Power FindPidByPowerName(String pname){

        return powerMapper.findPidByPowerName(pname);
    }

    // 事务注解
    @Override
    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    public boolean insertRolePower(List<Role_Power> list,String rolename){
        boolean b1 = false,b2 = false;
        if (powerMapper.insertRole(rolename) > 0) b1 = true;
        if (powerMapper.insertRolePower(list) > 0) b2 = true;

        return b1&b2;
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    public boolean updateRolePower(List<Role_Power> list,String rolename){
        boolean b1 = false,b2 = false;
        if (powerMapper.deleteRolePower(rolename) > 0) b1 = true;
        if (powerMapper.insertRolePower(list) > 0) b2 = true;

        return b1&b2;
    }
}
