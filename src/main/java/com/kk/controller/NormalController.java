package com.kk.controller;

import com.github.pagehelper.PageInfo;
import com.kk.pogo.*;
import com.kk.service.*;
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
@RequestMapping("/manage")
public class NormalController {
    @Autowired
    @Qualifier("VarietyServiceImpl")
    private VarietyService varietyService;
    @Autowired
    @Qualifier("PhytologyServiceImpl")
    private PhytologyService phytologyService;
    @Autowired
    @Qualifier("BiologyServiceImpl")
    private BiologyService biologyService;
    @Autowired
    @Qualifier("QualityServiceImpl")
    private QualityService qualityService;
    @Autowired
    @Qualifier("AdminServiceImpl")
    private AdminService adminService;
    @Autowired
    @Qualifier("KnowServiceImpl")
    private KnowService knowService;
    String knowFileName = "";
    String saveFileName = "";


/*跳转至修改账户页面*/
    @RequestMapping("adminfo")
    public String updatead() {
        return "admin/updateadinfo";
    }
    /*修改超级管理员信息*/
    @RequestMapping("/upadm")
    public String updateadmin(User user) {
        int us = adminService.updateNorPwd(user);
        if (us > 0) {
            System.out.println("修改成功" + us);
            return "redirect:/admin/tologins";
        } else {
            System.out.println("修改失败" + us);
            return "error/err";
        }
    }
    /*--------------------------------------------------------------------------------------------------------*/
    /*查询全部品种*/
    @RequestMapping("/allVariety")
    public String showPage(@RequestParam(value = "pn", defaultValue = "1") Integer page,
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

        return "admin/main";
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

    //管理员---跳转到添加品种页面
    @RequestMapping("/toAddVariety")
    public String toAddBeans(Variety variety) {
        return "admin/main";
    }
    /*添加信息*/
    @RequestMapping("/save")
    public String addVarietys(Variety variety, HttpServletRequest request) {
        //设置图片的名称
        variety.setImage(saveFileName);
        //调用service保存
        int num = varietyService.addVariety(variety);
        //清空saveFileName变量中的内容,为了下次增加或修改的异步ajax的上传处理
        saveFileName = "";
        System.out.println(variety);
        //增加成功后应该重新访问数据库,所以跳转到分页显示的action上
        return "redirect:/manage/allVariety";
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
            return "error/err";
        }
        return "redirect:/manage/allVariety";
    }

    /*删除单个品种*/
    @RequestMapping("/delectVarId")
    public String deleteVarId(Integer id) {
        Integer var = varietyService.deleteVarietyById(id);
        System.out.println("integer=>" + var);
        if (var > 0) {
            System.out.println("删除成功");
            return "redirect:/manage/allVariety";
        } else {
            System.out.println("删除失败");
            return "error/err";
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
            return "redirect:/manage/allVariety";
        }else{
            System.out.println("修改失败");
        }
        //处理完更新后,saveFileName里有可能有数据,
        // 而下一次更新时要使用这个变量做为判断的依据,就会出错,所以必须清空saveFileName.
        saveFileName = "";

        return "error/err";

    }

    /*修改功能*/
    @PostMapping("/updateVar")
    public String updateVar(Variety variety) {
        Integer  num = varietyService.updateVariety(variety);
        if (num > 0) {
            System.out.println("修改成功"+num);
            return "redirect:/manage/allVariety";
        }else{
            System.out.println("修改失败");
            return "error/err";
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

    /*----------------------------------------------------------------------------------------------------------------*/
// 查询所有植物学特征
    @RequestMapping("/allphytology")
    public String showpage(@RequestParam(value="pn",defaultValue="1")Integer page,
                           @RequestParam(defaultValue = "8") Integer pageSize,
                           @RequestParam(required = false) String name,
                           @RequestParam(required = false) String flower,
                           Model model) {
        //调用分页业务
        Phytology phytology = null;
        if (name != null || flower != null) {
            phytology = new Phytology();
            phytology.setName(name);
            phytology.setFlower(flower);
        }
        PageInfo<Phytology> pageInfo = phytologyService.getAllPhytologyPage(phytology,page,pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "admin/phytology";
    }

    /*添加修改植物学特征业务模块*/
    @PostMapping("/updatePhy")
    public String update(Phytology phytology) {
        this.phytologyService.updatePhytology(phytology);
        System.out.println("修改成功");
        return "redirect:/manage/allphytology";
    }

    //批量删除品种植物学特征
    @RequestMapping("/deletePhy")
    @ResponseBody
    public String deletePhy(String phyList) {
        try {
            String [] strs=phyList.split(",");
            List<Integer> agids=new ArrayList<Integer>();
            for(int i=0;i<strs.length;i++){
                agids.add(Integer.parseInt(strs[i]));
            }
            System.out.println(agids);
            phytologyService.delectPhy(agids);
        }catch (Exception e){
            System.out.println("删除失败");
            return "error/errph";
        }
        return "redirect:/manage/allphytology";
    }

    /*删除单个植物学特征*/
    @RequestMapping("/delectById")
    public String deleteById(Integer agid, Model model) {
        Integer phy = phytologyService.delectOnePhy(agid);
        System.out.println("integer=>" + phy);
        model.addAttribute("deleteUser", phy);
        if (phy > 0) {
            System.out.println("删除成功");
            return "redirect:/manage/allphytology";
        } else {
            System.out.println("删除失败");
            return "error/errph";
        }
    }

    @RequestMapping("/selectById")
    public String queryVarietyById(Integer agid) {
        Phytology var = phytologyService.queryVarietyById(agid);
        System.out.println(var);
        return "redirect:/manage/allphytology";
    }

    //导出植物学信息表
    @RequestMapping("/excelphy")
    public void excel2(HttpServletResponse response )throws IOException {
        response.setCharacterEncoding("UTF-8");
        List<Phytology> list = phytologyService.getAllPhytology();
        //创建excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        //创建sheet页
        HSSFSheet sheet = wb.createSheet("农业性状-植物学特征表");
        //创建标题行
        HSSFRow titleRow = sheet.createRow(0);
        titleRow.createCell(0).setCellValue("品种名");
        titleRow.createCell(1).setCellValue("花色");
        titleRow.createCell(2).setCellValue("叶形状");
        titleRow.createCell(3).setCellValue("种子形状");
        titleRow.createCell(4).setCellValue("种皮颜色");
        titleRow.createCell(5).setCellValue("种脐颜色");
        titleRow.createCell(6).setCellValue("茸毛色");
        titleRow.createCell(7).setCellValue("子叶色");

        for (Phytology phytology : list) {
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum()+1);
            dataRow.createCell(0).setCellValue(phytology.name);
            dataRow.createCell(1).setCellValue(phytology.flower);
            dataRow.createCell(2).setCellValue(phytology.leaf);
            dataRow.createCell(3).setCellValue(phytology.seed);
            dataRow.createCell(4).setCellValue(phytology.testa);
            dataRow.createCell(5).setCellValue(phytology.hilum);
            dataRow.createCell(6).setCellValue(phytology.fuzz);
            dataRow.createCell(7).setCellValue(phytology.contyledon);

        }
        response.setContentType("application/octet-stream;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String("农业性状-植物学特征表".getBytes(),"iso-8859-1") + ".xls");
        OutputStream ouputStream = response.getOutputStream();
        wb.write(ouputStream);
        ouputStream.flush();
        ouputStream.close();
    }

    /*----------------------------------------------------------------------------------------------------------------*/
    // 查询所有生物学特征
    @RequestMapping("/allbiology")
    public String Biopage(@RequestParam(value="pn",defaultValue="1")Integer page,
                          @RequestParam(defaultValue = "8") Integer pageSize,
                          @RequestParam(required = false) String name,
                          @RequestParam(required = false) String height,
                          Model model) {
        //调用分页业务
        Biology biology = null;
        if (name != null || height != null) {
            biology = new Biology();
            biology.setName(name);
            biology.setHeight(height);
        }
        PageInfo<Biology> pageInfo = biologyService.getAllBiologyPage(biology,page,pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "admin/biology";
    }


    /*添加修改生物学特征业务模块*/
    @PostMapping("/updateBio")
    public String update(Biology biology) {
        this.biologyService.updateBiology(biology);
        System.out.println("修改成功");
        return "redirect:/manage/allbiology";
    }

    //批量删除品种生物学特征
    @RequestMapping("/deleteBio")
    @ResponseBody
    public String deleteBio(String bioList) {
        try {
            String [] strs=bioList.split(",");
            List<Integer> agids=new ArrayList<Integer>();
            for(int i=0;i<strs.length;i++){
                agids.add(Integer.parseInt(strs[i]));
            }
            System.out.println(agids);
            biologyService.delectBio(agids);
        }catch (Exception e){
            System.out.println("删除失败");
            return "error/errph";
        }
        return "redirect:/manage/allbiology";
    }

    /*删除单个生物学特征*/
    @RequestMapping("/delectBioId")
    public String deleteBioId(Integer agid) {
        Integer bio = biologyService.delectOneBio(agid);
        System.out.println("integer=>" + bio);
        if (bio > 0) {
            System.out.println("删除成功");
            return "redirect:/manage/allbiology";
        } else {
            System.out.println("删除失败");
            return "error/errph";
        }
    }
    //导出生物学信息表
    @RequestMapping("/excelbio")
    public void excel3(HttpServletResponse response )throws IOException {
        response.setCharacterEncoding("UTF-8");
        List<Biology> list = biologyService.getAllBiology();
        //创建excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        //创建sheet页
        HSSFSheet sheet = wb.createSheet("农业性状-生物学特征表");
        //创建标题行
        HSSFRow titleRow = sheet.createRow(0);
        titleRow.createCell(0).setCellValue("品种名");
        titleRow.createCell(1).setCellValue("株高/cm");
        titleRow.createCell(2).setCellValue("主茎节数");
        titleRow.createCell(3).setCellValue("主茎荚数");
        titleRow.createCell(4).setCellValue("分枝数");
        titleRow.createCell(5).setCellValue("倒伏性");
        titleRow.createCell(6).setCellValue("地上部生物量/t/hm2");
        titleRow.createCell(7).setCellValue("生育日数/d");
        titleRow.createCell(8).setCellValue("习性");
        titleRow.createCell(9).setCellValue("初花期/d");
        titleRow.createCell(10).setCellValue("生育后期/d");
        titleRow.createCell(11).setCellValue("全生育期/d");

        for (Biology biology : list) {
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum()+1);
            dataRow.createCell(0).setCellValue(biology.name);
            dataRow.createCell(1).setCellValue(biology.height);
            dataRow.createCell(2).setCellValue(biology.pedicle);
            dataRow.createCell(3).setCellValue(biology.pod);
            dataRow.createCell(4).setCellValue(biology.branch);
            dataRow.createCell(5).setCellValue(biology.lodging);
            dataRow.createCell(6).setCellValue(biology.biomass);
            dataRow.createCell(7).setCellValue(biology.fertility);
            dataRow.createCell(8).setCellValue(biology.habit);
            dataRow.createCell(9).setCellValue(biology.anthesis);
            dataRow.createCell(10).setCellValue(biology.afterbirth);
            dataRow.createCell(11).setCellValue(biology.lifetime);

        }
        response.setContentType("application/octet-stream;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String("农业性状-生物学特征表".getBytes(),"iso-8859-1") + ".xls");
        OutputStream ouputStream = response.getOutputStream();
        wb.write(ouputStream);
        ouputStream.flush();
        ouputStream.close();
    }

    /*----------------------------------------------------------------------------------------------------------------*/
    // 查询所有品质性状
    @RequestMapping("/allquality")
    public String  Quapage(@RequestParam(value="pn",defaultValue="1")Integer page,
                           @RequestParam(defaultValue = "8") Integer pageSize,
                           @RequestParam(required = false) String name,
                           @RequestParam(required = false) String grain,
                           Model model) {
        //调用分页业务
        Quality quality = null;
        if (name != null || grain != null) {
            quality = new Quality();
            quality.setName(name);
            quality.setGrain(grain);
        }
        PageInfo<Quality> pageInfo = qualityService.getAllQualityPage(quality,page,pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "admin/quality";
    }

    /*缺失添加修改生物学特征业务模块*/
    @PostMapping("/updateQua")
    public String updatequa(Quality quality) {
        this.qualityService.updateQuality(quality);
        System.out.println("修改成功");
        return "redirect:/manage/allquality";
    }

    //批量删除品质性状
    @RequestMapping("/deleteQua")
    @ResponseBody
    public String deleteQua(String quaList) {
        try {
            String [] strs=quaList.split(",");
            List<Integer> agids=new ArrayList<Integer>();
            for(int i=0;i<strs.length;i++){
                agids.add(Integer.parseInt(strs[i]));
            }
            System.out.println(agids);
            qualityService.delectQua(agids);
        }catch (Exception e){
            System.out.println("删除失败");
            return "error/errph";
        }
        return "redirect:/manage/allquality";
    }

    /*删除单个生物学特征*/
    @RequestMapping("/delectQuaId")
    public String deleteQuaId(Integer agid) {
        Integer qua = qualityService.delectOneQua(agid);
        System.out.println("integer=>" + qua);
        if (qua > 0) {
            System.out.println("删除成功");
            return "redirect:/manage/allquality";
        } else {
            System.out.println("删除失败");
            return "error/errph";
        }
    }
    //导出生物学信息表
    @RequestMapping("/excelqua")
    public void excel4(HttpServletResponse response )throws IOException {
        response.setCharacterEncoding("UTF-8");
        List<Quality> list = qualityService.getAllQuality();
        //创建excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        //创建sheet页
        HSSFSheet sheet = wb.createSheet("农业性状-品质性状");
        //创建标题行
        HSSFRow titleRow = sheet.createRow(0);
        titleRow.createCell(0).setCellValue("品种名");
        titleRow.createCell(1).setCellValue("百粒重/g");
        titleRow.createCell(2).setCellValue("油脂含量/%");
        titleRow.createCell(3).setCellValue("脂肪含量/%");
        titleRow.createCell(4).setCellValue("蛋白质含量/%");
        titleRow.createCell(5).setCellValue("蛋脂含量/%");
        titleRow.createCell(6).setCellValue("耐盐性指数");
        titleRow.createCell(7).setCellValue("耐碱性指数");
        titleRow.createCell(8).setCellValue("胱氨酸");
        titleRow.createCell(9).setCellValue("蛋氨酸");
        titleRow.createCell(10).setCellValue("硬脂酸");
        titleRow.createCell(11).setCellValue("软脂酸");
        titleRow.createCell(12).setCellValue("油酸");
        for (Quality quality : list) {
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum()+1);
            dataRow.createCell(0).setCellValue(quality.name);
            dataRow.createCell(1).setCellValue(quality.grain);
            dataRow.createCell(2).setCellValue(quality.grease);
            dataRow.createCell(3).setCellValue(quality.fat);
            dataRow.createCell(4).setCellValue(quality.protein);
            dataRow.createCell(5).setCellValue(quality.lipid);
            dataRow.createCell(6).setCellValue(quality.salt);
            dataRow.createCell(7).setCellValue(quality.alkali);
            dataRow.createCell(8).setCellValue(quality.cystine);
            dataRow.createCell(9).setCellValue(quality.methionine);
            dataRow.createCell(10).setCellValue(quality.hard);
            dataRow.createCell(11).setCellValue(quality.soft);
            dataRow.createCell(12).setCellValue(quality.oil);

        }
        response.setContentType("application/octet-stream;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String("农业性状-品质性状".getBytes(),"iso-8859-1") + ".xls");
        OutputStream ouputStream = response.getOutputStream();
        wb.write(ouputStream);
        ouputStream.flush();
        ouputStream.close();
    }

    /*--------------------------------------------------------------------------------------------------------*/
    /*查询所有科普知识*/
    @RequestMapping("allknow")
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
        return "admin/know";
    }
    /*查询所有豆类科普知识*/
    @RequestMapping("alllegu")
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
        return "admin/lagum";
    }
    /*查询所有科普知识*/
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
        return "admin/crop";
    }

    /*添加科普知识*/
    //异步ajax文件上传处理
    @ResponseBody
    @RequestMapping("/ajaxImage")
    public Object ajaxImage(MultipartFile knimg, HttpServletRequest request) {
        //上传图片  存储图片

        //提取生成文件名UUID+上传图片的后缀.jpg   .png   getFileType()传入图片的名称，自动截取后缀
        knowFileName = FileNameUtil.getUUIDFileName() + FileNameUtil.getFileType(knimg.getOriginalFilename());

        //获取图片要存储的路径
        String path = request.getSession().getServletContext().getRealPath("/image");
        //转存    路径+/+文件名    比如:E:\Mi-ssm\Image_big\slgjhakl234algjlajg.jpg
        try {
            knimg.transferTo(new File(path + File.separator + knowFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        //回显图片  返回客户端JSON对象，封装图片的路径，为了在页面实现立即回显
        JSONObject object = new JSONObject();
        object.put("imgurl", knowFileName);//imgurl保存图片名称
        return object.toString();
    }
    //管理员---跳转到添加页面
    @RequestMapping("/toAddknow")
    public String toAddKnow(Know know) {
        return "admin/know";
    }

    /*添加信息*/
    @RequestMapping("/addknow")
    public String addKnow(Know know, HttpServletRequest request) {
        //设置图片的名称
        know.setKnimg(knowFileName);
        //调用service保存
        int num = knowService.addKnow(know);
        //清空saveFileName变量中的内容,为了下次增加或修改的异步ajax的上传处理
        knowFileName = "";
        System.out.println(know);
        //增加成功后应该重新访问数据库,所以跳转到分页显示的action上
        return "redirect:/manage/allknow";
    }
    /*批量删除*/
    @RequestMapping("/delKnows")
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
            return "error/errkn";
        }
        return "redirect:/manage/allknow";
    }

    /*删除单个科普信息*/
    @RequestMapping("/delKnow")
    public String deleteKnow(Integer knid, Model model) {
        Integer kn = knowService.deleteKnow(knid);
        System.out.println("integer=>" + kn);
        model.addAttribute("deleteKnow", kn);
        if (kn > 0) {
            System.out.println("删除成功");
            return "redirect:/manage/allknow";
        } else {
            System.out.println("删除失败");
            return "error/errkn";
        }
    }

    /*--------------------------------------------------------------------------------------------*/
    //管理员---跳转到添加豆类页面
    @RequestMapping("/toAddLegum")
    public String toAddLegum(Know know) {
        return "admin/legum";
    }

    /*添加豆类信息*/
    @RequestMapping("/addlegum")
    public String addLegum(Know know, HttpServletRequest request) {
        //设置图片的名称
        know.setKnimg(knowFileName);
        //调用service保存
        int num = knowService.addKnow(know);
        //清空saveFileName变量中的内容,为了下次增加或修改的异步ajax的上传处理
        knowFileName = "";
        System.out.println(know);
        //增加成功后应该重新访问数据库,所以跳转到分页显示的action上
        return "redirect:/manage/alllegu";
    }
    /*批量删除豆类*/
    @RequestMapping("/dellegums")
    @ResponseBody
    public String deleteLegums(String knowList) {
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
            return "error/errkn";
        }
        return "redirect:/manage/alllegu";
    }

    /*删除单个豆类科普信息*/
    @RequestMapping("/dellegum")
    public String deleteLegum(Integer knid, Model model) {
        Integer kn = knowService.deleteKnow(knid);
        System.out.println("integer=>" + kn);
        model.addAttribute("deleteKnow", kn);
        if (kn > 0) {
            System.out.println("删除成功");
            return "redirect:/manage/alllegu";
        } else {
            System.out.println("删除失败");
            return "error/errkn";
        }
    }
    /*--------------------------------------------------------------------------------------------*/
    //管理员---跳转到添加豆类页面
    @RequestMapping("/toAddCrop")
    public String toAddCrop(Know know) {
        return "admin/crop";
    }

    /*添加豆类信息*/
    @RequestMapping("/addcrop")
    public String addCrop(Know know, HttpServletRequest request) {
        //设置图片的名称
        know.setKnimg(knowFileName);
        //调用service保存
        int num = knowService.addKnow(know);
        //清空saveFileName变量中的内容,为了下次增加或修改的异步ajax的上传处理
        knowFileName = "";
        System.out.println(know);
        //增加成功后应该重新访问数据库,所以跳转到分页显示的action上
        return "redirect:/manage/allcrop";
    }
    /*批量删除豆类*/
    @RequestMapping("/delcrops")
    @ResponseBody
    public String deleteCrops(String knowList) {
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
            return "error/errkn";
        }
        return "redirect:/manage/allcrop";
    }

    /*删除单个豆类科普信息*/
    @RequestMapping("/delcrop")
    public String deleteCrop(Integer knid, Model model) {
        Integer kn = knowService.deleteKnow(knid);
        System.out.println("integer=>" + kn);
        model.addAttribute("deleteKnow", kn);
        if (kn > 0) {
            System.out.println("删除成功");
            return "redirect:/manage/allcrop";
        } else {
            System.out.println("删除失败");
            return "error/errkn";
        }
    }
}
