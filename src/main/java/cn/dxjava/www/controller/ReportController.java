package cn.dxjava.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("report/")
public class ReportController {

    // 报表界面
    @RequestMapping("reportListView")
    public ModelAndView userInfoView(){
        ModelAndView mav = new ModelAndView();

        mav.setViewName("report/report_list");


        return mav;
    }
}
