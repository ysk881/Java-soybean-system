package com.kk.controller;

import com.github.pagehelper.PageInfo;
import com.kk.pogo.*;
import com.kk.service.AdminService;
import com.kk.service.BiologyService;
import com.kk.service.PhytologyService;
import com.kk.service.QualityService;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/agronomic")
public class AgronController {
    @Autowired
    @Qualifier("PhytologyServiceImpl")
    private PhytologyService phytologyService;
    @Autowired
    @Qualifier("BiologyServiceImpl")
    private BiologyService biologyService;
    @Autowired
    @Qualifier("QualityServiceImpl")
    private QualityService qualityService;

    /*--------------------------------------------------------------------------------------------------------*/
    // 查询所有植物学特征
    @RequestMapping("/allphytologys")
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
        System.out.println(pageInfo);
        model.addAttribute("pageInfo", pageInfo);
        return "super/phytology";
    }

    /*添加修改植物学特征业务模块*/
    @PostMapping("/updatePhy")
    public String update(Phytology phytology) {
        this.phytologyService.updatePhytology(phytology);
        System.out.println("修改成功");
        return "redirect:/agronomic/allphytologys";
    }

    //批量删除品种植物学特征
    @RequestMapping("/deletePhys")
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
            return "error/errphy";
        }
        return "redirect:/agronomic/allphytologys";
    }

    /*删除单个植物学特征*/
    @RequestMapping("/delectById")
    public String deleteById(Integer agid, Model model) {
        Integer phy = phytologyService.delectOnePhy(agid);
        System.out.println("integer=>" + phy);
        model.addAttribute("deleteUser", phy);
        if (phy > 0) {
            System.out.println("删除成功");
            return "redirect:/agronomic/allphytologys";
        } else {
            System.out.println("删除失败");
            return "error/errphy";
        }
    }

    @RequestMapping("/selectById")
    public String queryVarietyById(Integer agid) {
        Phytology var = phytologyService.queryVarietyById(agid);
        System.out.println(var);
        return "redirect:/agronomic/allphytologys";
    }

    //导出植物学信息表
    @RequestMapping("/excelphy")
    public void excel(HttpServletResponse response )throws IOException {
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

    /*--------------------------------------------------------------------------------------------------------*/
    // 查询所有生物学特征
    @RequestMapping("/allbiologys")
    public String Biopage(@RequestParam(value="pn",defaultValue="1")Integer page,
                          @RequestParam(defaultValue = "8") Integer pageSize,
                          @RequestParam(required = false) String name,
                          @RequestParam(required = false) String habit,
                          Model model) {
        //调用分页业务
        Biology biology = null;
        if (name != null || habit != null) {
            biology = new Biology();
            biology.setName(name);
            biology.setHabit(habit);
        }
        PageInfo<Biology> pageInfo = biologyService.getAllBiologyPage(biology,page,pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "super/biology";
    }


    /*添加修改生物学特征业务模块*/
    @PostMapping("/updateBio")
    public String update(Biology biology) {
        this.biologyService.updateBiology(biology);
        System.out.println("修改成功");
        return "redirect:/agronomic/allbiologys";
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
            return "error/errphy";
        }
        return "redirect:/agronomic/allbiologys";
    }

    /*删除单个生物学特征*/
    @RequestMapping("/delectBioId")
    public String deleteBioId(Integer agid) {
        Integer bio = biologyService.delectOneBio(agid);
        System.out.println("integer=>" + bio);
        if (bio > 0) {
            System.out.println("删除成功");
            return "redirect:/agronomic/allbiologys";
        } else {
            System.out.println("删除失败");
            return "error/errphy";
        }
    }
    //导出生物学信息表
    @RequestMapping("/excelbio")
    public void excel2(HttpServletResponse response )throws IOException {
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

    /*--------------------------------------------------------------------------------------------------------*/
    // 查询所有品质性状
    @RequestMapping("/allqualitys")
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
        return "super/quality";
    }

    /*缺失添加修改生物学特征业务模块*/
    @PostMapping("/updateQua")
    public String updatequa(Quality quality) {
        this.qualityService.updateQuality(quality);
        System.out.println("修改成功");
        return "redirect:/agronomic/allqualitys";
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
            return "error/errphy";
        }
        return "redirect:/agronomic/allqualitys";
    }

    /*删除单个生物学特征*/
    @RequestMapping("/delectQuaId")
    public String deleteQuaId(Integer agid) {
        Integer qua = qualityService.delectOneQua(agid);
        System.out.println("integer=>" + qua);
        if (qua > 0) {
            System.out.println("删除成功");
            return "redirect:/agronomic/allqualitys";
        } else {
            System.out.println("删除失败");
            return "error/errphy";
        }
    }
    //导出生物学信息表
    @RequestMapping("/excelqua")
    public void excel3(HttpServletResponse response )throws IOException {
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


}
