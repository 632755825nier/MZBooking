package com.nier.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nier.entity.Demo;
import com.nier.service.impl.DemoServiceImpl;

/**
 * 进行前后端的数据交互
 * 注解：类使用@Controller;属性使用@Resource;方法使用@ResourceMapping;有json数据使用@ResponseBody；时间格式化使用@InitBinder
 * 方法返回类型统一使用 String 格式，页面使用RESTFUL格式，且已配置好前缀后缀
 * @author Mr.Z
 *
 */
@Controller("demoCtrl")
@RequestMapping("/hrm/demo")
public class DemoCtrl {
	
	@Resource(name="demoService")
	private DemoServiceImpl demoService;
	
	@RequestMapping("/show")
	public String getAllDemos(Model model) {
		model.addAttribute("demos", demoService.getAllDemos());
		return "demo/show";
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		return "demo/add";
	}
	
	@RequestMapping("/addOK")
	public String addDemo(Model model, Demo demo) {
		demoService.addDemo(demo);
		return getAllDemos(model);
	}
	
	//通过 @PathVariable 可以将 URL 中占位符参数绑定到控制器处理方法的入参中：URL 中的 {xxx} 
	//占位符可以通过@PathVariable(“xxx“) 绑定到操作方法的入参中。
	@RequestMapping("/update/{id}")
	public String getDemoById(Model model, @PathVariable(value="id")Integer id) {
		model.addAttribute("demo", demoService.getDemoById(id));
		return "demo/update";
	}
	
	@RequestMapping("/updateOK")
	public String updateDemo(Model model, Demo demo) {
		demoService.updateDemo(demo);
		return getAllDemos(model);
	}
	
	@RequestMapping("/remove/{id}")
	public String removeDemo(Model model, @PathVariable(value="id")Integer id) {
		demoService.removeDemo(id);
		return getAllDemos(model);
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {  
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
		dateFormat.setLenient(false);  
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));  
	}

}
