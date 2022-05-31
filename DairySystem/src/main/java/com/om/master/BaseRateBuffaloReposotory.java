package com.om.master;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.om.mastermodel.BaseRateBuffalo;
import com.om.model.ShopDetailsModel;

@Repository
public interface BaseRateBuffaloReposotory extends JpaRepository<BaseRateBuffalo, Integer>{

	public List<BaseRateBuffalo> findByShopDetailsModelAndFlag(@Param("ShopDetailsModel") ShopDetailsModel shopDetailsModel,@Param("flag") int flag);
	
	public List<BaseRateBuffalo> findByShopDetailsModelOrderByIdDesc(@Param("ShopDetailsModel") ShopDetailsModel shopDetailsModel);

}
