package com.om.collection;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.om.farmer.FarmerRepository;
import com.om.main.ShopNameRepository;
import com.om.model.FarmerModel;

@Service
public class CollectionServiceClass implements CollectionService {

	@Autowired
	FarmerRepository farmerRepository;

	@Autowired
	ShopNameRepository shopNameRepository;

	@Override
	public List<String> getNameListAutocomplete(String parameter, int shopId) {
		System.out.println("Getting Id like " + parameter);
		return farmerRepository.getAllFarmerIdForAutocomplete(Integer.parseInt(parameter), shopId);
	}

	@Override
	public List<String> searchFarmerNameAutocomplete(String parameter, int shopId) {
		System.out.println("Getting Name like " + parameter);
		return farmerRepository.getAllFarmerNamesForAutocomplete(parameter, shopId);
	}

	@Override
	public List<FarmerModel> getFarmerDetailsByNameOnChange(String fname, int shopId) {
		System.out.println("Change event for " + fname);
		return farmerRepository.findByFnameAndShopDetailsModel(fname, shopNameRepository.getById(shopId));
	}

	@Override
	public List<FarmerModel> getFarmerDetailsByFarmerIdOnChange(int farmerId, int shopId) {
		return farmerRepository.findByFidAndShopDetailsModel(farmerId, shopNameRepository.getById(shopId));
	}

}
