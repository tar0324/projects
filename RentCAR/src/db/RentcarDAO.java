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
	
	//최신순 3대의 자동차를 리턴하는 메소드
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
			String sql = "select * from rentcar natural join carreserve "
					+ "where sysdate < to_date(rday,'YYYY-MM-DD') AND id= ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bean =  new CarViewBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setImg(rs.getString(7));
				bean.setQty(rs.getInt(11));
				bean.setRday(rs.getString(13));
				
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
			String sql = "select * from rentcar natural join carreserve "
					+ "where sysdate < to_date(rday,'YYYY-MM-DD') AND id= ? AND no=? ";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setInt(2, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(4));
				bean.setImg(rs.getString(7));
				bean.setQty(rs.getInt(11));
				bean.setDday(rs.getInt(12));
				bean.setRday(rs.getString(13));
				bean.setUsein(rs.getInt(14));
				bean.setUsewifi(rs.getInt(15));
				bean.setUsenavi(rs.getInt(16));
				bean.setUseseat(rs.getInt(17));
				
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
	
	
	
	
	
}
