package com.qfedu.mapper;

import com.qfedu.pojo.Goods;
import com.qfedu.pojo.vo.GoodsVo;

import java.util.List;

public interface GoodsMapper {

    int insert(Goods goods);

    Goods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKeyWithBLOBs(Goods record);

    List<GoodsVo> selectAllactive(Goods goods);

}