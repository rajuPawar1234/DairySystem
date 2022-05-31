
package com.om.farmer;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.om.model.FarmerModel;
import com.om.model.ShopDetailsModel;

@Repository
public interface FarmerRepository extends JpaRepository<FarmerModel, Integer> {

	List<FarmerModel> findByShopDetailsModel(@Param("ShopDetailsModel") ShopDetailsModel shopDetailsModel);

	List<FarmerModel> findByFnameAndShopDetailsModel(@Param("Fname") String Fname,@Param("ShopDetailsModel") ShopDetailsModel shopDetailsModel);
	
	List<FarmerModel> findByFidAndShopDetailsModel(@Param("Fid") int Fid,@Param("ShopDetailsModel") ShopDetailsModel shopDetailsModel);

	@Query(value = "select DISTINCT(fid) from farmer_model f where f.fid like %:keyword% and f.shop_id=:shopid", nativeQuery = true)
	public List<String> getAllFarmerIdForAutocomplete(@Param("keyword") int keyword, @Param("shopid") int shopid);

	@Query(value = "select DISTINCT(fname) from farmer_model f where f.fname like %:keyword% and f.shop_id=:shopid", nativeQuery = true)
	public List<String> getAllFarmerNamesForAutocomplete(@Param("keyword") String keyword, @Param("shopid") int shopid);
}