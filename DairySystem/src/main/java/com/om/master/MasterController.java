package com.om.master;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.om.mastermodel.BaseRate;
import com.om.mastermodel.BaseRateBuffalo;
import com.om.mastermodel.RateChangeModelBuffalo;
import com.om.mastermodel.RateChangeModelCow;

@Controller
public class MasterController {

	@Autowired
	MasterService masterService;

	// ratemasterpage
	@RequestMapping(value = "/RateMasterPageCow")
	public ModelAndView RateMasterPageCow(Model model, HttpServletRequest request, HttpSession httpSession) {
		httpSession = request.getSession();
		String UsName = (String) httpSession.getAttribute("UsernameAdmin");
		if (UsName != null) {
			int ShopId = (int) httpSession.getAttribute("ShopId");
			System.out.println(UsName + " is User shopId is: -> " + ShopId);
			model.addAttribute("pageTitle", "Rate Master Page");
			model.addAttribute("BaseRates", masterService.getGetCurrentBaseRate(ShopId));
			model.addAttribute("AllBaseRates", masterService.getAllBaseRate(ShopId));
			model.addAttribute("ChangedRateCow", masterService.getCurrentChangedRateCow(ShopId));
			model.addAttribute("AllChangedRateCow", masterService.getAllChangedRateCow(ShopId));
			return new ModelAndView("rateMasterCow");
		} else {
			System.out.println("Invalid Admin...");
			model.addAttribute("Message", "First Login Your Account...");
			return new ModelAndView("mainLogin");
		}
	}

	// UpdateBaseRate
	@RequestMapping(value = "/UpdateBaseRate")
	public ModelAndView UpdateBaseRate(Model model, HttpServletRequest request, HttpSession httpSession,
			@ModelAttribute BaseRate baseRate) {
		httpSession = request.getSession();
		String UsName = (String) httpSession.getAttribute("UsernameAdmin");
		if (UsName != null) {
			int ShopId = (int) httpSession.getAttribute("ShopId");
			int rateId = Integer.parseInt(request.getParameter("rateId"));
			masterService.updateBaseRate(ShopId, rateId, baseRate);
			model.addAttribute("pageTitle", "Rate Master Page");
			model.addAttribute("AllBaseRates", masterService.getAllBaseRate(ShopId));
			model.addAttribute("BaseRates", masterService.getGetCurrentBaseRate(ShopId));
			model.addAttribute("ChangedRateCow", masterService.getCurrentChangedRateCow(ShopId));
			model.addAttribute("AllChangedRateCow", masterService.getAllChangedRateCow(ShopId));
			return new ModelAndView("rateMasterCow");
		} else {
			System.out.println("Invalid Admin...");
			model.addAttribute("Message", "First Login Your Account...");
			return new ModelAndView("mainLogin");
		}
	}

	// UpdateChangedRate
	@RequestMapping(value = "/UpdateChangedRate")
	public ModelAndView UpdateChangedRate(Model model, HttpServletRequest request, HttpSession httpSession,
			@ModelAttribute RateChangeModelCow rateChangeModelCow) {
		httpSession = request.getSession();
		String UsName = (String) httpSession.getAttribute("UsernameAdmin");
		if (UsName != null) {
			int ShopId = (int) httpSession.getAttribute("ShopId");
			int id = Integer.parseInt(request.getParameter("changeRateIdCow"));
			masterService.updateChangedRateCow(ShopId, id, rateChangeModelCow);
			model.addAttribute("pageTitle", "Rate Master Page");
			model.addAttribute("AllBaseRates", masterService.getAllBaseRate(ShopId));
			model.addAttribute("BaseRates", masterService.getGetCurrentBaseRate(ShopId));
			model.addAttribute("ChangedRateCow", masterService.getCurrentChangedRateCow(ShopId));
			model.addAttribute("AllChangedRateCow", masterService.getAllChangedRateCow(ShopId));
			return new ModelAndView("rateMasterCow");
		} else {
			System.out.println("Invalid Admin...");
			model.addAttribute("Message", "First Login Your Account...");
			return new ModelAndView("mainLogin");
		}
	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	/// RatemasterpageBuffalo
	@RequestMapping(value = "/RateMasterPageBuffalo")
	public ModelAndView RateMasterPageBuffalo(Model model, HttpServletRequest request, HttpSession httpSession) {
		httpSession = request.getSession();
		String UsName = (String) httpSession.getAttribute("UsernameAdmin");
		if (UsName != null) {
			int ShopId = (int) httpSession.getAttribute("ShopId");
			model.addAttribute("pageTitle", "Rate Master Page");
			model.addAttribute("BaseRatesBuffalo", masterService.getGetCurrentBaseRateOfBuffalo(ShopId));
			model.addAttribute("AllBaseRatesBuffalo", masterService.getAllBaseRatesOfBuffalo(ShopId));
			model.addAttribute("ChangedRateBuffalo", masterService.getCurrentChangedRateBuffalo(ShopId));
			model.addAttribute("AllChangedRateBuffalo", masterService.getAllChangedRateBuffalo(ShopId));
			return new ModelAndView("rateMasterBuffalo");
		} else {
			System.out.println("Invalid Admin...");
			model.addAttribute("Message", "First Login Your Account...");
			return new ModelAndView("mainLogin");
		}
	}

	// UpdateBaseRateBuffalo
	@RequestMapping(value = "/UpdateBaseRateBuffalo")
	public ModelAndView UpdateBaseRateBuffalo(Model model, HttpServletRequest request, HttpSession httpSession,
			@ModelAttribute BaseRateBuffalo baseRateBuffalo) {
		httpSession = request.getSession();
		String UsName = (String) httpSession.getAttribute("UsernameAdmin");
		if (UsName != null) {
			int ShopId = (int) httpSession.getAttribute("ShopId");
			int rateId = Integer.parseInt(request.getParameter("rateId"));
			masterService.updateBaseRateBuffalo(ShopId, rateId, baseRateBuffalo);
			model.addAttribute("pageTitle", "Rate Master Page");
			model.addAttribute("BaseRatesBuffalo", masterService.getGetCurrentBaseRateOfBuffalo(ShopId));
			model.addAttribute("AllBaseRatesBuffalo", masterService.getAllBaseRatesOfBuffalo(ShopId));
			model.addAttribute("ChangedRateBuffalo", masterService.getCurrentChangedRateBuffalo(ShopId));
			model.addAttribute("AllChangedRateBuffalo", masterService.getAllChangedRateBuffalo(ShopId));
			return new ModelAndView("rateMasterBuffalo");
		} else {
			System.out.println("Invalid Admin...");
			model.addAttribute("Message", "First Login Your Account...");
			return new ModelAndView("mainLogin");
		}
	}

	@RequestMapping(value = "/UpdateChangedRateBuffalo")
	public ModelAndView UpdateChangedRateBuffalo(Model model, HttpServletRequest request, HttpSession httpSession,
			@ModelAttribute RateChangeModelBuffalo rateChangeModelBuffalo) {
		httpSession = request.getSession();
		String UsName = (String) httpSession.getAttribute("UsernameAdmin");
		if (UsName != null) {
			int ShopId = (int) httpSession.getAttribute("ShopId");
			//int rateId = Integer.parseInt(request.getParameter("rateId"));
			// masterService.updateBaseRateBuffalo(ShopId,rateId,baseRateBuffalo);
			model.addAttribute("pageTitle", "Rate Master Page");
			model.addAttribute("BaseRatesBuffalo", masterService.getGetCurrentBaseRateOfBuffalo(ShopId));
			model.addAttribute("AllBaseRatesBuffalo", masterService.getAllBaseRatesOfBuffalo(ShopId));
			model.addAttribute("ChangedRateBuffalo", masterService.getCurrentChangedRateBuffalo(ShopId));
			model.addAttribute("AllChangedRateBuffalo", masterService.getAllChangedRateBuffalo(ShopId));
			return new ModelAndView("rateMasterBuffalo");
		} else {
			System.out.println("Invalid Admin...");
			model.addAttribute("Message", "First Login Your Account...");
			return new ModelAndView("mainLogin");
		}
	}
}
