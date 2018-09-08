package com.qfedu.pojo.vo;

import com.qfedu.pojo.Goods;

import java.util.List;

public class GoodsVo {
    private List<Goods> goods;
    private String cname;

    public List<Goods> getGoods() {
        return goods;
    }

    public void setGoods(List<Goods> goods) {
        this.goods = goods;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    @Override
    public String toString() {
        return "GoodsVo{" +
                "goods=" + goods +
                ", cname='" + cname + '\'' +
                '}';
    }
}
