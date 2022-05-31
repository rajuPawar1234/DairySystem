package com.om.master;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.om.mastermodel.RateChangeModelCow;
import com.om.model.ShopDetailsModel;

@Repository
public interface RateChangeRepoCow extends JpaRepository<RateChangeModelCow, Integer> {

	public List<RateChangeModelCow> findByShopDetailsModelAndFlag(@Param("ShopDetailsModel") ShopDetailsModel shopDetailsModel, @Param("flag") int flag);

	public List<RateChangeModelCow> findByShopDetailsModelOrderByIdDesc(@Param("ShopDetailsModel") ShopDetailsModel shopDetailsModel);

}
