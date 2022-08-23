package kr.co.nc.web.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.nc.service.RestaurantService;
import kr.co.nc.service.ReviewService;

@Controller
@RequestMapping("/restaurant")
@SessionAttributes("LOGIN_USER")
public class RestaurantController {

	@Autowired
	private RestaurantService restaurantService;
	@Autowired
	private ReviewService reviewService; 
	
	@GetMapping(path="/searchlist")
	public String searchList(@RequestParam(name="keyword",required=false) String keyword, @RequestParam(name="categoryId",required=false) String categoryId,Model model ) {
		
		model.addAttribute("categories",restaurantService.getAllCategories());
		model.addAttribute("cities",restaurantService.getAllCity());
		model.addAttribute("tags",restaurantService.getAlltags());
		model.addAttribute("restaurant",restaurantService.getRestaurantsByCategoryId(categoryId));
		
		return "restaurant/searchlist";
	}
	
	@GetMapping(path = "/detail")
	public String detail(@RequestParam("no") int restaurantNo, String categoryId,Model model) {
		// 변수 따로 만들지 않고 reviews안에 넣었습니다.
		model.addAttribute("restaurant",restaurantService.getRestaurantDetail(restaurantNo));
		model.addAttribute("categoryId",restaurantService.getRestaurantsByCategoryId(categoryId));
		model.addAttribute("review",restaurantService.getRestaurantReview(restaurantNo));

		return "restaurant/detail";
	}
	
	@GetMapping()
	public String home(Model model) {
		model.addAttribute("reviews", reviewService.getLatestRestaurantReviews());
		return "restaurant/home";
	}
}
