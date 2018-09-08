package com.qfedu.service;

import com.qfedu.pojo.Category;

import java.util.List;

public interface CategoryService {
    List<Category> selectAll(Category category);

    int insertCategory(Category category);


}
