package com.naver.dgkim1007;

import java.awt.Font;
import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.chart.labels.PieSectionLabelGenerator;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.dgkim1007.entities.Balance;
import com.naver.dgkim1007.entities.Buy;
import com.naver.dgkim1007.entities.BuySearchBean;
import com.naver.dgkim1007.entities.Payment;
import com.naver.dgkim1007.entities.Product;
import com.naver.dgkim1007.entities.Vender;
import com.naver.dgkim1007.service.BuyDao;
import com.naver.dgkim1007.service.DistributionDao;
import com.naver.dgkim1007.service.PaymentDao;
import com.naver.dgkim1007.service.ProductDao;
import com.naver.dgkim1007.service.VenderDao;

@Controller
public class DistributionController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Buy buy;
	@Autowired
	private Payment payment;
	@Autowired
	private Product product;
	@Autowired
	private BuySearchBean buysearchbean;
	
	@RequestMapping(value = "buyNew", method = RequestMethod.POST)
	@ResponseBody
	public Buy buyNew( @RequestParam String vendcode) {
		BuyDao dao=sqlSession.getMapper(BuyDao.class);
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());
		buy.setVendcode(vendcode);
		buy.setYyyy(date.substring(0, 4));
		buy.setMm(date.substring(5,7));
		buy.setDd(date.substring(8,10));
		buy.setNo(dao.selectSequenceNo(buy));
		buy.setHang(1);
		return buy;
	}
	@RequestMapping(value = "paymentNew", method = RequestMethod.POST)
	@ResponseBody
	public Payment paymentNew( @RequestParam String vendcode) {
		PaymentDao dao=sqlSession.getMapper(PaymentDao.class);
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());
		payment.setVendcode(vendcode);
		payment.setYyyy(date.substring(0, 4));
		payment.setMm(date.substring(5,7));
		payment.setDd(date.substring(8,10));
		payment.setNo(dao.selectSequenceNo(payment));
		payment.setHang(1);
		return payment;
	}
	@RequestMapping(value = "productSelected", method = RequestMethod.POST)
	@ResponseBody
	public Product productSelected( @RequestParam String productcode) {
		ProductDao dao=sqlSession.getMapper(ProductDao.class);
		product = dao.selectOne(productcode);
		return product;
	}
	@RequestMapping(value = "buyInsertForm", method = RequestMethod.GET)
	public String buyInsertForm(Model model, @ModelAttribute("buy") Buy buy
			, @ModelAttribute("buys") ArrayList<Buy> buys,
			@ModelAttribute("redirectchk") String redirectchk) {
		
		ProductDao prodao=sqlSession.getMapper(ProductDao.class);
		VenderDao vendao=sqlSession.getMapper(VenderDao.class);
		BuyDao buydao=sqlSession.getMapper(BuyDao.class);
		ArrayList<Product> products = prodao.selectAll();
		ArrayList<Vender> venders = vendao.selectAll();
		HashMap buysearch = new HashMap(); 
		buysearch.put("vendcode", buy.getVendcode());
		buysearch.put("yyyy", buy.getYyyy());
		buysearch.put("mm", buy.getMm());
		buysearch.put("dd", buy.getDd());
		if(redirectchk.equals("insert")) {
			buys = buydao.selectBuySearchRollup(buysearch);
		} 
		model.addAttribute("products", products);
		model.addAttribute("venders", venders);
		model.addAttribute("buy",buy);
		model.addAttribute("buys",buys);
		
		return "distribution/buy_insert";
	}
	
	@RequestMapping(value = "buyInsert", method = RequestMethod.POST)
	public String buyInsert(Model model,@ModelAttribute Buy buy,final RedirectAttributes redirectAttributes) {
		BuyDao dao=sqlSession.getMapper(BuyDao.class);
		ProductDao prodao=sqlSession.getMapper(ProductDao.class);
		DistributionDao disdao = sqlSession.getMapper(DistributionDao.class);
		
		dao.insertRow(buy);
		buy.setProcolumn("buy"+buy.getMm());
		prodao.buyProductAdd(buy);
		
		buy.setDealcolumn("deal"+buy.getMm());
		buy.setBalancecolumn("balance"+buy.getMm());
		disdao.buyBalanceAdd(buy);
		
		buy.setHang(buy.getHang() + 1);
		redirectAttributes.addFlashAttribute("buy", buy);
		redirectAttributes.addFlashAttribute("redirectchk", "insert");
		return "redirect:buyInsertForm";
	}
	
	@RequestMapping(value = "buySearch", method = RequestMethod.GET)
	public String buySearch(Model model,@ModelAttribute("buysearchbean") BuySearchBean buysearchbean,
			RedirectAttributes redirectAttributes) {
		BuyDao dao=sqlSession.getMapper(BuyDao.class);
		HashMap buysearch = new HashMap(); 
		buysearch.put("vendcode", buysearchbean.getSearchvender());
		buysearch.put("yyyy", buysearchbean.getSearchyyyy());
		buysearch.put("mm", String.format("%02d", Integer.parseInt(buysearchbean.getSearchmm())));
		buysearch.put("dd", String.format("%02d", Integer.parseInt(buysearchbean.getSearchdd())));
		ArrayList<Buy> buys;
		if(buysearchbean.getSearchdd().equals("0")) {
			buys = dao.selectBuySearchRollupMM(buysearch);
		}else {
			buys = dao.selectBuySearchRollup(buysearch);
		}
		redirectAttributes.addFlashAttribute("buys", buys);
		redirectAttributes.addFlashAttribute("redirectchk", "search");
		return "redirect:buyInsertForm";
	}
	
	@RequestMapping(value = "buyDetail", method = RequestMethod.POST)
	@ResponseBody
	public Buy buyDetail( @RequestParam int seq) {
		BuyDao dao=sqlSession.getMapper(BuyDao.class);
		buy = dao.selectRow(seq);
		return buy;
	}
	@RequestMapping(value = "buyUpdate", method = RequestMethod.POST)
	public String buyUpdate( @ModelAttribute Buy buy, RedirectAttributes redirectAttributes) {
		BuyDao dao=sqlSession.getMapper(BuyDao.class);
		ProductDao prodao=sqlSession.getMapper(ProductDao.class);
		DistributionDao disdao = sqlSession.getMapper(DistributionDao.class);
		buysearchbean.setSearchvender(buy.getVendcode());
		buysearchbean.setSearchyyyy(buy.getYyyy());
		buysearchbean.setSearchmm(buy.getMm());
		buysearchbean.setSearchdd(buy.getDd());
		dao.updateRow(buy);
		
		buy.setProcolumn("buy"+buy.getMm());
		prodao.buyProductStockSub(buy);
		prodao.buyProductAdd(buy);
		
		buy.setDealcolumn("deal"+buy.getMm());
		buy.setBalancecolumn("balance"+buy.getMm());
		try {
			disdao.buyBalanceSub(buy);
		} catch (Exception e) {
			System.out.println("error:"+e.getMessage());
		}
		
		disdao.buyBalanceAdd(buy);
		
		redirectAttributes.addFlashAttribute("buysearchbean", buysearchbean);
		return "redirect:buySearch";
	}
	
	
	@RequestMapping(value = "buyDelete", method = RequestMethod.POST)
	public String buyDelete( @ModelAttribute Buy buy, RedirectAttributes redirectAttributes) {
		BuyDao dao=sqlSession.getMapper(BuyDao.class);
		ProductDao prodao=sqlSession.getMapper(ProductDao.class);
		DistributionDao disdao = sqlSession.getMapper(DistributionDao.class);
		
		
		buysearchbean.setSearchvender(buy.getVendcode());
		buysearchbean.setSearchyyyy(buy.getYyyy());
		buysearchbean.setSearchmm(buy.getMm());
		buysearchbean.setSearchdd(buy.getDd());
		
		dao.deleteRow(buy);
		buy.setProcolumn("buy"+buy.getMm());
		prodao.buyProductStockSub(buy);
		
		buy.setDealcolumn("deal"+buy.getMm());
		buy.setBalancecolumn("balance"+buy.getMm());
		disdao.buyBalanceSub(buy);
		
		redirectAttributes.addFlashAttribute("buysearchbean", buysearchbean);
		return "redirect:buySearch";
	}
	
	@RequestMapping(value = "balanceList", method = RequestMethod.GET)
	public String balanceList( Model model,@RequestParam String yyyy ) {
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
	    String date = sm.format(new Date());
	    yyyy = yyyy.replace(" ", "");
	    
	    if(yyyy.equals("")) {
	    	yyyy = date.substring(0, 4);
	    }else {
	    }
		
		DistributionDao dao=sqlSession.getMapper(DistributionDao.class);
		ArrayList<Balance> balances=dao.balanceListYYYY(yyyy);
		model.addAttribute("balances", balances);
		return "distribution/balance_list";
	}
	
	@RequestMapping(value = "balanceDetail", method = RequestMethod.GET)
	public String balanceDetail(Model model,@RequestParam String yyyy,@RequestParam String vendcode) {
		HashMap balancekey = new HashMap();
		balancekey.put("yyyy", yyyy);
		balancekey.put("vendcode", vendcode);
		DistributionDao dao=sqlSession.getMapper(DistributionDao.class);
		Balance balance = dao.balanceSelectOne(balancekey);
		model.addAttribute(balance); 
		return "distribution/balance_detail";
	}
	
	@RequestMapping(value = "paymentInsertForm", method = RequestMethod.GET)
	public String paymentInsertForm(Model model, @ModelAttribute("payment") Payment payment
			,@ModelAttribute("payments") ArrayList<Payment> payments) {
		VenderDao vendao=sqlSession.getMapper(VenderDao.class);
		ArrayList<Vender> venders = vendao.selectAll();
		model.addAttribute("venders", venders);
		
		model.addAttribute("payments", payments);
		return "distribution/payment_insert";
	}
	
	@RequestMapping(value = "paymentInsert", method = RequestMethod.POST)
	public String paymentInsert(Model model,@ModelAttribute Payment payment,RedirectAttributes redirectAttributes) {
		PaymentDao dao=sqlSession.getMapper(PaymentDao.class);
		DistributionDao disdao = sqlSession.getMapper(DistributionDao.class);
		
		dao.insertRow(payment);
		payment.setPaywaycolumn(payment.getPayway()+payment.getMm());
		payment.setBalancecolumn("balance"+payment.getMm());
		disdao.paymentBalanceAdd(payment); 
		
		payment.setHang(payment.getHang() + 1);
		redirectAttributes.addFlashAttribute("payment", payment);
		ArrayList<Payment> payments=dao.selectPaymentSearchRollup(payment);
		redirectAttributes.addFlashAttribute("payments", payments);
		return "redirect:paymentInsertForm";
	}
	
	@RequestMapping(value = "paymentDetail", method = RequestMethod.POST)
	@ResponseBody
	public Payment paymentDetail( @RequestParam int seq) {
		PaymentDao dao=sqlSession.getMapper(PaymentDao.class);
		payment = dao.selectRow(seq);
		return payment;
	}
	
	@RequestMapping(value = "paymentSearch", method = RequestMethod.GET)
	public String paymentSearch(Model model,@ModelAttribute Payment payment,
			RedirectAttributes redirectAttributes) {
		PaymentDao dao=sqlSession.getMapper(PaymentDao.class);
		payment.setMm(String.format("%02d", Integer.parseInt(payment.getMm())));
		payment.setDd(String.format("%02d", Integer.parseInt(payment.getDd())));
		ArrayList<Payment> payments;
		payments = dao.selectPaymentSearchRollup(payment);
		redirectAttributes.addFlashAttribute("payments", payments);
		return "redirect:paymentInsertForm";
	}
	
	@RequestMapping(value = "paymentUpdate", method = RequestMethod.POST)
	public String paymentUpdate(Model model,@ModelAttribute Payment payment) {
		PaymentDao dao=sqlSession.getMapper(PaymentDao.class);
		DistributionDao disdao = sqlSession.getMapper(DistributionDao.class);
		
		String setmm = String.format("%02d", Integer.parseInt(payment.getMm()));
		String setdd = String.format("%02d", Integer.parseInt(payment.getDd()));
		payment.setMm(setmm);
		payment.setDd(setdd);
		dao.updateRow(payment);
		payment.setBeforepaywaycolumn(payment.getBeforepayway()+setmm);
	
		payment.setBalancecolumn("balance"+setmm);
		payment.setPaywaycolumn(payment.getPayway()+setmm);
		disdao.paymentBalanceSub(payment);
		disdao.paymentBalanceAdd(payment);
		
		return "redirect:paymentInsertForm";
	}
	
	@RequestMapping(value = "balanceUpdate", method = RequestMethod.POST)
	public String balanceUpdate( @ModelAttribute Balance balance , RedirectAttributes redirectAttributes) {
		DistributionDao dao=sqlSession.getMapper(DistributionDao.class);
		dao.balanceUpdate(balance);
		redirectAttributes.addAttribute("yyyy", "");
		return "redirect:balanceList";
	}
	@RequestMapping(value = "jfreeChart", method = RequestMethod.GET)
	public String jfreeChart(Model model) {
		String chartpath="";
		final DefaultPieDataset data=new DefaultPieDataset();
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
	    String date = sm.format(new Date());
	    String	yyyy = date.substring(0, 4);
	   
		DistributionDao dao=sqlSession.getMapper(DistributionDao.class);
		ArrayList<Balance> balances=dao.balanceListYYYY(yyyy);
		for(Balance balance:balances) {
			data.setValue(balance.getVendname(), balance.getDealtot());
		}
		
		JFreeChart chart=
				ChartFactory.createPieChart("Pie Chart",data,true,true,true);
		chart.getTitle().setFont(new Font ("굴림",Font.BOLD,15));
		chart.getLegend().setItemFont(new Font ("굴림",Font.TRUETYPE_FONT,12));
		PiePlot plot=(PiePlot) chart.getPlot();
		plot.setLabelFont(new Font("굴림",Font.TRUETYPE_FONT,12));
		
		PieSectionLabelGenerator  gen = new StandardPieSectionLabelGenerator("{0}: {1} ({2})", new DecimalFormat("0"), new DecimalFormat("0%"));
	      plot.setLabelGenerator(gen);
		
		try {
			final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
			
			final File file = new File("D:/SOURCE/ncs4project/src/main/webapp/resources/jfreechart/piechart.png");
			chartpath = "resources/jfreechart/" + file.getName();
			ChartUtilities.saveChartAsJPEG(file, chart, 600, 400, info);
			model.addAttribute("chartpath", chartpath);
		} catch (Exception e) {
			System.out.println("Chart error:" + e.getMessage());
		}
		return "distribution/jfreechart_view";
	}
	
	
}
