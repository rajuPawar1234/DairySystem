package com.om.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.om.model.Adminlogin;
import com.om.model.OwnerDetailsModel;
import com.om.model.ShopDetailsModel;

@Controller
public class MainController {

	@Autowired
	MainService servie;

	
	@RequestMapping("/") public String loginPage1() { return "mainLogin"; }
	 

	
	@RequestMapping("/login") public String loginPage() { return "mainLogin"; }
	 

	@RequestMapping(value = "/toHomePage")
	public ModelAndView getHomePage(Model model, HttpServletRequest request, HttpSession httpSession) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Adminlogin devDetail = servie.checkLoginDetails(username, password);
		OwnerDetailsModel ownerDetails = servie.checkLoginDetailsOwner(username, password);

		if (devDetail != null) {
			if (devDetail.getUsername().equals(username) && devDetail.getPassword().equals(password)) {
				httpSession = request.getSession();
				httpSession.setAttribute("UsernameAdmin", "RajuPawar");
				model.addAttribute("ShopNameList", servie.getAllShopNameList());
				model.addAttribute("OwnerNameList", servie.getAllOwnerDetails());
				System.out.println("For Developer");
				return new ModelAndView("devloperMaster");
			} else {
				model.addAttribute("Message", "Please Enter Correct UserName And Password");
				return new ModelAndView("accessD");
			}
		} else {
			if (ownerDetails != null) {
				if (ownerDetails.getOwnerUserName().equals(username) && ownerDetails.getOwnerPassword().equals(password)) {
					httpSession = request.getSession();
					httpSession.setAttribute("UsernameAdmin", ownerDetails.getOwnerName());
					httpSession.setAttribute("ShopId", ownerDetails.getShopDetailsModel().getShopId());
					httpSession.setAttribute("OwnerId", ownerDetails.getOwnerId());
					httpSession.setAttribute("ShopName", ownerDetails.getShopDetailsModel().getShopName());
					model.addAttribute("pageTitle", "Home");
					model.addAttribute("shopName", ownerDetails.getShopDetailsModel().getShopName());
					return new ModelAndView("mainHome");
				} else {
					model.addAttribute("Message", "Please Enter Correct UserName And Password");
					return new ModelAndView("accessD");
				}
			} else {
				model.addAttribute("Message", "Please Enter Correct UserName And Password");
				return new ModelAndView("accessD"	);
			}
		}
	}

	@RequestMapping("/home")
	public ModelAndView getCustomerPage(Model model, HttpServletRequest request, HttpSession httpSession) {
		httpSession = request.getSession();
		String UsName = (String) httpSession.getAttribute("UsernameAdmin");
		String ShopName = (String) httpSession.getAttribute("ShopName");
		System.out.println(UsName + " is User");
		if (UsName != null) {
			model.addAttribute("pageTitle", "Home");
			model.addAttribute("ShopName", ShopName);
			return new ModelAndView("mainHome");
		} else {
			System.out.println("Invalid Admin...");
			model.addAttribute("Message", "First Login Your Account...");
			return new ModelAndView("accessD");
		}
	}

	@RequestMapping(value = "saveShopNameDetails", method = RequestMethod.POST)
	public ModelAndView addNewShop(Model model, HttpServletRequest request, HttpSession httpSession,
			@ModelAttribute ShopDetailsModel shopDetailsModel) {
		httpSession = request.getSession();
		String UsName = (String) httpSession.getAttribute("UsernameAdmin");
		System.out.println(UsName + " is User");
		if (UsName != null) {
			servie.addNewShopName(shopDetailsModel);
			model.addAttribute("ShopNameList", servie.getAllShopNameList());
			model.addAttribute("OwnerNameList", servie.getAllOwnerDetails());

			return new ModelAndView("devloperMaster");
		} else {
			System.out.println("Invalid Admin...");
			model.addAttribute("Message", "First Login Your Account...");
			return new ModelAndView("mainLogin");
		}
	}

	@RequestMapping(value = "saveOwnerDetails", method = RequestMethod.POST)
	public ModelAndView addNewOwnerDetails(Model model, HttpServletRequest request, HttpSession httpSession,
			@ModelAttribute OwnerDetailsModel ownerModel) {
		httpSession = request.getSession();
		String UsName = (String) httpSession.getAttribute("UsernameAdmin");
		System.out.println(UsName + " is User");
		if (UsName != null) {
			int ShopNameId = Integer.parseInt(request.getParameter("ShopNameId"));
			servie.addNewOwner(ownerModel, ShopNameId);
			model.addAttribute("ShopNameList", servie.getAllShopNameList());
			model.addAttribute("OwnerNameList", servie.getAllOwnerDetails());

			return new ModelAndView("devloperMaster");
		} else {
			System.out.println("Invalid Admin...");
			model.addAttribute("Message", "First Login Your Account...");
			return new ModelAndView("accessD");
		}
	}

	// adminLogout
	@RequestMapping("adminLogout")
	public ModelAndView LogoutPage(HttpServletRequest request, HttpSession httpSession) {
		System.out.println("Logout Page");
		httpSession = request.getSession();
		String UsName = (String) httpSession.getAttribute("UsernameAdmin");
		System.out.println(UsName + " Session Distroyed..");
		httpSession.invalidate();
		return new ModelAndView("mainLogin");
	}
}
