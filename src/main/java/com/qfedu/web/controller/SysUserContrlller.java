package com.qfedu.web.controller;

import com.qfedu.pojo.Goods;
import com.qfedu.pojo.SysUser;
import com.qfedu.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class SysUserContrlller {

    @Autowired
    private SysUserService service;

    //登录
    @RequestMapping(value = "/login.do",method =RequestMethod.POST)
    public String login(String username, String password, Model model, HttpServletRequest request) {
        SysUser sysUser = service.login(username, password);
        if (sysUser != null) {
            //登陆成功，将当前员工保存在session作用域
            request.getSession().setAttribute("sysUser",sysUser);
            return "/admin/admin.jsp";

        } else {
            //登录失败
            model.addAttribute("msg", "登录失败");

            return "/admin/login.jsp";
        }


    }
    //注销
    @RequestMapping("/loginOut.do")
    public String loginOut(HttpSession session){
        session.removeAttribute("sysUser");

        return "/admin/login.jsp";
    }



}
