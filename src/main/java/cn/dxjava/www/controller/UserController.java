package cn.dxjava.www.controller;

import cn.dxjava.www.pojo.CUser;
import cn.dxjava.www.service.UserService;
import org.springframework.web.bind.annotation.RequestParam;
import weibo4j.Oauth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import weibo4j.Users;
import weibo4j.http.AccessToken;
import weibo4j.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("user/")
public class UserController {
   @Autowired
   UserService userService;

   private CUser landerUser;


/*********************************事务**************************************/
    // 用户登录验证
   @RequestMapping("UserLogin")
   @ResponseBody
   public String login(CUser user, String inputyzm, HttpServletRequest request){
        System.out.println("进入Controller");

        String yzm = (String)request.getSession().getAttribute("CHECKCODE");
        if (yzm.equals(inputyzm)) {
            CUser u = userService.login(user);
            System.out.println(u.getUname());
            System.out.println(u.getUid());
            if (u != null) {
                this.landerUser = u;
                request.getSession().setAttribute("lander", landerUser);

                return "success";
            }else{
                return "fail";
            }
            // 从内存中查找user，如果找不到则在数据库中查找，再进行赋值
            /*CUser u = null;// = (CUser) redisTemplate.opsForValue().get("login");
            if(u == null){
                u = userService.login(user);
            }
            if (u != null) {
                this.landerUser = u;
                request.getSession().setAttribute("lander", landerUser);

                return "success";
            }else{
                return "fail";
            }*/
        }

        return "yzmerror";
   }

   // 微博登录
    @RequestMapping("WBLogin")
    @ResponseBody
    public String handleRequest(HttpServletRequest request,
                                HttpServletResponse response) throws Exception {

       System.out.println("进入微博登录");
       Oauth oauth = new Oauth();
       String url = oauth.authorize("code",null);
       System.out.println(url);



     //BareBonesBrowserLaunch.openURL(oauth.authorize("code",null));

       return url;

    }

    @RequestMapping("AfterWBLogin.do")
    @ResponseBody
    public String AfterWBLogin(HttpServletRequest request,
                               @RequestParam(value = "code", required = false) String code) throws Exception {

        System.out.println("登陆之后");
        System.out.println(code);
        System.out.println(request.getParameter("code"));
        if (code == null) {
            // return "redirect:../index.jsp";
        }

        Oauth oauth = new Oauth();
        AccessToken accessToken = oauth.getAccessTokenByCode(code);
        // token相当于密码了，就是每一次授权的时候密码都是不一样的了(授权时间)
        String token = accessToken.getAccessToken();
        // 相当于微博的账号了，uid是唯一的
        String uid = accessToken.getUid();

        Users users = new Users(token);
        User user = users.showUserById(uid);// 微博用户的对象
        System.out.println("用户名："+user.getName());
        System.out.println("关注数："+user.getFriendsCount());
        System.out.println("城市："+user.getCity());
        System.out.println("性别："+user.getGender());
        System.out.println("创建时间："+user.getCreatedAt());

        return "";
    }

   // 修改用户密码
    @RequestMapping("updatePsw")
    @ResponseBody
    public String updatePsw(String upsw,HttpServletRequest request){

        boolean b = userService.updatePsw(landerUser.getUid(),upsw);
        if (b){
            landerUser.setUpsw(upsw);
            request.getSession().setAttribute("lander",landerUser);
            return "success";
        }
        return "fail";
    }
    @RequestMapping("updateInfo")
    @ResponseBody
    public String updateIfo(CUser user,HttpServletRequest request){

       boolean b = userService.updateInfo(user);
       if (b){
           landerUser.setUname(user.getUname());
           landerUser.setUtel(user.getUtel());
           landerUser.setUemail(user.getUemail());

           request.getSession().setAttribute("lander",landerUser);
           return "success";
       }

       return "fail";
    }

/*********************************界面**************************************/
   // 用户信息界面
    @RequestMapping("userInfoView")
    public ModelAndView userInfoView(){
        ModelAndView mav = new ModelAndView();

        mav.setViewName("user/user_info");

        return mav;
    }

    // 用户修改密码界面
    @RequestMapping("updatePswView")
    public ModelAndView updateInfoView(){
        ModelAndView mav = new ModelAndView();

        mav.setViewName("user/user_pwd");

        return mav;
    }

}
