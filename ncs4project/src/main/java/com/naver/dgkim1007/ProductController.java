package com.naver.dgkim1007;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dgkim1007.entities.Product;
import com.naver.dgkim1007.service.ProductDao;

@Controller
public class ProductController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "codeconfirm", method = RequestMethod.POST)
	@ResponseBody
	public int empnoconfirm(@RequestParam String code) {
		ProductDao dao=sqlSession.getMapper(ProductDao.class);
		int result =0;
		
		try {
 			result = dao.codeConfirm(code);
		} catch (Exception e) {
		}
		return result;
	}
	@RequestMapping(value = "productInsertForm", method = RequestMethod.GET)
	public String memberInsertForm() {
		return "product/product_insert";
	}
	
	@RequestMapping(value = "productInsert", method = RequestMethod.POST)
	public ModelAndView salaryInsert( @ModelAttribute("product") Product product) {
		ProductDao dao=sqlSession.getMapper(ProductDao.class);
		int result =0;
		String message = "저장되었습니다.";
		try {
			result = dao.insertRow(product);
		} catch (Exception e) {
			System.out.println("sql error:"+e.getMessage());
		}
		ModelAndView mav = new ModelAndView("product/result_page");
		
		mav.addObject("msg", message);
		return mav;
	}
	@RequestMapping(value = "productListBook", method = RequestMethod.GET)
	public ModelAndView productListBook() {
		ModelAndView mav = new ModelAndView("product/product_listbook");
		ProductDao dao=sqlSession.getMapper(ProductDao.class);
		ArrayList<Product> products = dao.selectAll();
		mav.addObject("products", products);
		return mav;
	}
	@RequestMapping(value = "productUpdateForm", method = RequestMethod.GET)
	public ModelAndView productUpdateForm( @RequestParam String code) {
		ProductDao dao=sqlSession.getMapper(ProductDao.class);
		Product product = null;
		try {
			product = dao.selectOne(code);
		} catch (Exception e) {
			System.out.println("sql error:"+e.getMessage());
		}
		ModelAndView mav = new ModelAndView("product/product_update");
		
		mav.addObject("product", product);
		return mav;
	}
	@RequestMapping(value = "productUpdate", method = RequestMethod.POST)
	public ModelAndView productUpdate( @ModelAttribute("product") Product product) {
		ProductDao dao=sqlSession.getMapper(ProductDao.class);
		int result =0;
		String message = "수정되었습니다.";
		try {
			result = dao.updateRow(product);
		} catch (Exception e) {
			System.out.println("sql error:"+e.getMessage());
		}
		ModelAndView mav = new ModelAndView("product/result_page");
		
		mav.addObject("msg", message);
		return mav;
	}
}
