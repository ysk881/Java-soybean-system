package com.test;

import com.kk.service.PhytologyService;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyTest {
    @Test
    public void test(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationcontext.xml");
        PhytologyService phytologyServiceImpl = (PhytologyService) context.getBean("PhytologyServiceImpl");
        /*int phytology = phytologyServiceImpl.delectPhy(5);
        System.out.println(phytology);*/
/*        for (Phytology phytology : phytologyServiceImpl.getAllPhytology()) {
            System.out.println(phytology);
        }
        phytologyServiceImpl.getAllPhytologyPage(1, 4);

*//*        for (Variety variety : varietyServiceImpl.queryAllVariety()) {
            System.out.println(variety);
        }*/
        /*VarietyService varietyServiceImpl = (VarietyService) context.getBean("VarietyServiceImpl");*/
/*        PageInfo<Variety> userByPage = varietyServiceImpl.queryAllVar("",1, 3);
        System.out.println("下一页为:"+userByPage.getNextPage());
        System.out.println("当前页数据为:"+userByPage.getList().toString());
        System.out.println("总的用户数量为:"+userByPage.getTotal());
        System.out.println("总的页数为:"+userByPage.getPageSize());*/
/*        Variety variety = varietyServiceImpl.queryVarietyById(41);
        System.out.println("variety="+variety);*/


    }
}
