package com.om.master;

import java.util.List;

import com.om.mastermodel.BaseRate;
import com.om.mastermodel.BaseRateBuffalo;
import com.om.mastermodel.RateChangeModelBuffalo;
import com.om.mastermodel.RateChangeModelCow;

public interface MasterService {

	List<BaseRate> getGetCurrentBaseRate(int shopId);

	BaseRate updateBaseRate(int shopId, int rateId, BaseRate baseRate);

	List<BaseRate> getAllBaseRate(int shopId);

	List<RateChangeModelCow> getCurrentChangedRateCow(int shopId);

	List<RateChangeModelCow> getAllChangedRateCow(int shopId);
	
	RateChangeModelCow updateChangedRateCow(int shopId, int id, RateChangeModelCow rateChangeModelCow);
	
	///////////////////////////////////////////////////////////////////
	
	List<BaseRateBuffalo> getGetCurrentBaseRateOfBuffalo(int shopId);

	List<BaseRateBuffalo> getAllBaseRatesOfBuffalo(int shopId);

	BaseRateBuffalo updateBaseRateBuffalo(int shopId, int rateId, BaseRateBuffalo baseRateBuffalo);

	List<RateChangeModelBuffalo> getCurrentChangedRateBuffalo(int shopId);

	List<RateChangeModelBuffalo> getAllChangedRateBuffalo(int shopId);

	RateChangeModelBuffalo updateChangedRateBuffalo(int shopId, int id,RateChangeModelBuffalo rateChangeModelBuffalo);
}
