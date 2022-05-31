package com.om.farmer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.om.model.FarmerModel;

@Controller
public class FarmerController {

	@Autowired
	FarmerService farmerService;

	@RequestMapping(value="FarmerPage")
	public ModelAndView FarmerPage(Model model, HttpServletRequest request, HttpSession httpSession) {
		httpSession = request.getSession();
		String UsName = (String) httpSession.getAttribute("UsernameAdmin");
		int ShopId = (int) httpSession.getAttribute("ShopId");
		System.out.println(UsName + " is User shopId is: -> "+ShopId);
		if (UsName != null) {
			model.addAttribute("pageTitle", "Farmer");
			model.addAttribute("AllFarmers",farmerService.getAllFarmer(ShopId));
			System.out.println(farmerService.getAllFarmer(ShopId));
			return new ModelAndView("farmerPage");
		} else {
			System.out.println("Invalid Admin...");
			model.addAttribute("Message", "First Login Your Account...");
			return new ModelAndView("mainLogin");
		}
	}
	
	@RequestMapping(value="/AddNewFarmer", method = RequestMethod.POST)
	public ModelAndView AddNewFarmer(Model model, HttpServletRequest request, HttpSession httpSession,
			@ModelAttribute FarmerModel farmerModel) {
		httpSession = request.getSession();
		String UsName = (String) httpSession.getAttribute("UsernameAdmin");
		int ShopId = (int) httpSession.getAttribute("ShopId");
		System.out.println(UsName + " is User shopId is: -> "+ShopId);
		if (UsName != null) {
			model.addAttribute("pageTitle", "Farmer");
			
			farmerService.addNewFarmer(farmerModel,ShopId);
			model.addAttribute("AllFarmers",farmerService.getAllFarmer(ShopId));
			
			return new ModelAndView("farmerPage");
		} else {
			System.out.println("Invalid Admin...");
			model.addAttribute("Message", "First Login Your Account...");
			return new ModelAndView("mainLogin");
		}
	}
	
	@RequestMapping(value="/UpdateFarmer")
	public ModelAndView UpdateFarmer(Model model, HttpServletRequest request, HttpSession httpSession,
			@ModelAttribute FarmerModel farmerModel) {
		httpSession = request.getSession();
		String UsName = (String) httpSession.getAttribute("UsernameAdmin");
		int ShopId = (int) httpSession.getAttribute("ShopId");
		if (UsName != null) {
			model.addAttribute("pageTitle", "Farmer");
			
			farmerService.updateFarmer(farmerModel,ShopId);
			model.addAttribute("AllFarmers",farmerService.getAllFarmer(ShopId));
			
			return new ModelAndView("farmerPage");
		} else {
			System.out.println("Invalid Admin...");
			model.addAttribute("Message", "First Login Your Account...");
			return new ModelAndView("mainLogin");
		}
	}

}
