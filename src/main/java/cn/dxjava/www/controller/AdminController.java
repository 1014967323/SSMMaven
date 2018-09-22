package cn.dxjava.www.controller;

import cn.dxjava.www.pojo.Admin;
import cn.dxjava.www.pojo.CUser;
import cn.dxjava.www.service.AdminService;
import cn.dxjava.www.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("admin/")
public class AdminController {

    @Autowired
    AdminService adminService;
    @Autowired
    RoleService roleService;

    List<Admin> la;

    // 管理员界面
    @RequestMapping("adminListView")
    public ModelAndView userInfoView(){
        ModelAndView mav = new ModelAndView();

        mav.setViewName("admin/admin_list");
        la = adminService.selectAdminInfo();
        mav.addObject("adminInfo",la);

        return mav;
    }

    // 管理员修改信息界面
    @RequestMapping("adminModiView")
    public ModelAndView adminModiView(int uid){
        ModelAndView mav = new ModelAndView();
        System.out.println(uid);
        mav.setViewName("admin/admin_modi");

        for (Admin a : la){
            if (uid == a.getUid()){
                mav.addObject("userInfo",a);
                mav.addObject("allRole",roleService.findAllRole());
                break;
            }
        }
        return mav;
    }

    // 管理员添加界面
    @RequestMapping("adminAddView")
    public ModelAndView adminAddView(){
        ModelAndView mav = new ModelAndView();

        mav.setViewName("admin/admin_add");
        mav.addObject("allRole",roleService.findAllRole());

        return mav;
    }

    // 重置管理员密码
    @RequestMapping("resetPsw")
    @ResponseBody
    public String resetPsw(@RequestBody int[] uids){
        System.out.println("重置管理员密码");
        boolean b = false;
        List<CUser> lcu = new ArrayList<CUser>();
        for (int uid : uids) {
            System.out.println(uid);
            lcu.add(new CUser(uid));
        }
        b = adminService.resetPsw(lcu);
        if (b) return "success";

        return "fail";
    }

    // 添加管理员
    @RequestMapping("addAdmin")
    @ResponseBody
    public String addAdmin(Admin admin){
        boolean b = false;

        try {
            b = adminService.addUser(admin);
        } catch (Exception e) {
            System.out.println("添加用户事务异常");
        }

        if (b) return "success";

        return "fail";

    }

    // 修改管理员信息
    @RequestMapping("delAdmin")
    @ResponseBody
    public String delAdmin(int uid){
        System.out.println("删除管理员");
        boolean b = false;

        b = adminService.delUser(uid);
        if (b) return "success";

        return "fail";
    }


    // 修改管理员信息
    @RequestMapping("updateAdmin")
    @ResponseBody
    public String updateAdmin(Admin admin){
        System.out.println("修改管理员信息");
        boolean b = false;

        b = adminService.updaUser(admin);
        if (b) return "success";

        return "fail";
    }
}
