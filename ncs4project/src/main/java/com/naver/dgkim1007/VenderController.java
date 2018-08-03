package com.naver.dgkim1007;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dgkim1007.entities.Vender;
import com.naver.dgkim1007.service.VenderDao;

@Controller
public class VenderController {
	// 	post open API key : 6d15fd2e44f0b7fb11513144747375
	//  common data API key : bGJOZh5hfpXYyWFbnsRmjo%2B%2BV%2FP0PkO28Sr4lTAZA6XCA6Ub47lvUSchPsCmOKO10aclUH6H8H7U%2FAGuRmqGig%3D%3D
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "venderconfirm", method = RequestMethod.POST)
	@ResponseBody
	public int empnoconfirm(@RequestParam String code) {
		VenderDao dao=sqlSession.getMapper(VenderDao.class);
		int result =0;
		try {
 			result = dao.codeConfirm(code);
		} catch (Exception e) {
		}
		return result;
	}
	@RequestMapping(value = "venderInsertForm", method = RequestMethod.GET)
	public String memberInsertForm() {
		return "vender/vender_insert";
	}
	
	@RequestMapping(value = "venderInsert", method = RequestMethod.POST)
	public ModelAndView salaryInsert( @ModelAttribute Vender vender) {
		VenderDao dao=sqlSession.getMapper(VenderDao.class);
		int result =0;
		String message = "저장되었습니다.";
		try {
			result = dao.insertRow(vender);
		} catch (Exception e) {
			System.out.println("sql error:"+e.getMessage());
		}
		ModelAndView mav = new ModelAndView("vender/result_page");
		
		mav.addObject("msg", message);
		return mav;
	}
	@RequestMapping(value = "venderList", method = RequestMethod.GET)
	public String venderListBook(Model model) {
		VenderDao dao=sqlSession.getMapper(VenderDao.class);
		ArrayList<Vender> venders = dao.selectAll();
		model.addAttribute("venders", venders);
		return "vender/vender_list";
	}
	@RequestMapping(value = "venderUpdateForm", method = RequestMethod.GET)
	public String venderUpdateForm( Model model,@RequestParam String code) {
		VenderDao dao=sqlSession.getMapper(VenderDao.class);
		Vender vender = null;
		try {
			vender = dao.selectOne(code);
			System.out.println("type:"+vender.getBustype());
			System.out.println("conditions:"+vender.getBusconditions());
		} catch (Exception e) {
			System.out.println("sql error:"+e.getMessage());
		}
		model.addAttribute("vender", vender);
		return "vender/vender_update";
	}
	@RequestMapping(value = "venderUpdate", method = RequestMethod.POST)
	public ModelAndView venderUpdate( @ModelAttribute Vender vender) {
		VenderDao dao=sqlSession.getMapper(VenderDao.class);
		int result =0;
		String message = "수정되었습니다.";
		try {
			result = dao.updateRow(vender);
		} catch (Exception e) {
			System.out.println("sql error:"+e.getMessage());
		}
		ModelAndView mav = new ModelAndView("vender/result_page");
		
		mav.addObject("msg", message);
		return mav;
	}
	@RequestMapping(value = "searchZipcode", method = RequestMethod.POST)
	@ResponseBody
	public String searchZipcode( @RequestParam("dong") String dong) {
		final String apiurl = "https://biz.epost.go.kr/KpostPortal/openapi";
        String myApi = "6d15fd2e44f0b7fb11513144747375";
        String target="postNew";
        String countPerPage="20";
        String currentPage="1";
        URL url = null;
        try {
        	StringBuffer sb = new StringBuffer();
            sb.append(apiurl);
            sb.append("?regkey="+myApi+"&target="+target);
            sb.append("&query="+dong);
            sb.append("&countPerPage="+countPerPage);
            sb.append("&currentPage="+currentPage);
            System.out.println("url:"+sb.toString());
            
            url = new URL( sb.toString() );
			URLConnection connection = url.openConnection();
			
			try {
				connection.connect();
			} catch (Exception e) {
				System.out.println("error connection:"+e.getMessage());
			}
            
            System.out.println("connection....:"+connection.getContentLength());
            DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
            byte[] bytes = new byte[4096];
            InputStream in = connection.getInputStream();
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            while(true) {
            	int read = in.read(bytes);
            	if (read < 0) {
            		break;
            	}
            	baos.write(bytes,0,read);
            }
            String xmldata = baos.toString("utf-8");
            System.out.println("------->> xml:"+xmldata);
		} catch (Exception e) {
			System.out.println("error:"+e.getMessage());
		}


	    return "";
	}
	
}
