package com.om.main;

import java.util.List;

import com.om.model.Adminlogin;
import com.om.model.OwnerDetailsModel;
import com.om.model.ShopDetailsModel;

public interface MainService {

	public Adminlogin checkLoginDetails(String username, String password);
	
	public OwnerDetailsModel checkLoginDetailsOwner(String username, String password);
	
	public ShopDetailsModel addNewShopName(ShopDetailsModel shopDetailsModel);
	public List<ShopDetailsModel> getAllShopNameList();
	public ShopDetailsModel updateShopName(ShopDetailsModel shopDetailsModel);
	
	public OwnerDetailsModel addNewOwner(OwnerDetailsModel ownerDetailsModel,int ShopNameId);
	public OwnerDetailsModel updateOwnerDetails(OwnerDetailsModel ownerDetailsModel);
	public List<OwnerDetailsModel> getAllOwnerDetails();
	
	
}
