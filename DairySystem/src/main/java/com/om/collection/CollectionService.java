package com.om.collection;

import java.util.List;

import com.om.model.FarmerModel;

public interface CollectionService {

	List<String> getNameListAutocomplete(String parameter, int shopId);

	List<String> searchFarmerNameAutocomplete(String parameter, int shopId);

	List<FarmerModel> getFarmerDetailsByNameOnChange(String parameter, int shopId);

	List<FarmerModel> getFarmerDetailsByFarmerIdOnChange(int farmerId, int shopId);

}
