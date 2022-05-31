package com.om.master;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.om.mastermodel.RateChangeModelBuffalo;
import com.om.model.ShopDetailsModel;

@Repository
public interface RateChangeRepoBuffalo extends JpaRepository<RateChangeModelBuffalo, Integer> {

	public List<RateChangeModelBuffalo> findByShopDetailsModelAndFlag(@Param("ShopDetailsModel") ShopDetailsModel shopDetailsModel, @Param("flag") int flag);

	public List<RateChangeModelBuffalo> findByShopDetailsModelOrderByIdDesc(@Param("ShopDetailsModel") ShopDetailsModel shopDetailsModel);

}
