package com.kk.controller;

import com.github.pagehelper.PageInfo;
import com.kk.pogo.Msg;
import com.kk.pogo.User;
import com.kk.pogo.Variety;
import com.kk.service.VarietyService;
import com.kk.utils.FileNameUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/variety")
public class VarietyController {
    //controller 调 service层
    @Autowired
    @Qualifier("VarietyServiceImpl")
    private VarietyService varietyService;
    String saveFileName = "";


    /*查询全部品种*/
    @RequestMapping("/allVarietys")
    public String showPage2(@RequestParam(value = "pn", defaultValue = "1") Integer page,
                            @RequestParam(defaultValue = "6") Integer pageSize,
                            @RequestParam(required = false) String name, @RequestParam(required = false) String illness,
                            Model model) {
        //调用分页业务
        Variety variety = null;
        if (name != null || illness != null) {
            variety = new Variety();
            variety.setName(name);
            variety.setIllness(illness);
        }
        PageInfo<Variety> pageInfo = varietyService.VarietyPage(variety, page, pageSize);
        model.addAttribute("pageInfo", pageInfo);

        return "super/main";
    }

    //异步ajax文件上传处理
    @ResponseBody
    @RequestMapping("/ajaxImg")
    public Object ajaxImg(MultipartFile image, HttpServletRequest request) {
        //上传图片  存储图片

        //提取生成文件名UUID+上传图片的后缀.jpg   .png   getFileType()传入图片的名称，自动截取后缀
        saveFileName = FileNameUtil.getUUIDFileName() + FileNameUtil.getFileType(image.getOriginalFilename());

        //获取图片要存储的路径
        String path = request.getSession().getServletContext().getRealPath("/image");
        //转存    路径+/+文件名    比如:E:\Mi-ssm\Image_big\slgjhakl234algjlajg.jpg
        try {
            image.transferTo(new File(path + File.separator + saveFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        //回显图片  返回客户端JSON对象，封装图片的路径，为了在页面实现立即回显
        JSONObject object = new JSONObject();
        object.put("imgurl", saveFileName);//imgurl保存图片名称
        return object.toString();
    }

    /*根本查询改品种是否存在*/
    @ResponseBody
    @RequestMapping("/findname")
    public boolean findVariety(String name) {
        Variety variety = varietyService.findName(name);
        System.out.println("findName=" + variety);
        if (variety != null) {
            return true;
        } else {
            return false;
        }
    }

    //超级管理员---跳转到添加品种页面
    @RequestMapping("/toAddVarietys")
    public String toAddBeans(Variety variety) {
        return "super/main";
    }

    /*添加信息*/
    @RequestMapping("/saves")
    public String addVarietys(Variety variety, HttpServletRequest request) {
        //设置图片的名称
        variety.setImage(saveFileName);
        //调用service保存
        int num = varietyService.addVariety(variety);
        //清空saveFileName变量中的内容,为了下次增加或修改的异步ajax的上传处理
        saveFileName = "";
        System.out.println(variety);
        //增加成功后应该重新访问数据库,所以跳转到分页显示的action上
        return "redirect:/variety/allVarietys";
    }

    //批量删除品种
    @RequestMapping("/deleteVar")
    @ResponseBody
    public String deleteVar(String varList) {
        try {
            String [] strs=varList.split(",");
            List<Integer> ids=new ArrayList<Integer>();
            for(int i=0;i<strs.length;i++){
                ids.add(Integer.parseInt(strs[i]));
            }
            System.out.println(ids);
            varietyService.deleteVariety(ids);
        }catch (Exception e){
            System.out.println("删除失败");
            return "error/errvar";
        }
        return "redirect:/variety/allVarietys";
    }

    /*删除单个品种*/
    @RequestMapping("/delectVarId")
    public String deleteVarId(Integer id) {
        Integer var = varietyService.deleteVarietyById(id);
        System.out.println("integer=>" + var);
        if (var > 0) {
            System.out.println("删除成功");
            return "redirect:/variety/allVarietys";
        } else {
            System.out.println("删除失败");
            return "error/errvar";
        }
    }
    /*修改功能*/
    @PostMapping("/updateImg")
    public String updateImg(Variety variety) {
        //因为ajax的异步图片上传,如果有上传过,
        // 则saveFileName里有上传上来的图片的名称,
        // 如果没有使用异步ajax上传过图片,则saveFileNme="",
        // 实体类variety使用隐藏表单域提供上来的Image原始图片的名称;
        if (!saveFileName.equals("")) {
            variety.setImage(saveFileName);
        }
        //完成更新处理
        int num = 0;
        try {
            num = varietyService.updateImg(variety);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (num > 0) {
            System.out.println("修改成功"+num);
            return "redirect:/variety/allVarietys";
        }else{
            System.out.println("修改失败");
        }
        //处理完更新后,saveFileName里有可能有数据,
        // 而下一次更新时要使用这个变量做为判断的依据,就会出错,所以必须清空saveFileName.
        saveFileName = "";

        return "error/errvar";

    }

    /*修改功能*/
    @PostMapping("/updateVar")
    public String updateVar(Variety variety) {
        Integer  num = varietyService.updateVariety(variety);
        if (num > 0) {
            System.out.println("修改成功"+num);
            return "redirect:/variety/allVarietys";
        }else{
            System.out.println("修改失败");
            return "error/errvar";
        }

    }


    //导出信息表
    @RequestMapping("/excel")
    public void excel(HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("UTF-8");
        List<Variety> list = varietyService.queryAllVariety();
        System.out.println(list);
        //创建excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        //创建sheet页
        HSSFSheet sheet = wb.createSheet("大豆种质资源数据库");
        //创建标题行
        HSSFRow titleRow = sheet.createRow(0);
        titleRow.createCell(0).setCellValue("品种名");
        titleRow.createCell(1).setCellValue("品种来源");
        titleRow.createCell(2).setCellValue("产量（kg/hm2）");
        titleRow.createCell(3).setCellValue("播种月份");
        titleRow.createCell(4).setCellValue("播量/kg");
        titleRow.createCell(5).setCellValue("保苗/万株/hm²");
        titleRow.createCell(6).setCellValue("适宜区域");
        titleRow.createCell(7).setCellValue("抗病性");

        titleRow.createCell(8).setCellValue("花色");
        titleRow.createCell(9).setCellValue("叶形状");
        titleRow.createCell(10).setCellValue("种子形状");
        titleRow.createCell(11).setCellValue("种皮颜色");
        titleRow.createCell(12).setCellValue("种脐颜色");
        titleRow.createCell(13).setCellValue("茸毛色");
        titleRow.createCell(14).setCellValue("子叶色");

        titleRow.createCell(15).setCellValue("株高/cm");
        titleRow.createCell(16).setCellValue("主茎节数");
        titleRow.createCell(17).setCellValue("主茎荚数");
        titleRow.createCell(18).setCellValue("分枝数");
        titleRow.createCell(19).setCellValue("倒伏性");
        titleRow.createCell(20).setCellValue("地上部生物量/t/hm2");
        titleRow.createCell(21).setCellValue("生育日数/d");
        titleRow.createCell(22).setCellValue("习性");
        titleRow.createCell(23).setCellValue("初花期/d");
        titleRow.createCell(24).setCellValue("生育后期/d");
        titleRow.createCell(25).setCellValue("生育后期/d");

        titleRow.createCell(26).setCellValue("百粒重/g");
        titleRow.createCell(27).setCellValue("油脂含量/%");
        titleRow.createCell(28).setCellValue("脂肪含量/%");
        titleRow.createCell(29).setCellValue("蛋白质含量/%");
        titleRow.createCell(30).setCellValue("蛋脂含量/%");
        titleRow.createCell(31).setCellValue("耐盐性指数");
        titleRow.createCell(32).setCellValue("耐碱性指数");
        titleRow.createCell(33).setCellValue("胱氨酸");
        titleRow.createCell(34).setCellValue("蛋氨酸");
        titleRow.createCell(35).setCellValue("硬脂酸");
        titleRow.createCell(36).setCellValue("软脂酸");
        titleRow.createCell(37).setCellValue("油酸");


        for (Variety variety : list) {
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
            dataRow.createCell(0).setCellValue(variety.name);
            dataRow.createCell(1).setCellValue(variety.source);
            dataRow.createCell(2).setCellValue(variety.yield);
            dataRow.createCell(3).setCellValue(variety.month);
            dataRow.createCell(4).setCellValue(variety.rate);
            dataRow.createCell(5).setCellValue(variety.protect);
            dataRow.createCell(6).setCellValue(variety.area);
            dataRow.createCell(7).setCellValue(variety.illness);

            dataRow.createCell(8).setCellValue(variety.phytology.flower);
            dataRow.createCell(9).setCellValue(variety.phytology.leaf);
            dataRow.createCell(10).setCellValue(variety.phytology.seed);
            dataRow.createCell(11).setCellValue(variety.phytology.testa);
            dataRow.createCell(12).setCellValue(variety.phytology.hilum);
            dataRow.createCell(13).setCellValue(variety.phytology.fuzz);
            dataRow.createCell(14).setCellValue(variety.phytology.contyledon);


            dataRow.createCell(15).setCellValue(variety.biology.height);
            dataRow.createCell(16).setCellValue(variety.biology.pedicle);
            dataRow.createCell(17).setCellValue(variety.biology.pod);
            dataRow.createCell(18).setCellValue(variety.biology.branch);
            dataRow.createCell(19).setCellValue(variety.biology.lodging);
            dataRow.createCell(20).setCellValue(variety.biology.biomass);
            dataRow.createCell(21).setCellValue(variety.biology.fertility);
            dataRow.createCell(22).setCellValue(variety.biology.habit);
            dataRow.createCell(23).setCellValue(variety.biology.anthesis);
            dataRow.createCell(24).setCellValue(variety.biology.afterbirth);
            dataRow.createCell(25).setCellValue(variety.biology.lifetime);

            dataRow.createCell(26).setCellValue(variety.quality.grain);
            dataRow.createCell(27).setCellValue(variety.quality.grease);
            dataRow.createCell(28).setCellValue(variety.quality.fat);
            dataRow.createCell(29).setCellValue(variety.quality.protein);
            dataRow.createCell(30).setCellValue(variety.quality.lipid);
            dataRow.createCell(31).setCellValue(variety.quality.salt);
            dataRow.createCell(32).setCellValue(variety.quality.alkali);
            dataRow.createCell(33).setCellValue(variety.quality.cystine);
            dataRow.createCell(34).setCellValue(variety.quality.methionine);
            dataRow.createCell(35).setCellValue(variety.quality.hard);
            dataRow.createCell(36).setCellValue(variety.quality.soft);
            dataRow.createCell(37).setCellValue(variety.quality.oil);

        }
        response.setContentType("application/octet-stream;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String("大豆种质资源数据库".getBytes(), "iso-8859-1") + ".xls");


        OutputStream ouputStream = response.getOutputStream();
        wb.write(ouputStream);
        ouputStream.flush();
        ouputStream.close();
    }
}
