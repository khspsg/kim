package com.naver.dgkim1007;

import java.io.File;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "locationMap", method = RequestMethod.GET)
	public String locationMap() {
		return "location_map";
	}
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "redirect:index";
	}
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		String[] launchers = null;
		try {
			String path="D:/SOURCE/ncs4project/src/main/webapp/resources/launcherimages";
			File dir = new File(path);
			File[] filelist = dir.listFiles();
			launchers = new String[filelist.length];
			int i =0;
			for( File list: filelist) {
				if(list.isFile()){
					launchers[i]="resources/launcherimages/"+list.getName();
					i++;
				}
			}
		} catch (Exception e) {
		}
		model.addAttribute("launchers", launchers);
		return "index";
	}
	
}
