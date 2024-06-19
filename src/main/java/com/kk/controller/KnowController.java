package com.kk.controller;

import com.github.pagehelper.PageInfo;
import com.kk.pogo.Know;
import com.kk.pogo.User;
import com.kk.pogo.Variety;
import com.kk.service.KnowService;
import com.kk.utils.FileNameUtil;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/know")
public class KnowController {
    @Autowired
    @Qualifier("KnowServiceImpl")
    private KnowService knowService;
    String saveFileName = "";

    /*查询所有科普知识*/
    @RequestMapping("allknows")
    public String findAllKnow(@RequestParam(value = "pn", defaultValue = "1") Integer page,
                              @RequestParam(defaultValue = "5") Integer pageSize,
                              @RequestParam(required = false) String knname,
                              Model model) {
        //调用分页业务
        Know know = null;
        if (knname != null) {
            know = new Know();
            know.setKnname(knname);

        }
        PageInfo<Know> pageInfo = knowService.findAllKnow(know, page, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "super/know";
    }
    /*查询所有豆类科普知识*/
    @RequestMapping("alllegumina")
    public String findLegumina(@RequestParam(value = "pn", defaultValue = "1") Integer page,
                              @RequestParam(defaultValue = "5") Integer pageSize,
                              @RequestParam(required = false) String knname,
                              Model model) {
        //调用分页业务
        Know know = null;
        if (knname != null) {
            know = new Know();
            know.setKnname(knname);

        }
        PageInfo<Know> pageInfo = knowService.findLegumina(know, page, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "super/legum";
    }
    /*查询所有农作物科普知识*/
    @RequestMapping("allcrop")
    public String findCrop(@RequestParam(value = "pn", defaultValue = "1") Integer page,
                              @RequestParam(defaultValue = "5") Integer pageSize,
                              @RequestParam(required = false) String knname,
                              Model model) {
        //调用分页业务
        Know know = null;
        if (knname != null) {
            know = new Know();
            know.setKnname(knname);

        }
        PageInfo<Know> pageInfo = knowService.findCrop(know, page, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "super/crop";
    }

    /*添加科普知识*/
    //异步ajax文件上传处理
    @ResponseBody
    @RequestMapping("/ajaxImg")
    public Object ajaxImg(MultipartFile knimg, HttpServletRequest request) {
        //上传图片  存储图片

        //提取生成文件名UUID+上传图片的后缀.jpg   .png   getFileType()传入图片的名称，自动截取后缀
        saveFileName = FileNameUtil.getUUIDFileName() + FileNameUtil.getFileType(knimg.getOriginalFilename());

        //获取图片要存储的路径
        String path = request.getSession().getServletContext().getRealPath("/image");
        //转存    路径+/+文件名    比如:E:\Mi-ssm\Image_big\slgjhakl234algjlajg.jpg
        try {
            knimg.transferTo(new File(path + File.separator + saveFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        //回显图片  返回客户端JSON对象，封装图片的路径，为了在页面实现立即回显
        JSONObject object = new JSONObject();
        object.put("imgurl", saveFileName);//imgurl保存图片名称
        return object.toString();
    }
    //跳转到添加页面
    @RequestMapping("/toAddKnow")
    public String toAddKnow(Know know) {
        return "super/know";
    }

    /*添加信息*/
    @RequestMapping("/addKnow")
    public String addKnow(Know know, HttpServletRequest request) {
        //设置图片的名称
        know.setKnimg(saveFileName);
        //调用service保存
        int num = knowService.addKnow(know);
        //清空saveFileName变量中的内容,为了下次增加或修改的异步ajax的上传处理
        saveFileName = "";
        System.out.println(know);
        //增加成功后应该重新访问数据库,所以跳转到分页显示的action上
        return "redirect:/know/allknows";
    }
    /*批量删除*/
    @RequestMapping("/delknows")
    @ResponseBody
    public String deleteKnows(String knowList) {
        try {
            String[] strs = knowList.split(",");
            List<Integer> knids = new ArrayList<Integer>();
            for (int i = 0; i < strs.length; i++) {
                knids.add(Integer.parseInt(strs[i]));
            }
            System.out.println(knids);
            knowService.deleteKnows(knids);
        } catch (Exception e) {
            System.out.println("删除失败");
            return "error/errknow";
        }
        return "redirect:/know/allknows";
    }

    /*删除单个科普知识*/
    @RequestMapping("/delknow")
    public String deleteKnow(Integer knid, Model model) {
        Integer kn = knowService.deleteKnow(knid);
        System.out.println("integer=>" + kn);
        model.addAttribute("deleteKnow", kn);
        if (kn > 0) {
            System.out.println("删除成功");
            return "redirect:/know/allknows";
        } else {
            System.out.println("删除失败");
            return "error/errknow";
        }
    }

    /*-------------------------------------------------------------------------------------------*/
    //跳转到豆类添加页面
    @RequestMapping("/toAddlegum")
    public String toAddLegum(Know know) {
        return "super/legum";
    }

    /*添加豆类信息*/
    @RequestMapping("/addlegum")
    public String addLegum(Know know, HttpServletRequest request) {
        //设置图片的名称
        know.setKnimg(saveFileName);
        //调用service保存
        int num = knowService.addKnow(know);
        //清空saveFileName变量中的内容,为了下次增加或修改的异步ajax的上传处理
        saveFileName = "";
        System.out.println(know);
        //增加成功后应该重新访问数据库,所以跳转到分页显示的action上
        return "redirect:/know/alllegumina";
    }
    /*批量删除豆类科普*/
    @RequestMapping("/dellegums")
    @ResponseBody
    public String deleteLegum(String knowList) {
        try {
            String[] strs = knowList.split(",");
            List<Integer> knids = new ArrayList<Integer>();
            for (int i = 0; i < strs.length; i++) {
                knids.add(Integer.parseInt(strs[i]));
            }
            System.out.println(knids);
            knowService.deleteKnows(knids);
        } catch (Exception e) {
            System.out.println("删除失败");
            return "error/errknow";
        }
        return "redirect:/know/alllegumina";
    }

    /*删除单个豆类科普知识*/
    @RequestMapping("/dellegum")
    public String deleteLegum(Integer knid, Model model) {
        Integer kn = knowService.deleteKnow(knid);
        System.out.println("integer=>" + kn);
        model.addAttribute("deletelegum", kn);
        if (kn > 0) {
            System.out.println("删除成功");
            return "redirect:/know/alllegumina";
        } else {
            System.out.println("删除失败");
            return "error/errknow";
        }
    }

    /*-------------------------------------------------------------------------------------------*/
    //跳转到农作物添加页面
    @RequestMapping("/toAddcrop")
    public String toAddCrop(Know know) {
        return "super/crop";
    }

    /*添加农作物信息*/
    @RequestMapping("/addcrop")
    public String addCrop(Know know, HttpServletRequest request) {
        //设置图片的名称
        know.setKnimg(saveFileName);
        //调用service保存
        int num = knowService.addKnow(know);
        //清空saveFileName变量中的内容,为了下次增加或修改的异步ajax的上传处理
        saveFileName = "";
        System.out.println(know);
        //增加成功后应该重新访问数据库,所以跳转到分页显示的action上
        return "redirect:/know/allcrop";
    }
    /*批量删除农作物科普*/
    @RequestMapping("/delcrops")
    @ResponseBody
    public String deleteCrop(String knowList) {
        try {
            String[] strs = knowList.split(",");
            List<Integer> knids = new ArrayList<Integer>();
            for (int i = 0; i < strs.length; i++) {
                knids.add(Integer.parseInt(strs[i]));
            }
            System.out.println(knids);
            knowService.deleteKnows(knids);
        } catch (Exception e) {
            System.out.println("删除失败");
            return "error/errknow";
        }
        return "redirect:/know/allcrop";
    }

    /*删除单个农作物科普知识*/
    @RequestMapping("/delcrop")
    public String deleteCrop(Integer knid, Model model) {
        Integer kn = knowService.deleteKnow(knid);
        System.out.println("integer=>" + kn);
        model.addAttribute("deletecrop", kn);
        if (kn > 0) {
            System.out.println("删除成功");
            return "redirect:/know/allcrop";
        } else {
            System.out.println("删除失败");
            return "error/errknow";
        }
    }
}
