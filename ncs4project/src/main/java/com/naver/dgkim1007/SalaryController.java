package com.naver.dgkim1007;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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

import com.naver.dgkim1007.entities.Dept;
import com.naver.dgkim1007.entities.Salary;
import com.naver.dgkim1007.entities.SalaryRoll;
import com.naver.dgkim1007.service.SalaryDao;

@Controller
public class SalaryController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private SalaryRoll salaryroll;
	
	@RequestMapping(value = "empnoconfirm", method = RequestMethod.POST)
	@ResponseBody
	public int empnoconfirm(@RequestParam String empno) {
		SalaryDao dao=sqlSession.getMapper(SalaryDao.class);
		int result =0;
		
		try {
 			result = dao.empnoConfirm(empno);
		} catch (Exception e) {
		}
		return result;
	}
	@RequestMapping(value = "salaryInsertForm", method = RequestMethod.GET)
	public String memberInsertForm(Model model) {
		SalaryDao dao=sqlSession.getMapper(SalaryDao.class);
		ArrayList<Dept> depts =dao.selectAllDept();
		model.addAttribute("depts", depts);
		return "salary/salary_insert_form";
	}
	@RequestMapping(value = "salaryInsert", method = RequestMethod.POST)
	public String salaryInsert( Model model,@ModelAttribute Salary salary) {
		SalaryDao dao=sqlSession.getMapper(SalaryDao.class);
		int result =0;
		String message = "저장되었습니다.";
		
		result = dao.insertRow(salary);
		model.addAttribute("msg", message);
		return "salary/result_page";
	}
	@RequestMapping(value = "salaryList", method = RequestMethod.GET)
	public ModelAndView salarsalaryListyInsert() {
		SalaryDao dao=sqlSession.getMapper(SalaryDao.class);
		
		ArrayList<Salary> salarys=dao.selectAll();
		
		ModelAndView mav = new ModelAndView("salary/salary_list");
		mav.addObject("salarys",salarys);
		return mav;
	}
	
	
	@RequestMapping(value = "salaryUpdateForm", method = RequestMethod.GET)
	public ModelAndView salaryUpdateForm(@RequestParam String empno) {
		SalaryDao dao=sqlSession.getMapper(SalaryDao.class);
		Salary salary=dao.selectOne(empno);
		ModelAndView mav = new ModelAndView("salary/salary_update");
		mav.addObject("salary", salary);
		return mav;
	}
	@RequestMapping(value = "salaryUpdate", method = RequestMethod.POST)
	public ModelAndView salaryUpdate(@ModelAttribute("salary") Salary salary) {
		SalaryDao dao=sqlSession.getMapper(SalaryDao.class);
		int result = dao.updateRow(salary);
		String message = "수정되었습니다.";
		if(result <1 )
			message="수정 되지 않았습니다.";
		ModelAndView mav = new ModelAndView("salary/result_page");
		mav.addObject("msg", message);
		return mav;
	}
	
	@RequestMapping(value = "salaryDelete", method = RequestMethod.POST)
	public String salaryDelete(@RequestParam("unitchk")	List<String> unitchks) {
		SalaryDao dao=sqlSession.getMapper(SalaryDao.class);
		for(String unit: unitchks) {
			dao.deleteRow(unit);
		}
		return "redirect:salaryList";
	}
	@RequestMapping(value = "salaryTaxForm", method = RequestMethod.GET)
	public String salaryTaxForm(Model model) {
		Calendar cal = Calendar.getInstance();
		int yyyy = cal.get(Calendar.YEAR);
		model.addAttribute("yyyy", yyyy+"");
		return "salary/salary_tax";
	}
	
	@RequestMapping(value = "salaryTax", method = RequestMethod.POST)
	public String salaryTax(@RequestParam String yyyy,@RequestParam String mm) {
		SalaryDao dao=sqlSession.getMapper(SalaryDao.class);
		mm = String.format("%02d", Integer.parseInt(mm));
		HashMap rollkey = new HashMap();
		rollkey.putIfAbsent("yyyy", yyyy);
		rollkey.putIfAbsent("mm", mm);
		dao.salaryrollDelete( rollkey );
		
		ArrayList<Salary> salarys = dao.selectAllForNew();
		for(Salary salary:salarys) {
			salaryroll.setYyyy(yyyy);
			salaryroll.setMm(mm);
			salaryroll.setEmpno(salary.getEmpno());
			salaryroll.setDept(salary.getDept());
			salaryroll.setName(salary.getName());
			salaryroll.setPartner(salary.getPartner());
			salaryroll.setDependent20(salary.getDependent20());
			salaryroll.setDependent60(salary.getDependent60());
			salaryroll.setDisabled(salary.getDisabled());
			salaryroll.setWomanpower(salary.getWomanpower());
			int specialdeduction=0;
			int pay12 = (salary.getPay() + salary.getExtra())*12;
			salaryroll.setPay12(pay12);
			
			int incomededuction =0;
			if(pay12 <5000001) {
				incomededuction = (int) (pay12 * 0.7);
			}else if(pay12 < 15000001) {
				incomededuction = (int) (3500000 + ( (pay12 - 5000000) * 0.4));
			}else if(pay12 < 45000001) {
				incomededuction = (int) (7500000 + ( (pay12 - 15000000) * 0.15));
			}else if(pay12 < 100000001) {
				incomededuction = (int) (12000000 + ( (pay12 - 45000000) * 0.05));
			}else {
				incomededuction = (int) (14750000 + ( (pay12 - 100000000) * 0.02));
			}
			salaryroll.setIncomededuction(incomededuction);
			salaryroll.setIncomeamount(pay12 - incomededuction);
			
			int deducount = 1 + salary.getPartner() + (salary.getDependent20()*2) + salary.getDependent60()
			              + salary.getDisabled() + salary.getWomanpower();
			
			int personaldeduction = deducount * 1500000;
			salaryroll.setPersonaldeduction(personaldeduction);
			int annuityinsurance = 0;
			annuityinsurance = (int) ((salary.getPay() + salary.getExtra()) * 0.001);
			annuityinsurance = annuityinsurance * 1000;
			annuityinsurance = (int) (annuityinsurance * 0.045);
			annuityinsurance = annuityinsurance * 12;
			if(annuityinsurance <135001)
				annuityinsurance = 135000;
			if(annuityinsurance >2149200)
				annuityinsurance = 2149200;
			
			salaryroll.setAnnuityinsurance(annuityinsurance);
			
			if(deducount == 1) {
				if(pay12 < 30000001) {
					specialdeduction= (int) (3100000 + (pay12 * 0.04));
				}else if(pay12 > 30000000 && pay12 < 45000001) {
					specialdeduction= (int) ( 3100000 + (pay12 * 0.04)
							- ((pay12 - 30000000)*0.05));
				}else if(pay12 > 45000000 && pay12 < 70000001) {
					specialdeduction= (int) (3100000 + (pay12 * 0.015));
				}else if(pay12 > 70000000 && pay12 < 120000001) {
					specialdeduction= (int) (3100000 + (pay12 * 0.005));
				}
			}else if(deducount == 2) {
				if(pay12 < 30000001) {
					specialdeduction= (int) (3600000 + (pay12 * 0.04));
				}else if(pay12 > 30000000 && pay12 < 45000001) {
					specialdeduction= (int) ( 3600000 + (pay12 * 0.04)
							- ((pay12 - 30000000)*0.05));
				}else if(pay12 > 45000000 && pay12 < 70000001) {
					specialdeduction= (int) (3600000 + (pay12 * 0.02));
				}else if(pay12 > 70000000 && pay12 < 120000001) {
					specialdeduction= (int) (3600000 + (pay12 * 0.01));
				}
			}else{
				if(pay12 < 30000001) {
					specialdeduction= (int) (5000000 + (pay12 * 0.07));
				}else if(pay12 > 30000000 && pay12 < 45000001) {
					specialdeduction= (int) ( 5000000 + (pay12 * 0.07)
							- ((pay12 - 30000000)*0.05));
				}else if(pay12 > 45000000 && pay12 < 70000001) {
					specialdeduction= (int) (5000000 + (pay12 * 0.05));
				}else if(pay12 > 70000000 && pay12 < 120000001) {
					specialdeduction= (int) (5000000 + (pay12 * 0.03));
				}
				specialdeduction += (pay12 - 40000000)*0.04;
			}
			salaryroll.setSpecialdeduction(specialdeduction);
			
			int standardamount = pay12 -(incomededuction + personaldeduction 
					+ specialdeduction + annuityinsurance);
			salaryroll.setStandardamount(standardamount);
			
			int calculatedtax = 0;
			
			if(standardamount<12000001) {
				calculatedtax = (int) (standardamount * 0.06);
			}else if(standardamount<46000001) {
				calculatedtax = (int) (720000 + ((standardamount - 12000000) * 0.15));
			}else if(standardamount<88000001) {
				calculatedtax = (int) (5820000 + ((standardamount - 46000000) * 0.24));
			}else if(standardamount<150000001) {
				calculatedtax = (int) (15900000 + ((standardamount - 88000000) * 0.35));
			}else {
				calculatedtax = (int) (37600000 + ((standardamount - 150000000) * 0.38));
			}
			salaryroll.setCalculatedtax(calculatedtax);
			int incometaxdeduction = 0;
			if(calculatedtax < 500001) {
				incometaxdeduction = (int) (calculatedtax * 0.55); 
			}else {
				incometaxdeduction = (int) (275000 + ((calculatedtax - 500000) * 0.3)); 
				if(pay12 < 55000001 )
					incometaxdeduction = Math.min(incometaxdeduction, 660000);
				else if( pay12 > 55000000 && pay12< 70000001)
					incometaxdeduction = Math.min(incometaxdeduction, 630000);
				else if(pay12 > 70000000)
					incometaxdeduction = Math.min(incometaxdeduction, 500000);
			}
			
			salaryroll.setIncometaxdeduction(incometaxdeduction);
			int decidedtax = calculatedtax - incometaxdeduction;
			int simpletax = decidedtax / 12;
			simpletax = (int) (simpletax * 0.01);
			simpletax = simpletax * 100;
			salaryroll.setDecidedtax(decidedtax);
			salaryroll.setSimpletax(simpletax);
			dao.salaryrollInsertRow(salaryroll);
		}
		return "redirect:index";
	}
	@RequestMapping(value = "salaryrollList", method = RequestMethod.GET)
	public String salaryrollList(Model model,@RequestParam String yyyy,@RequestParam String mm) {
		SalaryDao dao=sqlSession.getMapper(SalaryDao.class);
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		if(mm.equals(""))
			mm = "0";
		mm = String.format("%02d", Integer.parseInt(mm));
	    String date = sm.format(new Date());
	    yyyy = yyyy.replace(" ", "");
	    
	    if(yyyy.equals("")) {
	    	yyyy = date.substring(0, 4);
	    	mm = date.substring(5, 7);
	    }else {
	    }
	    System.out.println("yyyy:"+yyyy);
	    System.out.println("mm:"+mm);
	    HashMap yyyymm = new HashMap();
		yyyymm.putIfAbsent("yyyy", yyyy);
		yyyymm.putIfAbsent("mm", mm);
		ArrayList<SalaryRoll> rolls=null;
		try {
			rolls=dao.salaryrollList(yyyymm);
		} catch (Exception e) {
			System.out.println("sql error:"+e.getMessage());
		}
		model.addAttribute("yyyy", yyyy);
		model.addAttribute("mm", mm);
		model.addAttribute("rolls", rolls);
		return "salary/salaryroll_list";
	}
}
