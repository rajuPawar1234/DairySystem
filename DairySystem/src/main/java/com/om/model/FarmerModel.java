package com.om.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class FarmerModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int fid;
	private String fname;
	private String faddress;
	private String fmobile;
	private String femail;
	private String fdob;

	private int fshopId;

	@OneToOne
	@JoinColumn(name = "shopId")
	@JsonIgnore
	ShopDetailsModel shopDetailsModel;

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFaddress() {
		return faddress;
	}

	public void setFaddress(String faddress) {
		this.faddress = faddress;
	}

	public String getFmobile() {
		return fmobile;
	}

	public void setFmobile(String fmobile) {
		this.fmobile = fmobile;
	}

	public String getFemail() {
		return femail;
	}

	public void setFemail(String femail) {
		this.femail = femail;
	}

	public String getFdob() {
		return fdob;
	}

	public void setFdob(String fdob) {
		this.fdob = fdob;
	}

	public int getFshopId() {
		return fshopId;
	}

	public void setFshopId(int fshopId) {
		this.fshopId = fshopId;
	}

	public ShopDetailsModel getShopDetailsModel() {
		return shopDetailsModel;
	}

	public void setShopDetailsModel(ShopDetailsModel shopDetailsModel) {
		this.shopDetailsModel = shopDetailsModel;
	}

	@Override
	public String toString() {
		return "FarmerModel [fid=" + fid + ", fname=" + fname + ", faddress=" + faddress + ", fmobile=" + fmobile
				+ ", femail=" + femail + ", fdob=" + fdob + ", fshopId=" + fshopId + ", shopDetailsModel="
				+ shopDetailsModel + "]";
	}

	public FarmerModel(int fid, String fname, String faddress, String fmobile, String femail, String fdob, int fshopId,
			ShopDetailsModel shopDetailsModel) {
		super();
		this.fid = fid;
		this.fname = fname;
		this.faddress = faddress;
		this.fmobile = fmobile;
		this.femail = femail;
		this.fdob = fdob;
		this.fshopId = fshopId;
		this.shopDetailsModel = shopDetailsModel;
	}

	public FarmerModel() {
		// TODO Auto-generated constructor stub
	}

}
