package com.om.collection;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.om.model.FarmerModel;

@Controller
public class CollectionController {

	List<String> keyword = new ArrayList<>();

	@Autowired
	CollectionService collectionService;

	// CollectionPage
	@RequestMapping(value = "/CollectionPage")
	public ModelAndView CollectionPage(Model model, HttpServletRequest request, HttpSession httpSession) {
		httpSession = request.getSession();
		String UsName = (String) httpSession.getAttribute("UsernameAdmin");
		if (UsName != null) {
			int ShopId = (int) httpSession.getAttribute("ShopId");
			System.out.println(UsName + " is User shopId is: -> " + ShopId);
			model.addAttribute("pageTitle", "Rate Master Page");
			// model.addAttribute("BaseRates", masterService.getGetCurrentBaseRate(ShopId));
			// model.addAttribute("AllBaseRates", masterService.getAllBaseRate(ShopId));
			return new ModelAndView("collectionPage");
		} else {
			System.out.println("Invalid Admin...");
			model.addAttribute("Message", "First Login Your Account...");
			return new ModelAndView("mainLogin");
		}
	}

	// searchFarmerIdAutocomplete
	@RequestMapping("searchFarmerIdAutocomplete")
	@ResponseBody
	public List<String> searchFarmerIdAutocomplete(HttpServletRequest requet, HttpSession httpSession) {
		int ShopId = (int) httpSession.getAttribute("ShopId");
		keyword = collectionService.getNameListAutocomplete(requet.getParameter("term"), ShopId);
		return keyword;
	}

	// searchFarmerNameAutocomplete
	@RequestMapping("searchFarmerNameAutocomplete")
	@ResponseBody
	public List<String> searchFarmerNameAutocomplete(HttpServletRequest requet, HttpSession httpSession) {
		int ShopId = (int) httpSession.getAttribute("ShopId");
		keyword = collectionService.searchFarmerNameAutocomplete(requet.getParameter("term"), ShopId);
		return keyword;
	}
	
	@RequestMapping(value = "getFarmerDetailsByNameOnChange", method = RequestMethod.GET)
	@ResponseBody
	public List<FarmerModel> getFarmerDetailsByNameOnChange(HttpServletRequest request, HttpSession httpSession) {
		httpSession = request.getSession();
		String UsName = (String) httpSession.getAttribute("UsernameAdmin");
		System.out.println(UsName + " is User");
		if (UsName != null) {
			int ShopId = (int) httpSession.getAttribute("ShopId");
			String FarmerName = request.getParameter("FarmerName");
			return collectionService.getFarmerDetailsByNameOnChange(FarmerName, ShopId);
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "getFarmerDetailsByFarmerIdOnChange", method = RequestMethod.GET)
	@ResponseBody
	public List<FarmerModel> getFarmerDetailsByFarmerIdOnChange(HttpServletRequest request, HttpSession httpSession) {
		httpSession = request.getSession();
		String UsName = (String) httpSession.getAttribute("UsernameAdmin");
		System.out.println(UsName + " is User");
		if (UsName != null) {
			int ShopId = (int) httpSession.getAttribute("ShopId");
			int FarmerId = Integer.parseInt(request.getParameter("FarmerId"));
			System.out.println(collectionService.getFarmerDetailsByFarmerIdOnChange(FarmerId, ShopId));
			return collectionService.getFarmerDetailsByFarmerIdOnChange(FarmerId, ShopId);
		} else {
			return null;
		}
	}
}
