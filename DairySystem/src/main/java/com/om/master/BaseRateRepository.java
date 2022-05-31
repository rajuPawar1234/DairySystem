package com.om.master;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.om.mastermodel.BaseRate;
import com.om.model.ShopDetailsModel;

@Repository
public interface BaseRateRepository extends JpaRepository<BaseRate, Integer> {

	
	//List<Employee> findByEmployeeNameAndEmployeeRole(@Param("name")String name,@Param("role") String role);
	
	//List<FarmerModel> findByShopDetailsModel(@Param("ShopDetailsModel") ShopDetailsModel shopDetailsModel);
	
	public List<BaseRate> findByShopDetailsModelAndFlag(@Param("ShopDetailsModel") ShopDetailsModel shopDetailsModel,@Param("flag") int flag);
	
	public List<BaseRate> findByShopDetailsModelOrderByIdDesc(@Param("ShopDetailsModel") ShopDetailsModel shopDetailsModel);
	
}
