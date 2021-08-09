package cn.items.ssm.mapper;

import java.util.List;

import cn.items.ssm.po.ItemsCustom;
import cn.items.ssm.po.ItemsQueryVo;


public interface ItemsMapperCustom {
	// 商品查询列表
	public List<ItemsCustom> findItemsList(ItemsQueryVo itemsQueryVo)
			throws Exception;

}
