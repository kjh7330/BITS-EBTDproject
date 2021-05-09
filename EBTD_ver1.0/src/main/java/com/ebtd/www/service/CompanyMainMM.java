package com.ebtd.www.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.CompanyJoinBean;
import com.ebtd.www.dao.DriverDao;
import com.ebtd.www.dao.ICompanyDao;
import com.ebtd.www.dao.I_BusDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class CompanyMainMM {
	
	ModelAndView mav;
	
	@Autowired
	private I_BusDao bDao;

	@Autowired
	private DriverDao dDao;

	@Autowired
	private ICompanyDao cDao;

	
	
	
	
	
	public ModelAndView getRecommandedStopList () throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		mav.addObject("sList", om.writeValueAsString(bDao.getStopList()));
		mav.addObject("tList", om.writeValueAsString(bDao.getTownList()));
		mav.setViewName("/join"); // .jsp
		return mav;
	}

	public int carNumberDupCheck(int ab_no) {
		return dDao.carNumberDupCheck(ab_no);
	}

	@Transactional
	public ModelAndView join(Map<String, String> data) {
		mav = new ModelAndView();
		CompanyJoinBean cjb = new CompanyJoinBean();
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		
		try{
			cjb.setC_password( pwdEncoder.encode( data.get("c_password") ) );
			cjb.setC_username( data.get("c_username") );
			cjb.setC_no( data.get("c_no").toString() );
			//company insert
			System.out.println(" insert into c values ('"+cjb.getC_username()+"', '"+cjb.getC_username()+"', '"+cjb.getC_password()+"', '"+cjb.getC_no()+"', null, 0); ");
			cDao.companyJoin(cjb);
			//official document insert
			System.out.println("insert into od values('"+cjb.getC_username()+"', "+cjb.getOd_no()+");");
			cDao.official_document_insert(cjb);
			//get  max(ap_no)+1
			Integer aa = cDao.get_ap_no();
			cjb.setAp_no( aa == null ? 100000 : aa );
			cjb.setOd_no(100002);
			// driver insert
			for( int i = 1; i <= Integer.parseInt(data.get("new_line_size") ) ; i++ ) {
				cjb.setB_no(data.get("bus_no_"+i));
				System.out.println(" insert into b values('"+cjb.getB_no()+"', '"+cjb.getC_username()+"' );");
				cDao.bus_insert(cjb);
				System.out.println("insert into ap values("+cjb.getAp_no()+", '"+cjb.getB_no()+"', '"+cjb.getC_username()+"', sysdate, 0, null, 100002, null);");
				cDao.apply_insert(cjb);
				cjb.setOd_no(100003);
				
				
				for( int j = 1 ; j <= Integer.parseInt(data.get("s_no_size_"+i) ) ; j++  ) {
					//apply detail insert
					cjb.setApde_turn(j);
					cjb.setS_no(Integer.parseInt(data.get("s_no_"+i+"_"+j)));
					System.out.println("insert into apde values("+cjb.getAp_no()+", '"+cjb.getB_no()+"', "+cjb.getApde_turn()+", "+cjb.getS_no()+");");
					cDao.apply_detail_insert(cjb);
				}
				for ( int j = 1; j <= Integer.parseInt(data.get("new_line_car_size_"+i) ) ; j++ ) {
					//all bus insert
					cjb.setAb_no(data.get("car_no_"+i+"_"+j));
					cjb.setAb_type(Integer.parseInt(data.get("is_low_"+i+"_"+j)));
					System.out.println("insert into ab values( '"+cjb.getAb_no()+"', '"+cjb.getB_no()+"', null, null, 0, 0, "+cjb.getAb_type()+", 0, null );");
					cDao.all_bus_insert(cjb);
				}
				
			}
			Integer dd = cDao.get_d_no();
			int d_no = dd == null ? 100000:dd;
			for( int i = 1; i <= Integer.parseInt(data.get("driver_cnt")) ; i++ ) {
				cjb.setD_no(d_no++);
				cjb.setD_name(data.get("d_name_"+i));
				cjb.setD_phonenum(data.get("d_phoneNum_"+i));
				cjb.setD_enterdate(data.get("d_enterDate_"+i));
				cjb.setD_b_no(data.get("d_b_no_"+i));
				System.out.println("insert into d values ( "+cjb.getD_no()+", '"+cjb.getC_username()+"', '"+cjb.getD_name()+"', null, '"+cjb.getD_phonenum()+"', '"+cjb.getD_enterdate()+"', '"+cjb.getD_b_no()+"' )");
				cDao.driver_insert(cjb);
			}
			
			
			cDao.update_od_no(cjb);
			
			mav.setViewName("redirect:/loginForm");
			System.out.println("신규 회사 등록 트랜잭션 성공");
		}
		catch(Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//바로 롤백되지 않고 문제가 생기면 커밋되기 직전에 롤백됨.
			System.out.println("신규 회사 등록 트랜잭션 실패");
			mav.setViewName("/join");
		}
		
		return mav;
		
	}
	
}
