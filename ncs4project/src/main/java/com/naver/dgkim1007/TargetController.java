package com.naver.dgkim1007;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dgkim1007.entities.Member;
import com.naver.dgkim1007.entities.Vender;
import com.naver.dgkim1007.service.MemberDao;
import com.naver.dgkim1007.service.VenderDao;

@Controller 
public class TargetController {
	@RequestMapping(value = "/target", method = RequestMethod.GET)
	public String target(Locale locale, Model model) {
		System.out.println("age:");
		return "test/target";
	}
	@RequestMapping(value = "/bootstrap", method = RequestMethod.GET)
	public String bootstrap(Locale locale, Model model) {
		System.out.println("age:");
		return "test/bootstrap_form";
	}
	
	
	@RequestMapping(value = "/login2", method = RequestMethod.GET)
	public String loginForm2() {
		return "login/login2";
	}
	
	
	
	
	@RequestMapping(value = "/loginForm2", method = RequestMethod.GET)
	public String loginForm2(Locale locale, Model model) {
		System.out.println("age:");
		return "login/loginform2";
	}
	
	@RequestMapping(value = "/login3", method = RequestMethod.GET)
	public String loginForm3() {
		return "login/login3";
	}
	
	
	
	
	@RequestMapping(value = "/loginForm3", method = RequestMethod.GET)
	public String loginForm3(Locale locale, Model model) {
		System.out.println("age:");
		return "login/loginform3";
	}
	
	@RequestMapping(value = "/login4", method = RequestMethod.GET)
	public String loginForm4() {
		return "login/login4";
	}
	
	
	
	
	@RequestMapping(value = "/loginForm4", method = RequestMethod.GET)
	public String loginForm4(Locale locale, Model model) {
		System.out.println("age:");
		return "login/loginform4";
	}
	
	@RequestMapping(value = "/login5", method = RequestMethod.GET)
	public String loginForm5() {
		return "login/login5";
	}
	
	@RequestMapping(value = "/loginForm5", method = RequestMethod.GET)
	public String loginForm5(Locale locale, Model model) {
	
		return "login/loginform5";
	}
	
	@RequestMapping(value = "/login6", method = RequestMethod.GET)
	public String loginForm6() {
		return "login/login6";
	}
	
	@RequestMapping(value = "/loginForm6", method = RequestMethod.GET)
	public String loginForm6(Locale locale, Model model) {
	
		return "login/loginform6";
	}
	
	@RequestMapping(value = "memberInsertForm1", method = RequestMethod.GET)
	public String memberInsertForm() {
		return "login/member_insert1";
	}
	
	@RequestMapping(value = "memberInsert1", method = RequestMethod.GET)
	public String salaryInsert( ) {
	
		return "login/member_insert1";

	}

	@RequestMapping(value = "memberInsertForm2", method = RequestMethod.GET)
	public String memberInsertForm2() {
		return "login/member_insert2";
	}
	
	@RequestMapping(value = "memberInsert2", method = RequestMethod.GET)
	public String memberInsert2( ) {
	
		return "login/member_insert2";

	}
	
	
	@RequestMapping(value = "memberInsertForm3", method = RequestMethod.GET)
	public String memberInsertForm3() {
		return "login/member_insert3";
	}
	
	@RequestMapping(value = "memberInsert3", method = RequestMethod.GET)
	public String memberInsert3( ) {
	
		return "login/member_insert3";

	}
	
	/*@RequestMapping(value = "/login10", method = RequestMethod.GET)
	public String loginForm10() {
		return "login/login10";
	}
	
	@RequestMapping(value = "/loginForm10", method = RequestMethod.GET)
	public String loginForm10(Locale locale, Model model) {
	
		return "login/loginform10";
	}*/
	
	
}
