package com.om.main;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.om.model.Adminlogin;
import com.om.model.OwnerDetailsModel;
import com.om.model.ShopDetailsModel;

@Service
public class MainServiceClass implements MainService {

	@Autowired
	AdminRepository adminRepository;

	@Autowired
	OwnerRepository ownerRepository;
	
	@Autowired
	ShopNameRepository shopRepository;
	
	@Override
	public Adminlogin checkLoginDetails(String username, String password) {
		return adminRepository.checkLoginDetails(username, password);
	}

	@Override
	public OwnerDetailsModel checkLoginDetailsOwner(String username, String password) {
		return ownerRepository.checkLoginDetails(username, password);
	}

	@Override
	public ShopDetailsModel addNewShopName(ShopDetailsModel shopDetailsModel) {
		return shopRepository.save(shopDetailsModel);
	}

	@Override
	public List<ShopDetailsModel> getAllShopNameList() {
		return shopRepository.findAll();
	}

	@Override
	public ShopDetailsModel updateShopName(ShopDetailsModel shopDetailsModel) {
		return shopRepository.saveAndFlush(shopDetailsModel);
	}

	@Override
	public OwnerDetailsModel addNewOwner(OwnerDetailsModel ownerDetailsModel,int ShopNameId) {
		ownerDetailsModel.setShopDetailsModel(shopRepository.getById(ShopNameId));
		ownerDetailsModel.setShopName(shopRepository.getById(ShopNameId).getShopName());
		return ownerRepository.save(ownerDetailsModel);
	}

	@Override
	public OwnerDetailsModel updateOwnerDetails(OwnerDetailsModel ownerDetailsModel) {
		return ownerRepository.saveAndFlush(ownerDetailsModel);
	}

	@Override
	public List<OwnerDetailsModel> getAllOwnerDetails() {
		return ownerRepository.findAll();
	}
}
