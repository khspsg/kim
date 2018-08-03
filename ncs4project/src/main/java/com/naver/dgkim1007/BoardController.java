package com.naver.dgkim1007;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dgkim1007.entities.Board;
import com.naver.dgkim1007.entities.BoardPaging;
import com.naver.dgkim1007.service.BoardDao;

@Controller 
public class BoardController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Board board;
	@Autowired
	private BoardPaging boardpaging;
	static String find;
	
	@RequestMapping(value = "/boardInsertForm", method = RequestMethod.GET)
	public String boardInsertForm() {
		return "board/board_insert_form";
	}
	@RequestMapping(value = "/boardInsert", method = RequestMethod.POST)
	public String boardInsert(@ModelAttribute Board board,@RequestParam CommonsMultipartFile file
								,HttpServletRequest request) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		String path = "D:/ncs4webproject/ncs4project/src/main/webapp/resources/uploadfiles/";
		String realpath = "resources/uploadfiles/";
		String originalname = file.getOriginalFilename();
		String filetime = System.currentTimeMillis()+"";
		if(!originalname.equals("")) {
			try {
				byte bytes[] = file.getBytes();
				BufferedOutputStream output =
						new BufferedOutputStream(new FileOutputStream(path+filetime+"_"+originalname));
				output.write(bytes);
				output.flush();
				output.close();
				board.setB_attach(realpath+filetime+"_"+originalname);
			} catch (Exception e) {
				System.out.println("file err:"+e.getMessage());
			}
		}
		board.setB_ip(request.getRemoteAddr());
			//run > runconfigurations > argurments > vm-arguraments append > -Djava.net.preferIPv4Stack=true
		    //sts restart : because to ip
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		board.setB_date(format.format(date));
		dao.insertRow(board);
		
		return "board/board_insert_form";
	}
	@RequestMapping(value = "/boardPageList", method = RequestMethod.GET)
	public String boardPageList(Model model,String find) {
		if(find == null) find = "";
		this.find = find;
		int pagesize = 10;
		int startrow = 0;
		int endrow = startrow + pagesize;
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		boardpaging.setFind(find);
		boardpaging.setStartrow(startrow);
		boardpaging.setEndrow(endrow);
		ArrayList<Board> boards =dao.pageList(boardpaging);
		int rowcount= dao.selectRowCount(find);
		int absPage = 1;
		if(rowcount % pagesize == 0)
			absPage = 0;
		int pageCount = rowcount / pagesize + absPage;
		int[] pages = new int[pageCount];
		for(int i = 0; i < pageCount ; i++) {
			pages[i] = i+1;
		}
		model.addAttribute("boards",boards);
		model.addAttribute("pages",pages);
		return "board/board_page_list";
	}
	
	@RequestMapping(value = "/boardPageListSelected", method = RequestMethod.GET)
	public String boardPageList(Model model,int page) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class); 
		
		int pagesize = 10;
		int startrow = (page - 1) * pagesize;
		int endrow = pagesize;
		
		boardpaging.setFind(find);
		boardpaging.setStartrow(startrow);
		boardpaging.setEndrow(endrow);
		ArrayList<Board> boards =dao.pageList(boardpaging);
		int rowcount= dao.selectRowCount(find);
		int absPage = 1;
		if(rowcount % pagesize == 0)
			absPage = 0;
		int pageCount = rowcount / pagesize + absPage;
		int[] pages = new int[pageCount];
		for(int i = 0; i < pageCount ; i++) {
			pages[i] = i+1;
		}
		model.addAttribute("boards",boards);
		model.addAttribute("pages",pages);
		return "board/board_page_list";
	}
	
	@RequestMapping(value = "/boardDetail", method = RequestMethod.GET)
	public String boardDetail(Model model,HttpSession session,@RequestParam int b_seq) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		Board board=dao.selectOne(b_seq);
		if(!board.getB_email().equals(session.getAttribute("sessionemail"))) {
			dao.updateHit(b_seq);
		} 
		model.addAttribute("board",board);
		
		return "board/board_detail";
	}
	
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(@ModelAttribute Board board,@RequestParam CommonsMultipartFile file) {
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		String path = "D:/ncs4webproject/ncs4project/src/main/webapp/resources/uploadfiles/";
		String realpath = "resources/uploadfiles/";
		String originalname = file.getOriginalFilename();
		String filetime = System.currentTimeMillis()+"";
		if(!originalname.equals("")) {
			try {
				byte bytes[] = file.getBytes();
				BufferedOutputStream output =
						new BufferedOutputStream(new FileOutputStream(path+filetime+"_"+originalname));
				output.write(bytes);
				output.flush();
				output.close();
				board.setB_attach(realpath+filetime+"_"+originalname);
			} catch (Exception e) {
				System.out.println("file err:"+e.getMessage());
			}
		}else {
			board.setB_attach(board.getB_beforeattach());
		}
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		board.setB_date(format.format(date));
		dao.updateRow(board);
		return "redirect:boardPageList";
	}
	@RequestMapping(value = "/boardDownload", method = RequestMethod.GET)
	 public ModelAndView boardDownload(@RequestParam String b_attach) {
		String path="D:/ncs4webproject/ncs4project/src/main/webapp/";
		File file = new File(path+b_attach); 
		return new ModelAndView("download","downloadFile",file);
	 }
	
	@RequestMapping(value = "/boardReplyForm", method = RequestMethod.GET)
	public String boardReplyForm(Model model,HttpSession session,@RequestParam int b_seq,@RequestParam String b_title) {
		board.setB_email((String) session.getAttribute("sessionemail"));
		board.setB_name((String) session.getAttribute("sessionname"));
		board.setB_seq(b_seq);
		board.setB_title("[댓글] "+b_title);
		model.addAttribute("board",board);
		return "board/board_reply_form";
	}
	
	@RequestMapping(value = "/boardReplyInsert", method = RequestMethod.POST)
	public String boardReplyInsert(@ModelAttribute Board board,@RequestParam CommonsMultipartFile file
								,HttpServletRequest request) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		String path = "D:/ncs4webproject/ncs4project/src/main/webapp/resources/uploadfiles/";
		String realpath = "resources/uploadfiles/";
		String originalname = file.getOriginalFilename();
		String filetime = System.currentTimeMillis()+"";
		if(!originalname.equals("")) {
			try {
				byte bytes[] = file.getBytes();
				BufferedOutputStream output =
						new BufferedOutputStream(new FileOutputStream(path+filetime+"_"+originalname));
				output.write(bytes);
				output.flush();
				output.close();
				board.setB_attach(realpath+filetime+"_"+originalname);
			} catch (Exception e) {
				System.out.println("file err:"+e.getMessage());
			}
		}
		board.setB_ip(request.getRemoteAddr());
			//run > runconfigurations > argurments > vm-arguraments append > -Djava.net.preferIPv4Stack=true
		    //sts restart : because to ip
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		board.setB_date(format.format(date));
		dao.insertReplyRow(board);
		return "redirect:boardPageList";
	}
	@RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam int b_seq,@RequestParam int b_ref) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		if(b_seq == b_ref) {
			dao.deleteRowref(b_ref);
		}else {
			dao.deleteRowseq(b_seq);
		}
		return "redirect:boardPageList";
	}

}
