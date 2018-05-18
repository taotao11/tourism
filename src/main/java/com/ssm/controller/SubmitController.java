package com.ssm.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssm.entity.Admin;
import com.ssm.entity.Submit;
import com.ssm.entity.User;
import com.ssm.entity.Work;
import com.ssm.service.AdminService;
import com.ssm.service.SubmitService;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

/**
 * <p>
 *  前端控制器 -- 报销控制
 * </p>
 *
 * @author 
 * @since 2018-05-17
 */
@Controller
@RequestMapping("/submit")
public class SubmitController {
    @Autowired
    private SubmitService submitService;

    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;
    /**
     * 添加报销
     * @return
     */
    @RequestMapping("/addSub")
    public ModelAndView addSub(Submit submit){
        ModelAndView mv = new ModelAndView();
        if (submit.getUid() == null || submit.getUid() == 0){
            mv.addObject("error","请先登录!!");
            mv.setViewName("html/jie/add");
            return mv;
        }
        submit.setCreateTime(new Date());
        submit.setType(0);
        boolean insert = submitService.insert(submit);
        if (insert){

            mv.addObject("success","添加报销成功!!!");
        }else {
            mv.addObject("error","添加报销失败!!!");
        }
        mv.setViewName("html/jie/add");
        return mv;
    }

    /**
     *所有员工报销查询
     * @param stu
     * @return
     */
    @RequestMapping("/selectByStu/{stu}")
    public ModelAndView selectByStu(@PathVariable("stu")int stu, int current){
        ModelAndView mv = new ModelAndView();
        Page<Submit> page = null;
        if (stu == 0){
           page = submitService.selectPage(new Page<Submit>(current,10),new EntityWrapper<Submit>()
                    .eq("type",stu));
        }else {
            page = submitService.selectPage(new Page<Submit>(current,10),new EntityWrapper<Submit>()
                    .gt("type",0));
        }

        //循环获得姓名
        for (int i = 0; i < page.getRecords().size(); i++){
            getName(page.getRecords().get(i));
        }
        mv.setViewName("html/web/submit");
        mv.addObject("page",page);
        mv.addObject("stu",stu);
        return mv;
    }

    /**
     * 报销审核
     * @param submit
     * @return
     */
    @RequestMapping("/update")
    public ModelAndView update(Submit submit){
        ModelAndView mv = new ModelAndView();
        if (submit.getAid() == null || submit.getAid() == 0){
            mv.addObject("error","修改失败!!!");
            return mv;
        }
        mv.setViewName("html/web/submit");
        submit.setUplodTime(new Date());
        boolean update = submitService.updateById(submit);

        if (update){
            mv.addObject("success","修改成功!!!");
        }else {
            mv.addObject("error","修改失败!!!");
        }
        return mv;
    }

    /**
     * 设置用户姓名
     * @param submit
     */
    public void getName(Submit submit){
        User user = userService.selectById(submit.getUid());
        submit.setuName(user.getName());
        if (submit.getAid() != null){
            Admin admin = adminService.selectById(submit.getAid());
            submit.setaName(admin.getName());
        }
    }
}

