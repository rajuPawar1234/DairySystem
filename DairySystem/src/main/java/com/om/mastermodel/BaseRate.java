package com.om.mastermodel;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import com.om.model.ShopDetailsModel;

@Entity
public class BaseRate {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private float fat;
	private float milkrate;
	private float snf;
	private String dateofchange;
	private String milkType = "cow";
	private int flag = 1;

	@OneToOne
	@JoinColumn(name = "shopId")
	ShopDetailsModel shopDetailsModel;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getFat() {
		return fat;
	}

	public void setFat(float fat) {
		this.fat = fat;
	}

	public float getMilkrate() {
		return milkrate;
	}

	public void setMilkrate(float milkrate) {
		this.milkrate = milkrate;
	}

	public float getSnf() {
		return snf;
	}

	public void setSnf(float snf) {
		this.snf = snf;
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

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public ShopDetailsModel getShopDetailsModel() {
		return shopDetailsModel;
	}

	public void setShopDetailsModel(ShopDetailsModel shopDetailsModel) {
		this.shopDetailsModel = shopDetailsModel;
	}

	@Override
	public String toString() {
		return "BaseRate [id=" + id + ", fat=" + fat + ", milkrate=" + milkrate + ", snf=" + snf + ", dateofchange="
				+ dateofchange + ", milkType=" + milkType + ", flag=" + flag + ", shopDetailsModel=" + shopDetailsModel
				+ "]";
	}

	public BaseRate(int id, float fat, float milkrate, float snf, String dateofchange, String milkType, int flag,
			ShopDetailsModel shopDetailsModel) {
		super();
		this.id = id;
		this.fat = fat;
		this.milkrate = milkrate;
		this.snf = snf;
		this.dateofchange = dateofchange;
		this.milkType = milkType;
		this.flag = flag;
		this.shopDetailsModel = shopDetailsModel;
	}

	public BaseRate() {
		// TODO Auto-generated constructor stub
	}

}
