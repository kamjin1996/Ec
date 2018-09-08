package com.qfedu.service.impl;

import com.qfedu.mapper.CategoryMapper;
import com.qfedu.pojo.Category;
import com.qfedu.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper mapper;

    @Override
    public List<Category> selectAll(Category category) {

        return  mapper.selectAllactive(category);
    }
    @Override
    public int insertCategory(Category category){
        int row = 0;
        if (category != null && !"".equals(category.getCname())){

           if(category.getParentid()==0){
               category.setLevel(1);
           } else {
               category.setLevel(2);
           }

            row = mapper.insert(category);
        }
            return row;

    }

}
