package com.om.farmer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.om.main.ShopNameRepository;
import com.om.model.FarmerModel;
import com.om.model.ShopDetailsModel;

@Service
public class FarmerServiceClass implements FarmerService {

	@Autowired
	FarmerRepository farmerRepository;
	
	@Autowired
	ShopNameRepository shopRepository;

	@Override
	public FarmerModel addNewFarmer(FarmerModel farmerModel,int shopId) {
		ShopDetailsModel byId = shopRepository.getById(shopId);
		farmerModel.setShopDetailsModel(byId);
		farmerModel.setFshopId(shopId);
		return farmerRepository.save(farmerModel);
	}

	@Override
	public List<FarmerModel> getAllFarmer(int shopId) {
		//return farmerRepository.findAll();
		return farmerRepository.findByShopDetailsModel(shopRepository.getById(shopId));
	}

	@Override
	public FarmerModel updateFarmer(FarmerModel farmerModel,int shopId) {
		ShopDetailsModel byId = shopRepository.getById(shopId);
		farmerModel.setShopDetailsModel(byId);
		farmerModel.setFshopId(shopId);
		return farmerRepository.saveAndFlush(farmerModel);
	}

}
