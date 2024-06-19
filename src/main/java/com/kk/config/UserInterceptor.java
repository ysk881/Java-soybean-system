package com.kk.config;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        //放行：判断什么情况登录
        //登录页面也会放行
        if (request.getRequestURI().contains("tologin")){
            return true;
        }
        //说明我在提交登录
        if (request.getRequestURI().contains("uslogin")){
            return true;
        }
        if (request.getRequestURI().contains("toregist")){
            return true;
        }
        if (request.getRequestURI().contains("queryName")){
            return true;
        }
        if (request.getRequestURI().contains("regist")){
            return true;
        }

        //第一次登录也是没有session的；
        if (session.getAttribute("user") != null){
            return true;
        }
        //判断什么情况下没有登录
        request.getRequestDispatcher("/WEB-INF/jsp/user/login.jsp").forward(request, response);
        return false;
    }
}
