package com.naver.dgkim1007;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.naver.dgkim1007.entities.Member;
import com.naver.dgkim1007.service.DistributionDao;
import com.naver.dgkim1007.service.MemberDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
    locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class DataSourceTest {
	@Autowired
	private SqlSession sqlSession;
	@Test
    public void testConection()throws Exception{
		MemberDao dao = sqlSession.getMapper(MemberDao.class);  
		DistributionDao disdao = sqlSession.getMapper(DistributionDao.class);  
		ArrayList<Member> members=dao.selectAll();
		String sql = "select count(*) from buy";
		
		try {
		} catch (Exception e) {
			System.out.println("error:"+e.getMessage());
		}
    }


}
