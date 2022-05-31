package com.om.mastermodel;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import com.om.model.ShopDetailsModel;

@Entity
public class RateChangeModelBuffalo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private float fatincreaserate;
	private float fatdecreaserate;
	private float snfincreaserate;
	private float snfdecreaserate;
	private String dateofchange;
	private String milkType = "Buffalo";
	private int flag = 1;

	@OneToOne
	@JoinColumn(name = "id")
	BaseRateBuffalo baseRateBuffalo;

	@OneToOne
	@JoinColumn(name = "shopId")
	ShopDetailsModel shopDetailsModel;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getFatincreaserate() {
		return fatincreaserate;
	}

	public void setFatincreaserate(float fatincreaserate) {
		this.fatincreaserate = fatincreaserate;
	}

	public float getFatdecreaserate() {
		return fatdecreaserate;
	}

	public void setFatdecreaserate(float fatdecreaserate) {
		this.fatdecreaserate = fatdecreaserate;
	}

	public float getSnfincreaserate() {
		return snfincreaserate;
	}

	public void setSnfincreaserate(float snfincreaserate) {
		this.snfincreaserate = snfincreaserate;
	}

	public float getSnfdecreaserate() {
		return snfdecreaserate;
	}

	public void setSnfdecreaserate(float snfdecreaserate) {
		this.snfdecreaserate = snfdecreaserate;
	}

	public String getDateofchange() {
		return dateofchange;
	}

	public void setDateofchange(String dateofchange) {
		this.dateofchange = dateofchange;
	}

	public String getMilkType() {
		return milkType;
	}

	public void setMilkType(String milkType) {
		this.milkType = milkType;
	}

	public BaseRateBuffalo getBaseRateBuffalo() {
		return baseRateBuffalo;
	}

	public void setBaseRateBuffalo(BaseRateBuffalo baseRateBuffalo) {
		this.baseRateBuffalo = baseRateBuffalo;
	}

	public ShopDetailsModel getShopDetailsModel() {
		return shopDetailsModel;
	}

	public void setShopDetailsModel(ShopDetailsModel shopDetailsModel) {
		this.shopDetailsModel = shopDetailsModel;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	@Override
	public String toString() {
		return "RateChangeModelBuffalo [id=" + id + ", fatincreaserate=" + fatincreaserate + ", fatdecreaserate="
				+ fatdecreaserate + ", snfincreaserate=" + snfincreaserate + ", snfdecreaserate=" + snfdecreaserate
				+ ", dateofchange=" + dateofchange + ", milkType=" + milkType + ", flag=" + flag + ", baseRateBuffalo="
				+ baseRateBuffalo + ", shopDetailsModel=" + shopDetailsModel + "]";
	}

	public RateChangeModelBuffalo() {
		// TODO Auto-generated constructor stub
	}

	public RateChangeModelBuffalo(int id, float fatincreaserate, float fatdecreaserate, float snfincreaserate,
			float snfdecreaserate, String dateofchange, String milkType, int flag, BaseRateBuffalo baseRateBuffalo,
			ShopDetailsModel shopDetailsModel) {
		super();
		this.id = id;
		this.fatincreaserate = fatincreaserate;
		this.fatdecreaserate = fatdecreaserate;
		this.snfincreaserate = snfincreaserate;
		this.snfdecreaserate = snfdecreaserate;
		this.dateofchange = dateofchange;
		this.milkType = milkType;
		this.flag = flag;
		this.baseRateBuffalo = baseRateBuffalo;
		this.shopDetailsModel = shopDetailsModel;
	}

}
