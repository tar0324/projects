package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class RentcarDAO {
	DataSource ds;
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon() {
		
		try {
			Context initctx = new InitialContext();
			ds = (DataSource)initctx.lookup("java:comp/env/jdbc/pool");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// 자동차를 리턴하는 메소드
	public Vector<CarListBean> getSelectCar(){
		Vector<CarListBean> v = new Vector<>();
		getCon();
		
		try {
			String sql = "select * from rentcar order by no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 0;
			while(rs.next()) {
				CarListBean bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				//벡터에 빈클래스를 저장
				v.add(bean);
				count++;
				if (count > 8) break;
			
			}
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	//카테고리별 자동차 리스트를 저장하는 메소드
	public Vector<CarListBean> getCategoryCar(int cate){
		
		Vector<CarListBean> v = new Vector<>();
		//데이터를 저장할 빈클래스 선언
		CarListBean bean = null;
		
		getCon();
		String sql;
		
		try {
			if(cate == 4) {
				sql = "select * from rentcar";
				pstmt = con.prepareStatement(sql);
			} else {
				sql="select * from rentcar where category=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, cate);
			}
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//데이터를 저장할 빈 클래스 생성
				bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				//벡터에 빈클래스를 저장
				v.add(bean);

			}
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	//모든 차량을 검색하는 메소드
	public Vector<CarListBean> getAllCar(){
		Vector<CarListBean> v = new Vector<>();
		//데이터를 저장할 빈클래스 선언
		CarListBean bean = null;
		
		getCon();
		
		try {
			String sql="select * from rentcar";
			pstmt = con.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//데이터를 저장할 빈 클래스 생성
				bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				//벡터에 빈클래스를 저장
				v.add(bean);

			}
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
		
	}
	
	//하나의 자동차 정보를 리턴하는 메소드
	public CarListBean getOneCar(int no) {
		
		CarListBean bean = new CarListBean();
		getCon();
		
		try {
			String sql = "select * from rentcar where no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs =pstmt.executeQuery();
			if(rs.next()) {
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));

			}
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	//회원 정보가 있는지를 비교
	public int getMember(String id, String pw) {
		int result = 0;  //0이면 회원 없음
		getCon();

		try {
			String sql = "select count(*) from rentcarmember where id=? and pw=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
				
			}
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//하나의 예약 정보를 저장하는 메소드
	public void setReserveCar(CarReserveBean bean) {
		getCon();
		
		try {
			String sql = "insert into carreserve values(reserve_seq.NEXTVAL,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1,bean.getNo());
			pstmt.setString(2, bean.getId());
			pstmt.setInt(3, bean.getQty());
			pstmt.setInt(4, bean.getDday());
			pstmt.setString(5, bean.getRday());
			pstmt.setInt(6, bean.getUsein());
			pstmt.setInt(7, bean.getUsewifi());
			pstmt.setInt(8, bean.getUsenavi());
			pstmt.setInt(9, bean.getUseseat());
			
			pstmt.executeUpdate();
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//회원의 예약정보를 리턴하는 메소드
	public Vector<CarViewBean> getAllReserve(String id){
		Vector<CarViewBean> v = new Vector<>();
		CarViewBean bean = null;
		
		getCon();
		try {
			String sql = "select * from  rentcar c, carreserve r where r.no = c.no and sysdate < to_date(rday, 'YYYY-MM-DD') and r.id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bean =  new CarViewBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setImg(rs.getString(7));
				bean.setQty(rs.getInt(12));
				bean.setRday(rs.getString(14));
				
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	
	}
	
	//회원의 예약한 하나의 차의 예약상세정보
	public CarViewBean getAllReserveInfo(String id, int no) {
		CarViewBean bean = new CarViewBean();;
	
		getCon();
		try {
			String sql = "select * from  rentcar c, carreserve r where r.no = c.no and sysdate < to_date(rday, 'YYYY-MM-DD') and r.id=? and r.no=? ";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setInt(2, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(4));
				bean.setImg(rs.getString(7));
				bean.setQty(rs.getInt(12));
				bean.setDday(rs.getInt(13));
				bean.setRday(rs.getString(14));
				bean.setUsein(rs.getInt(15));
				bean.setUsewifi(rs.getInt(16));
				bean.setUsenavi(rs.getInt(17));
				bean.setUseseat(rs.getInt(18));
				
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	
		
	}
	
	//하나의 예약 삭제
	public void carRemoveReserve(String id, String rday) {
		
		getCon();
		try {
			String sql = "delete from carreserve where id=? and rday=?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, rday);
			
			pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//하나의 새로운 게시글이 넘어와서 저장되는 메소드
	public void insertBoard(BboardBean bean,String id) {
		getCon();
		
		//빈클래스에 넘어오지 않았던 데이터들을 초기화
		int ref=0;
		int re_step= 1; //새글 1부여
		int re_level = 1; //새글 1 부여
		
		try {
			//가장 큰 ref값을 읽어오는 쿼리
			 String refsql = "select max(ref) from bboard";
			 
			 pstmt = con.prepareStatement(refsql);
			 
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
				 ref = rs.getInt(1) + 1; //최대값 +1 을 하여 글그룹을 설정
			 }
			 
			 //게시글 전체값을 테이블에 저장
			 String sql = "insert into bboard values(BBOARD_SEQ.NEXTVAL,?,?,?,sysdate,?,?,?,0,?) ";
			 pstmt = con.prepareStatement(sql);
			 
			 //값매핑
			 pstmt.setString(1, id);
			 pstmt.setString(2, bean.getPw());
			 pstmt.setString(3, bean.getSubject());
			 pstmt.setInt(4, ref);
			 pstmt.setInt(5, re_step);
			 pstmt.setInt(6, re_level);
			 pstmt.setString(7, bean.getContent());
			 
			 pstmt.executeUpdate();
			 
			 con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//전체 게시글을 리턴헤주는 메소드
	public Vector<BboardBean> getAllBboard(int start, int end){
		Vector<BboardBean> v = new Vector<>();
		
		getCon();
		try {
			String sql = "Select * from (select A.*,Rownum Rnum from (select * from bboard order by ref desc, re_step asc)A)"
					+ " where Rnum >= ? and Rnum <= ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BboardBean bean = new BboardBean();
				bean.setNum(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setPw(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setSub_date(rs.getDate(5).toString());
				bean.setRef(rs.getInt(6));
				bean.setRe_step(rs.getInt(7));
				bean.setRe_level(rs.getInt(8));
				bean.setReadcount(rs.getInt(9));
				bean.setContent(rs.getString(10));
				
				
				v.add(bean);
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	//전체글의 갯수를 리턴하는 메소드
	public int getAllCount() {
		getCon();
		//게시글 전체수를 저장하는 변수
		int count = 0;
		try {
			String sql = "select count(*) from bboard";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	//하나의 게시글을 리턴하는 메소드 (BoardInfo용)
	public BboardBean getOneBboard(int num) {
		BboardBean bean = new BboardBean();
		getCon();
		
		try {
			//조회수 증가
			String readsql="update bboard set readcount = readcount + 1 where num=?";
			
			pstmt = con.prepareStatement(readsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			String sql="select * from bboard where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setPw(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setSub_date(rs.getDate(5).toString());
				bean.setRef(rs.getInt(6));
				bean.setRe_step(rs.getInt(7));
				bean.setRe_level(rs.getInt(8));
				bean.setReadcount(rs.getInt(9));
				bean.setContent(rs.getString(10));
				
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	
	//답변글이 저정되는 메소드
	public void reWriteBboard(BboardBean bean, String id) {
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();
		String manager = "Manager🚗";
		String subject = "💬 " + id + "님 답변입니다!";
		String pw = "0000";

		
		getCon();
		
		try {
			//부모글보다 큰 re_level의 값을 전부 1씩 증가시켜줌
			String levelsql = "update bboard set re_level = re_level+1 where ref=? and re_level > ?";
			pstmt = con.prepareStatement(levelsql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			
			//답변글저장
			String sql = "insert into bboard values(BBOARD_SEQ.NEXTVAL,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = con.prepareStatement(sql);
			 
			
			 pstmt.setString(1, manager);
			 pstmt.setString(2, pw);
			 pstmt.setString(3, subject);
			 pstmt.setInt(4, ref);
			 pstmt.setInt(5, re_step + 1); //답글이므로 + 1
			 pstmt.setInt(6, re_level + 1);
			 pstmt.setString(7, bean.getContent());
			 
			 pstmt.executeUpdate();
			 
			 con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//BoardUpdate와 BoardDelete용 하나의 게시글을 리턴하는 메소드
	public BboardBean getUpdateBoard(int num) {
		BboardBean bean = new BboardBean();
		getCon();
		
		try {
			String sql="select * from bboard where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setPw(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setSub_date(rs.getDate(5).toString());
				bean.setRef(rs.getInt(6));
				bean.setRe_step(rs.getInt(7));
				bean.setRe_level(rs.getInt(8));
				bean.setReadcount(rs.getInt(9));
				bean.setContent(rs.getString(10));
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	//패스워드값을 리턴해주는 메소드
	public String getpass(int num) {
		String pass="";
		getCon();
		
		try {
			String sql="select pw from bboard where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			if((rs.next())) {
				pass = rs.getString(1);
			}
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pass;
	}
	
	//하나의 게시글을 수정하는 메소드
	public void updateBboard(BboardBean bean) {
		getCon();
		try {
			String sql = "update bboard set subject=?, content=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNum());
			
			pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//하나의 게시글을 삭제하는 메소드
	public void deleteBboard(int num) {
		getCon();
		
		try {
			String sql="delete from bboard where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeQuery();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//게시물을 제목기준으로 검색
	public Vector<BboardBean> getsearchsub(String searchword) {
		Vector<BboardBean> v = new Vector<>();
		getCon();
		
		try {
			String sql= "select * from bboard where subject like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+new String(searchword.getBytes("8859_1"),"utf-8").toString()+"%"); //한글처리
			
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BboardBean bean = new BboardBean();
				bean.setNum(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setPw(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setSub_date(rs.getDate(5).toString());
				bean.setRef(rs.getInt(6));
				bean.setRe_step(rs.getInt(7));
				bean.setRe_level(rs.getInt(8));
				bean.setReadcount(rs.getInt(9));
				bean.setContent(rs.getString(10));
				
				
				v.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	//게시물을 작성자기준으로 검색
		public Vector<BboardBean> getsearchid(String searchword) {
			Vector<BboardBean> v = new Vector<>();
			getCon();
			
			try {
				String sql= "select * from bboard where id like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+new String(searchword.getBytes("8859_1"),"utf-8").toString()+"%"); //한글처리
				
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					BboardBean bean = new BboardBean();
					bean.setNum(rs.getInt(1));
					bean.setId(rs.getString(2));
					bean.setPw(rs.getString(3));
					bean.setSubject(rs.getString(4));
					bean.setSub_date(rs.getDate(5).toString());
					bean.setRef(rs.getInt(6));
					bean.setRe_step(rs.getInt(7));
					bean.setRe_level(rs.getInt(8));
					bean.setReadcount(rs.getInt(9));
					bean.setContent(rs.getString(10));
					
					
					v.add(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return v;
		}
	
	//한 사람의 회원 정보를 저장해주는 메소드
	public void insertMember(MemberBean bean) {
		getCon();
		
		try {
			String sql = "insert into rentcarmember values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPw());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getTel());
			
			pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	//아이디가 중복되어있는지 체크
	public int checkId(String id) {
		int result=0;
		getCon();
		try {
			String sql="select count(*) from rentcarmember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//제목으로 검색된 게시글의 갯수를 리턴
	public int getSearchCount(String searchword) {
		getCon();
		int count = 0;
		try {
			String sql = "select count(*) from bboard where subject like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+new String(searchword.getBytes("8859_1"),"utf-8").toString()+"%"); //한글처리
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	
	

	
	
}
