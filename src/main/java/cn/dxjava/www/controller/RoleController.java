package cn.dxjava.www.controller;

import cn.dxjava.www.pojo.CUser;
import cn.dxjava.www.pojo.Role_Power;
import cn.dxjava.www.pojo.Role_PowerName;
import cn.dxjava.www.pojo.User_Role;
import cn.dxjava.www.service.PowerService;
import cn.dxjava.www.service.RoleService;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import com.sun.prism.shader.Solid_TextureYV12_AlphaTest_Loader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("role/")
public class RoleController {
    @Autowired
    RoleService roleService;
    @Autowired
    PowerService powerService;

    private User_Role user_role;

    // 角色管理主界面
    // 加入后面的参数可传中文不乱码
    @RequestMapping(value="findRoleName",produces={"text/html;charset=UTF-8;","application/json;"})
    public ModelAndView roleJudge(HttpServletRequest request){
        ModelAndView mav = new ModelAndView("mainView");
        System.out.println("进入HttpServletRequest request");
        // 查找用户角色
        user_role = roleService.findRole(new User_Role(((CUser) (request.getSession().getAttribute("lander"))).getUid()));
        // 存入用户角色
        request.getSession().setAttribute("userrole",user_role);
        // 查找所有权限
        List<Role_Power> role_power = new ArrayList<Role_Power>();
        role_power = roleService.findPower(user_role);

        boolean[] b = {false,false,false,false,false,false,false};
        for(Role_Power rp:role_power){
            b[rp.getPid()-1] = true;
        }
        ((CUser) (request.getSession().getAttribute("lander"))).setPower(b);

        return mav;
    }

    // 角色列表视图
    @RequestMapping("roleListView")
    public ModelAndView roleListView(){
        ModelAndView mav = new ModelAndView("role/role_list");
        List<Role_PowerName> rp = new ArrayList<Role_PowerName>();
        Map hm = new HashMap();

        rp = roleService.findAllRolePower();
        StringBuffer[] sRolename = new StringBuffer[10];
        StringBuffer[] sPname = new StringBuffer[10];
        for (int i = 0; i < sRolename.length; i ++) {
            sRolename[i] = new StringBuffer();
            sPname[i] = new StringBuffer();
        }
        int m = 0;
        for (int i = 0; i < rp.size(); i++) {
            if (i == 0) {
                sRolename[m].append(rp.get(i).getRolename());
                sPname[m].append(rp.get(i).getPname() + "    ");
            }else if(rp.get(i).getRolename().equals(rp.get(i-1).getRolename())){

                sPname[m].append(rp.get(i).getPname() + "    ");
            }else{
                m = m + 1;
                sRolename[m].append(rp.get(i).getRolename());
                sPname[m].append(rp.get(i).getPname() + "    ");
            }
        }

        for (int i = 0; i <= m; i++){
            hm.put(sRolename[i].toString(),sPname[i].toString());
        }

        mav.addObject("hm",hm);

        return mav;
    }

    // 添加角色界面
    @RequestMapping("roleAddView")
    public ModelAndView roleAddView(){
        ModelAndView mav = new ModelAndView("role/role_add");

        return mav;
    }

    // 修改权限界面
    @RequestMapping("roleModiView")
    public ModelAndView roleModiView(String rolename){
        System.out.println("进入修改界面");
        ModelAndView mav = new ModelAndView("role/role_modi");
        mav.addObject("rolename",rolename);

        return mav;
    }

    // 添加角色、权限
    @RequestMapping("addRolePower")
    @ResponseBody
    public String addRolePower(@RequestBody JSONObject obj){
        System.out.println(123);
        boolean b = false;
        List<Role_Power> rpn = new ArrayList<Role_Power>();

        JSONArray list= obj.getJSONArray("rpp");
        for(int i=0;i < list.size();i++){
            Role_Power  rp = new Role_Power();

            JSONObject info=list.getJSONObject(i);
            System.out.println(info.getString("pname"));
            System.out.println(info.getString("rolename"));

            rp = powerService.FindPidByPowerName(info.getString("pname"));
            rp.setRolename(info.getString("rolename"));
            rpn.add(rp);

        }

        for (Role_Power rp:rpn){
            System.out.println(rp.getPid());

        }

        try {
            b = powerService.insertRolePower(rpn,rpn.get(0).getRolename());
        } catch (Exception e) {
            System.out.println("事务异常");
        }

        if (b){

            return "success";
        }

        return "fail";
    }

    // 更新角色权限
    @RequestMapping("updateRolePower")
    @ResponseBody
    public String updateRolePower(@RequestBody JSONObject obj){
        System.out.println(123);
        boolean b = false;
        List<Role_Power> rpn = new ArrayList<Role_Power>();

        JSONArray list= obj.getJSONArray("rpp");
        for(int i=0;i < list.size();i++){
            Role_Power  rp = new Role_Power();

            JSONObject info=list.getJSONObject(i);

            rp = powerService.FindPidByPowerName(info.getString("pname"));
            rp.setRolename(info.getString("rolename"));
            rpn.add(rp);

        }

        for (Role_Power rp:rpn){
            System.out.println(rp.getPid());

        }

        try {
            b = powerService.updateRolePower(rpn,rpn.get(0).getRolename());
        } catch (Exception e) {
            System.out.println("添加事务异常");
        }

        if (b){

            return "success";
        }

        return "fail";
    }

    // 删除角色
    @RequestMapping("deleteRole")
    @ResponseBody
    public String deleteRole(String rolename){
        boolean b = false;

        try {
            b = roleService.deleteRole(rolename);
        } catch (Exception e) {
            System.out.println("删除角色事务异常");
        }

        if (b){

            return "success";
        }

        return "fail";
    }
}
