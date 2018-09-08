package com.qfedu.service;

import com.qfedu.pojo.Goods;
import com.qfedu.pojo.vo.GoodsVo;

import java.util.List;

public interface GoodsService {
    int addGoods(Goods goods);

    List<GoodsVo> selectGoods(Goods goods);

    boolean updateGoodsFlag(Goods goods);

    Goods selectGoodsById(Integer id);

    boolean updateGoods(Goods goods);
}
