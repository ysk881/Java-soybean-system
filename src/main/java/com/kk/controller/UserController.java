package com.kk.controller;

import com.github.pagehelper.PageInfo;
import com.kk.pogo.*;
import com.kk.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/User")
public class UserController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    /*跳转至登录页*/
    @RequestMapping("tologin")
    public String Tologin() {
        return "user/login";
    }

    //实现登判断,并进行相应的跳转
    @RequestMapping("/uslogin")
    public String login(String username, String password, HttpSession session, HttpServletRequest request) {
        //调用service方法
        User user = userService.login(username, password);
        if (user != null) {
            String per = user.permission;
            if (per.equals("用户")) {
                session.setAttribute("user", user);
                System.out.println(user.getName() + "登录成功");
                //登录成功
                return "user/mian";
            } else if (per.equals("普通管理员")) {
                //登录失败
                request.setAttribute("errmsg", "用户名或密码不正确!");
                System.out.println("用户名或密码不正确!");
                return "user/login";
            }
        } else {
            //登录失败
            request.setAttribute("errmsg", "用户名或密码不正确!");
            System.out.println("用户名或密码不正确!");
            return "user/login";
        }
        return "user/login";
    }

    //注销登录
    @RequestMapping("/outLogin")
    public String outLogin(HttpSession session) {
        session.removeAttribute("user");
        return "index";
    }

    /*跳转至注册页面*/
    @RequestMapping("toregist")
    public String Toregister() {
        return "user/register";
    }

    /*账号注册*/
    @RequestMapping("register")
    public String Register(User user) {
        int n = userService.register(user);
        if (n > 0) {
            System.out.println("注册成功！"+n);
            return "user/login";
        } else {
            return "User/err";
        }
    }

    /*查询账号是否存在*/
    @ResponseBody
    @RequestMapping("queryName")
    public boolean queryUsername(String username) {
        User user = userService.queryUserName(username);
        if (user != null) {
            return true;
        } else {
            return false;
        }
    }

    /*修改登录密码*/
    @RequestMapping("upinfo")
    public String upinfo(User user) {
        int us = userService.updateinfo(user);
        if (us > 0) {
            System.out.println("修改成功" + user);
            return "user/login";
        } else {
            System.out.println("修改失败" + user);
            return "user/err";
        }
    }

    /*返回首页*/
    @RequestMapping("usmian")
    public String Index() {
        return "user/mian";
    }


    /*-----------------------------------------------------------------------------------------------------------------*/
   //普通用户端跳转至所有品种页面
    @RequestMapping("/allVar")
    public String showPage(@RequestParam(value = "pn", defaultValue = "1") Integer page,
                           @RequestParam(defaultValue = "12") Integer pageSize,
                           @RequestParam(required = false) String name,
                           Model model) {
        //调用分页业务
        Variety variety = null;
        if (name != null) {
            variety = new Variety();
            variety.setName(name);
        }
        PageInfo<Variety> pageInfo = userService.AllVariety(variety, page, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "user/var";
    }
    //根据品种id查询品种详情信息
    @RequestMapping("/selectById")
    public String queryVarById(Integer id, Model model) {
        Variety var = userService.queryVarById(id);
        model.addAttribute("va", var);
        System.out.println(var);
        return "user/varinfo";
    }
    /*-----------------------------------------------------------------------------------------------------------------*/
    //普通用户端跳转至所有抗病毒性页面
    @RequestMapping("/allNess")
    public String showIllness(@RequestParam(value = "pn", defaultValue = "1") Integer page,
                           @RequestParam(defaultValue = "12") Integer pageSize,
                           @RequestParam(required = false) String illness,
                           Model model) {
        //调用分页业务
        Variety variety = null;
        if (illness != null) {
            variety = new Variety();
            variety.setIllness(illness);
        }
        PageInfo<Variety> pageInfo = userService.AllIllness(variety, page, pageSize);
        System.out.println(pageInfo);
        model.addAttribute("pageInfo", pageInfo);
        return "user/illness";
    }
    /*-----------------------------------------------------------------------------------------------------------------*/
    //普通用户端跳转至所有品种来源页面
    @RequestMapping("/allSou")
    public String showSource(@RequestParam(value = "pn", defaultValue = "1") Integer page,
                              @RequestParam(defaultValue = "12") Integer pageSize,
                              @RequestParam(required = false) String source,
                              Model model) {
        //调用分页业务
        Variety variety = null;
        if (source != null) {
            variety = new Variety();
            variety.setSource(source);
        }
        PageInfo<Variety> pageInfo = userService.AllSource(variety, page, pageSize);
        System.out.println(pageInfo);
        model.addAttribute("pageInfo", pageInfo);
        return "user/source";
    }
    /*-----------------------------------------------------------------------------------------------------------------*/
    //普通用户端跳转至所有适宜区域页面
    @RequestMapping("/allArea")
    public String showArea(@RequestParam(value = "pn", defaultValue = "1") Integer page,
                             @RequestParam(defaultValue = "12") Integer pageSize,
                             @RequestParam(required = false) String area,
                             Model model) {
        //调用分页业务
        Variety variety = null;
        if (area != null) {
            variety = new Variety();
            variety.setArea(area);
        }
        PageInfo<Variety> pageInfo = userService.AllArea(variety, page, pageSize);
        System.out.println(pageInfo);
        model.addAttribute("pageInfo", pageInfo);
        return "user/area";
    }
    /*-----------------------------------------------------------------------------------------------------------------*/
    // 普通用户查询所有植物学特征
    @RequestMapping("/allphy")
    public String showpage(@RequestParam(value = "pn", defaultValue = "1") Integer page,
                           @RequestParam(defaultValue = "12") Integer pageSize,
                           @RequestParam(required = false) String name,
                           @RequestParam(required = false) String flower,
                           @RequestParam(required = false) String leaf,
                           Model model) {
        //调用分页业务
        Phytology phytology = null;
        if (name != null || flower != null || leaf != null) {
            phytology = new Phytology();
            phytology.setName(name);
            phytology.setFlower(flower);
            phytology.setLeaf(leaf);
        }
        PageInfo<Phytology> pageInfo = userService.AllPhytology(phytology, page, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "user/phy";
    }
    // 查询所有生物学特征
    @RequestMapping("/allbio")
    public String Biopage(@RequestParam(value = "pn", defaultValue = "1") Integer page,
                          @RequestParam(defaultValue = "12") Integer pageSize,
                          @RequestParam(required = false) String name,
                          @RequestParam(required = false) String height,
                          @RequestParam(required = false) String habit,
                          Model model) {
        //调用分页业务
        Biology biology = null;
        if (name != null || height != null ||habit != null) {
            biology = new Biology();
            biology.setName(name);
            biology.setHeight(height);
            biology.setHabit(habit);
        }
        PageInfo<Biology> pageInfo = userService.AllBiology(biology, page, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "user/bio";
    }

    // 查询所有品质性状
    @RequestMapping("/allqua")
    public String Quapage(@RequestParam(value = "pn", defaultValue = "1") Integer page,
                          @RequestParam(defaultValue = "12") Integer pageSize,
                          @RequestParam(required = false) String name,
                          @RequestParam(required = false) String grain,
                          @RequestParam(required = false) String grease,
                          Model model) {
        //调用分页业务
        Quality quality = null;
        if (name != null || grain != null || grease != null) {
            quality = new Quality();
            quality.setName(name);
            quality.setGrain(grain);
            quality.setGrease(grease);
        }
        PageInfo<Quality> pageInfo = userService.AllQuality(quality, page, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "user/qua";
    }

    //根据品种名查询品种详情信息
    @RequestMapping("/selByName")
    public String queryPhyBy(String name, Model model) {
        Variety ph = userService.queryPhyByNa(name);
        model.addAttribute("ph", ph);
        System.out.println(ph);
        return "user/phyinfo";
    }
    //根据品种名查询品种详情信息
    @RequestMapping("/selByBio")
    public String queryBio(String name, Model model) {
        Variety bio = userService.queryPhyByNa(name);
        model.addAttribute("bi", bio);
        System.out.println(bio);
        return "user/bioinfo";
    }
    //根据品种名查询品种详情信息
    @RequestMapping("/selByQua")
    public String queryQua(String name, Model model) {
        Variety qua = userService.queryPhyByNa(name);
        model.addAttribute("qu", qua);
        System.out.println(qua);
        return "user/quainfo";
    }

    /*-----------------------------------------------------------------------------------------------------------------*/
    // 查看全部豆类科普知识
    @RequestMapping("allknow")
    public String  AllKnowleged(Know know,Model model){
        List<Know> knowList = userService.AllLagum(know);
        model.addAttribute("knowList", knowList);
        return "user/know";
    }
    // 查看全部农作物科普知识
    @RequestMapping("allcrop")
    public String  AllKnowCrop(Know know,Model model){
        List<Know> croplist = userService.AllCrop(know);
        model.addAttribute("croplist", croplist);
        return "user/crop";
    }
    /*根据科普id查询豆类科普知识详情*/
    @RequestMapping("/selByKnowId")
    public String queryKnow(Integer knid, Model model) {
        Know know = userService.KnowById(knid);
        model.addAttribute("know", know);
        return "user/knowinfo";
    }
    /*根据科普id查询农作物科普知识详情*/
    @RequestMapping("/selByCropId")
    public String queryCrop(Integer knid, Model model) {
        Know cr = userService.KnowById(knid);
        model.addAttribute("cr", cr);
        return "user/cropinfo";
    }
}
