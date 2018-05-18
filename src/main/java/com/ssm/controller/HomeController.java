package com.ssm.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssm.entity.*;
import com.ssm.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * 页面跳转控制器
 * 
 */
@Controller
public class HomeController {
    @Autowired
    private UserService userService;
    @Autowired
    private ActivityService activityService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private WorkService workService;
    @Autowired
    private SuggestService suggestService;
    @Autowired
    private LeveaService leveaService;
    @Autowired
    private SubmitService submitService;
    /**
     * 首页跳转
     * @return
     */
    @RequestMapping(value = {"/","/index"})
    public ModelAndView index(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("html/index");
        return mv;
    }


    /**
     * 登录页跳转
     */
    @RequestMapping("/login")
    public String login(){
        return "html/user/login";
    }

    /**
     * 注册跳转
     * @return
     */
    @RequestMapping("/reg")
    public String reg(){
        return "html/user/reg";
    }

    /**
     * 设置跳转
     * @return
     */
    @RequestMapping("/set")
    public String set(){
        return "html/user/set";
    }

    /**
     *个人主页跳转
     * @return
     */
    @RequestMapping("/myIndex/{id}")
    public ModelAndView myIndex(@PathVariable("id") long id){
        ModelAndView mv = new ModelAndView();
        User user = userService.selectById(id);
        mv.setViewName("html/user/home");
        mv.addObject("userI",user);
        //工作
        List<Work> list = getWorkes(id);
        //报销
        List<Submit> submits = getSubmits(id);
        //请假
        List<Levea> leveaList = getLevea(id);
        //反馈
        List<Suggest> suggestList = getSuggest(id);
        mv.addObject("work",list);
        mv.addObject("submit",submits);
        mv.addObject("levea",leveaList);
        mv.addObject("suggest",suggestList);
        return mv;
    }

    /**
     * 添加各种申请
     * @return
     */
    @RequestMapping("/addObj")
    public String addObj(){
        return "html/jie/add";
    }

    /**
     * 员工中心跳转
     * @param uid
     * @return
     */
    @RequestMapping("/userIndex")
    public ModelAndView userIndex(long uid){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("html/user/index");
        if (uid == 0){
            mv.addObject("error","请先登录");
            return mv;
        }
        //工作
        List<Work> list = getWorkes(uid);
        //报销
        List<Submit> submits = getSubmits(uid);
        //请假
        List<Levea> leveaList = getLevea(uid);
        //反馈
        List<Suggest> suggestList = getSuggest(uid);
        mv.addObject("work",list);
        mv.addObject("submit",submits);
        mv.addObject("levea",leveaList);
        mv.addObject("suggest",suggestList);
        return mv;
    }

    /**
     * 查询员工工作
     * @param uid
     * @return
     */
    public List<Work> getWorkes(long uid){
      List<Work> list = workService.selectList(new EntityWrapper<Work>()
        .eq("uid",uid));
        return list;
    }

    /**
     * 查询员工的报销
     * @param uid
     * @return
     */
    public List<Submit> getSubmits(long uid){
        List<Submit> list = submitService.selectList(new EntityWrapper<Submit>()
        .eq("uid",uid));
        return list;
    }

    /**
     * 查询员工的反馈
     * @param uid
     * @return
     */
    public List<Suggest> getSuggest(long uid){
        List<Suggest> list = suggestService.selectList(new EntityWrapper<Suggest>()
        .eq("uid",uid));
        return list;
    }

    /**
     * 查询员工的请假
     * @param uid
     * @return
     */
    public List<Levea> getLevea(long uid){
        List<Levea> list = leveaService.selectList(new EntityWrapper<Levea>()
        .eq("uid",uid));
        return list;
    }
}
