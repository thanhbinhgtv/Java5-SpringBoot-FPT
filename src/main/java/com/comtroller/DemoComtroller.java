package com.comtroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.model.Demo;
import com.service.DemoService;

@Controller
public class DemoComtroller {
	@Autowired
	DemoService service;
	
	@RequestMapping("/home")
	public String viewHome(Model model) {
		List<Demo> listDemo = service.listAll();
		model.addAttribute("listDemo1", listDemo);
		return "home";
	}
	@RequestMapping("/new")
	public String newDemo(Model model) {
		Demo demo = new Demo();
		model.addAttribute("demo", demo);
		return "new_demo";
	}
	@PostMapping("/save")
	public String saveDemo(@ModelAttribute("demo1") Demo demo2) {
		service.save(demo2);				// Gọi Thủ Tục Lưu Dữ Liệu
		return "redirect:/home";
	}
	@RequestMapping("/edit/{id}")
		public ModelAndView editDemo(@PathVariable(name="id") int id) {
			ModelAndView mav = new ModelAndView("edit_demo");
			Demo demo = service.get(id); 	// Lấy Về 1 Demo
			mav.addObject("demo", demo);
			return mav;
	}
	@RequestMapping("/delete/{id}")
		public String deleteDemo(@PathVariable(name = "id") int id) {
			service.delete(id);
			return "redirect:/home";
	}
}
