package com.qfedu.service.impl;

import com.qfedu.mapper.GoodsMapper;
import com.qfedu.pojo.Goods;
import com.qfedu.pojo.vo.GoodsVo;
import com.qfedu.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    private GoodsMapper mapper;

    @Override
    public int addGoods(Goods goods) {
        if(goods!=null){
            return mapper.insert(goods);
        }
      return 0;
    }

    @Override
    public List<GoodsVo> selectGoods(Goods goods) {
        List<GoodsVo> voList = mapper.selectAllactive(goods);
        Iterator<GoodsVo> iterator = voList.iterator();
        while (iterator.hasNext()){
            Iterator<Goods> goodsIterator = iterator.next().getGoods().iterator();
            while (goodsIterator.hasNext()){
              if(goodsIterator.next().getFlag()==1){
                  //这是flag为1的商品
                  goodsIterator.remove();
              }
            }
        }
        return voList;
    }

    @Override
    public boolean updateGoodsFlag(Goods goods) {
        //这里1表示商品下架
        goods.setFlag(1);
        return mapper.updateByPrimaryKeySelective(goods)>0;
    }

    @Override
    public Goods selectGoodsById(Integer id) {
        Goods goods = mapper.selectByPrimaryKey(id);
        return goods;
    }

    @Override
    public boolean updateGoods(Goods goods) {
        return  mapper.updateByPrimaryKeySelective(goods) != 0 ;
    }

}
