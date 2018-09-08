package com.qfedu.web.controller;

import com.qfedu.pojo.Category;
import com.qfedu.pojo.vo.QueryVo;
import com.qfedu.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CategoryController {
    @Autowired
    private CategoryService service;

    //展示所有商品分类
    @RequestMapping(value = "/showGoodsType.do", method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody
    QueryVo showCategory(Category category) {

        List<Category> categoryList = service.selectAll(category);
        QueryVo queryVo = new QueryVo();
        queryVo.setCode(categoryList.size() > 0 ? 1000 : 1001);
        queryVo.setMsg(categoryList.size() > 0 ? "success" : "faild");
        queryVo.setData(categoryList.size() > 0 ? categoryList : null);

        return queryVo;
    }

    //插入分类
    @RequestMapping(value = "/addGoodsType.do", method = RequestMethod.POST)
    public String insertCategory(Category category) {
        int id = service.insertCategory(category);
        return id > 0 ? "/admin/showGoodsType.jsp" : "/admin/addGoodsType.jsp";
    }
}
