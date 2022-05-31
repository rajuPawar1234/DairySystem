package com.om.master;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.om.main.ShopNameRepository;
import com.om.mastermodel.BaseRate;
import com.om.mastermodel.BaseRateBuffalo;
import com.om.mastermodel.RateChangeModelBuffalo;
import com.om.mastermodel.RateChangeModelCow;

@Service
public class MasterServiceClass implements MasterService {

	@Autowired
	BaseRateRepository baseRateRepository;

	@Autowired
	BaseRateBuffaloReposotory baseRateRepoBuffalo;

	@Autowired
	ShopNameRepository shopRepository;

	@Autowired
	RateChangeRepoCow rateChangeRepoCow;

	@Autowired
	RateChangeRepoBuffalo rateChangeRepoBuffalo;

	@Override
	public List<BaseRate> getGetCurrentBaseRate(int shopId) {

		return baseRateRepository.findByShopDetailsModelAndFlag(shopRepository.getById(shopId), 1);
	}

	@Override
	public BaseRate updateBaseRate(int shopId, int rateId, BaseRate baseRate) {
		BaseRate oldBaseRate = baseRateRepository.getById(rateId);
		oldBaseRate.setFlag(0);
		baseRateRepository.saveAndFlush(oldBaseRate);
		baseRate.setShopDetailsModel(shopRepository.getById(shopId));
		return baseRateRepository.save(baseRate);
	}

	@Override
	public List<BaseRate> getAllBaseRate(int shopId) {
		return baseRateRepository.findByShopDetailsModelOrderByIdDesc(shopRepository.getById(shopId));
	}

	@Override
	public List<RateChangeModelCow> getCurrentChangedRateCow(int shopId) {
		return rateChangeRepoCow.findByShopDetailsModelAndFlag(shopRepository.getById(shopId), 1);
	}

	@Override
	public List<RateChangeModelCow> getAllChangedRateCow(int shopId) {
		return rateChangeRepoCow.findByShopDetailsModelOrderByIdDesc(shopRepository.getById(shopId));
	}

	@Override
	public RateChangeModelCow updateChangedRateCow(int shopId, int id, RateChangeModelCow rateChangeModelCow) {
		RateChangeModelCow oldRateChangeModelCow = rateChangeRepoCow.getById(id);
		oldRateChangeModelCow.setFlag(0);
		rateChangeRepoCow.saveAndFlush(oldRateChangeModelCow);
		rateChangeModelCow.setShopDetailsModel(shopRepository.getById(shopId));
		return rateChangeRepoCow.save(rateChangeModelCow);
	}

	///////////////////////////////////////////////////////////////////////////////////////////////////

	@Override
	public List<BaseRateBuffalo> getGetCurrentBaseRateOfBuffalo(int shopId) {
		return baseRateRepoBuffalo.findByShopDetailsModelAndFlag(shopRepository.getById(shopId), 1);
	}

	@Override
	public List<BaseRateBuffalo> getAllBaseRatesOfBuffalo(int shopId) {
		return baseRateRepoBuffalo.findByShopDetailsModelOrderByIdDesc(shopRepository.getById(shopId));
	}

	@Override
	public BaseRateBuffalo updateBaseRateBuffalo(int shopId, int rateId, BaseRateBuffalo baseRateBuffalo) {
		BaseRateBuffalo oldRateBuffalo = baseRateRepoBuffalo.getById(rateId);
		oldRateBuffalo.setFlag(0);
		baseRateRepoBuffalo.saveAndFlush(oldRateBuffalo);
		baseRateBuffalo.setShopDetailsModel(shopRepository.getById(shopId));
		return baseRateRepoBuffalo.save(baseRateBuffalo);
	}

	@Override
	public List<RateChangeModelBuffalo> getCurrentChangedRateBuffalo(int shopId) {
		return rateChangeRepoBuffalo.findByShopDetailsModelAndFlag(shopRepository.getById(shopId), 1);
	}

	@Override
	public List<RateChangeModelBuffalo> getAllChangedRateBuffalo(int shopId) {
		return rateChangeRepoBuffalo.findByShopDetailsModelOrderByIdDesc(shopRepository.getById(shopId));
	}

	@Override
	public RateChangeModelBuffalo updateChangedRateBuffalo(int shopId, int id, RateChangeModelBuffalo rateChangeModelBuffalo) {
		RateChangeModelBuffalo oldRateChangeModelBuffalo = rateChangeRepoBuffalo.getById(id);
		oldRateChangeModelBuffalo.setFlag(0);
		rateChangeRepoBuffalo.saveAndFlush(oldRateChangeModelBuffalo);
		rateChangeModelBuffalo.setShopDetailsModel(shopRepository.getById(shopId));
		return rateChangeRepoBuffalo.save(rateChangeModelBuffalo);
	}

}
