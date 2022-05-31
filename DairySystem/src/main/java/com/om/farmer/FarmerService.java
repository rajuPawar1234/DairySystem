package com.om.farmer;

import java.util.List;

import com.om.model.FarmerModel;

public interface FarmerService {

	public FarmerModel addNewFarmer(FarmerModel farmerModel, int ShopId);

	public List<FarmerModel> getAllFarmer(int ShopId);

	public FarmerModel updateFarmer(FarmerModel farmerModel, int ShopId);

}
