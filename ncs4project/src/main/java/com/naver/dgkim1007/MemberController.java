package com.naver.dgkim1007;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.naver.dgkim1007.entities.Member;
import com.naver.dgkim1007.service.MemberDao;

@Controller 
public class MemberController {

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Member member;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
    private JavaMailSender emailSender;

	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "login/login";
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute Member member,HttpSession session) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Member data=dao.login(member.getEmail());

		if(data ==null) {
			return "login/login_fail";
		}else {
			boolean passchk=BCrypt.checkpw(member.getPassword(), data.getPassword());
			if(passchk) {
				session.setAttribute("sessionemail", data.getEmail());
				session.setAttribute("sessionpassword", data.getPassword());
				session.setAttribute("sessionname", data.getName());
				session.setAttribute("sessionphoto", data.getPhoto());
				return "redirect:index";
			}else {
				return "login/login_fail";
			}
		}
	}

	@RequestMapping(value = "/logOut", method = RequestMethod.GET)
	public String logOut(HttpSession session) {
		session.invalidate(); 
		return "redirect:index";
	}
	
	
	@RequestMapping(value = "/emailLossFind", method = RequestMethod.POST)
	@ResponseBody
	public int emailLossFind( String email) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int exists = 0;
		try {
			exists=dao.selectConfirm(email);
		} catch (Exception e) {
		}
		if(exists > 0) {
			Random random = new Random();
			String temppassword=String.format("%04d", random.nextInt(9000));
			String content= "임시비밀번호["+temppassword+ "]";
			String encodingPassword = passwordEncoder.encode(temppassword);
			member.setPassword(encodingPassword);
			member.setEmail(email);
			dao.updatePassword(member);
			sendEmail(email , content);
		}
		return exists;
	}
	
	@RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
	@ResponseBody
	public String emailAuth( @RequestParam String email  ) {
		String authNum = randomNum(); 
		String content= "인증번호["+authNum+ "]";
		sendEmail(email , content);
		return authNum;
	}

	private void sendEmail( String email, String content ) {
		SimpleMailMessage message = new SimpleMailMessage();
		try {
			message.setSubject("itschool 인증번호");
	        message.setText(content);
	        message.setTo(email);
	        message.setFrom("dgkim1007@gmail.com");
	        emailSender.send(message);
		} catch (Exception e) {
			System.out.println("----> error:"+e.getMessage());
		}
	}

	String randomNum() {
		StringBuffer buffer = new StringBuffer();
		for ( int i = 0 ; i <= 6; i++ ){
			int n =  (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}



	@RequestMapping(value = "/memberConfirm", method = RequestMethod.POST)
	@ResponseBody
	public int memberConfirm( @RequestParam String email) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int exists = 0;
		try {
			exists=dao.selectConfirm(email);
		} catch (Exception e) {
		}
		return exists;
	}
	@RequestMapping(value = "/memberInsertForm", method = RequestMethod.GET)
	public String memberInsertForm() {
		return "member/member_insert_form";
	}

	@RequestMapping(value = "/memberInsert", method = RequestMethod.POST)
	public String memberInsert(Model model,@ModelAttribute Member member,@RequestParam CommonsMultipartFile imgfile) {
		String originalname = imgfile.getOriginalFilename();
		String newfilename="";
		String realpath = "";
		if(originalname.equals("")) {
			newfilename = "noimage.png";
			realpath = "resources/images/";
		}else {
			int position = originalname.lastIndexOf(".");
			String ext = originalname.substring(position);
			newfilename = member.getEmail() + ext;
			realpath = "resources/uploadattachs/";
			try {
				String path = "D:/SOURCE/ncs4project/src/main/webapp/resources/uploadattachs/";
				byte bytes[] = imgfile.getBytes();
				BufferedOutputStream output =
						new BufferedOutputStream(new FileOutputStream(path+newfilename));
				output.write(bytes);
				output.flush();
				output.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		member.setPhoto(realpath+newfilename);
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		member.setInputdate(format.format(date));
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		try {
			String encodingPassword = passwordEncoder.encode(member.getPassword());
			member.setPassword(encodingPassword);

			int result=dao.insertRow(member);
			if(result > 0) {
				model.addAttribute("msg", "가입 성공 하였습니다");
			}
		} catch (Exception e) {
		}

		return "member/member_result";
	}

	@RequestMapping(value = "/memberSearch", method = RequestMethod.GET)
	public String memberSearch(Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ArrayList<Member> members=dao.selectAll();
		model.addAttribute("members",members);
		return "member/member_search";
	}
	@RequestMapping(value = "/memberUpdateForm", method = RequestMethod.GET)
	public String memberUpdateForm(Model model,@RequestParam String email) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Member member = dao.selectOne(email);
		String encodingPassword = passwordEncoder.encode(member.getPassword());
		member.setPassword(encodingPassword);
		model.addAttribute("member",member);
		return "member/member_update_form";
	}
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(@ModelAttribute Member member,@RequestParam CommonsMultipartFile imgfile) {
		String originalname = imgfile.getOriginalFilename();
		String newfilename="";
		String realpath = "";

		if(originalname.equals("")) {
			member.setPhoto(member.getBeforephoto());
		}else {
			int position = originalname.lastIndexOf(".");
			String ext = originalname.substring(position);
			newfilename = member.getEmail() + ext;
			realpath = "resources/uploadattachs/";
			try {
				String path = "D:/SOURCE/ncs4project/src/main/webapp/resources/uploadattachs/";
				member.setPhoto(realpath+newfilename);
				byte bytes[] = imgfile.getBytes();
				BufferedOutputStream output =
						new BufferedOutputStream(new FileOutputStream(path+newfilename));
				output.write(bytes);
				output.flush();
				output.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		try {
			int result=dao.updateRow(member);
		} catch (Exception e) {
		}
		return "member/member_result";
	}

	@RequestMapping(value = "/memberDelete", method = RequestMethod.GET)
	public String memberDelete(Model model,@RequestParam String email) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int result=dao.deleteRow(email);
		if(result > 0) {
			model.addAttribute("msg", "삭제 되었습니다");
		}
		return "member/member_result";
	}
	
	
	
	
	

	
}








