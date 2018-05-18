package com.ssm.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssm.entity.Admin;
import com.ssm.entity.User;
import com.ssm.entity.Work;
import com.ssm.service.AdminService;
import com.ssm.service.UserService;
import com.ssm.service.WorkService;
import org.apache.xpath.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

/**
 * <p>
 *  前端控制器 --- 添加工作汇报
 * </p>
 *
 * @author 
 * @since 2018-05-17
 */
@Controller
@RequestMapping("/work")
public class WorkController {
    @Autowired
    private WorkService workService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;
    /**
     * 添加工作
     * @param work
     * @return
     */
    @RequestMapping("/addW")
    public ModelAndView addWork(Work work){
        ModelAndView mv = new ModelAndView();
        if (work.getUid() == null || work.getUid() == 0){
            mv.addObject("error","请先登录!!");
            mv.setViewName("html/jie/add");
            return mv;
        }
        work.setCreateTime(new Date());
        work.setStuats(0);
        //添加工作报告
        boolean insert = workService.insert(work);
        if (insert){

            mv.addObject("success","添加工作报告成功!!!");
        }else {
            mv.addObject("error","添加工作报告失败!!!");
        }
        mv.setViewName("html/jie/add");
        return mv;
    }

    /**
     *所有员工工作查询
     * @param stu
     * @return
     */
    @RequestMapping("/selectByStu/{stu}")
    public ModelAndView selectByStu(@PathVariable("stu")int stu,int current){
       ModelAndView mv = new ModelAndView();
        Page<Work> page = workService.selectPage(new Page<Work>(current,10),new EntityWrapper<Work>()
        .eq("stuats",stu));
        //循环获得姓名
       for (int i = 0; i < page.getRecords().size(); i++){
           getName(page.getRecords().get(i));
       }
        mv.setViewName("html/web/work");
        mv.addObject("page",page);
        mv.addObject("stu",stu);
       return mv;
    }

    /**
     * 工作回复
     * @param work
     * @return
     */
    @RequestMapping("/update")
    public ModelAndView update(Work work){
        ModelAndView mv = new ModelAndView();
        if (work.getAid() == null || work.getAid() == 0){
            mv.addObject("error","修改失败!!!");
            return mv;
        }
        mv.setViewName("html/web/work");
        work.setStuats(1);
        work.setUpdateTime(new Date());
         boolean update = workService.updateById(work);

         if (update){
             mv.addObject("success","修改成功!!!");
         }else {
             mv.addObject("error","修改失败!!!");
         }
        return mv;
    }

    /**
     * 设置用户姓名
     * @param work
     */
    public void getName(Work work){
        User user = userService.selectById(work.getUid());
        work.setuName(user.getName());
        if (work.getAid() != null){
            Admin admin = adminService.selectById(work.getAid());
            work.setaName(admin.getName());
        }
    }
}

