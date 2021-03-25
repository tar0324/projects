package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	DataSource dataSource;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon() {
		try {
			Context initctx = new InitialContext();
			dataSource = (DataSource)initctx.lookup("java:comp/env/jdbc/pool");
			
			con = dataSource.getConnection();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	//전체 게시글의 갯수를 리턴하는 메소드
	public int getAllCount() {
		int count = 0;
		getCon();
		try {
			String sql = "select count(*) from board";
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
	
	//모든 게시글을 리턴해주는 메소드(최신순으로 10개씩)
	public Vector<BoardBean> getAllBoard(int startRow, int endRow){
		Vector<BoardBean> v = new Vector<>();
		
		getCon();
		try {
			String sql="Select * from (select A.*,Rownum Rnum from (select * from board order by ref desc, re_step asc)A)"
					+ "where Rnum >= ? and Rnum <= ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setSubject(rs.getString(3));
				bean.setPassword(rs.getString(4));
				bean.setReg_date(rs.getDate(5).toString());
				bean.setRef(rs.getInt(6));
				bean.setRe_step(rs.getInt(7));
				bean.setRe_level(rs.getInt(8));
				bean.setReadcount(rs.getInt(9));
				bean.setContent(rs.getString(10));
				
				//패키징한 데이터를 벡터에 저장
				v.add(bean);
			}
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	//하나의 게시글을 저장하는 메소드
	public void insertBoard(BoardBean bean) {
		getCon();
		int ref = 0;
		int re_step=1;
		int re_level=1;
		try {
			String refsql = "select max(ref) from board";
			pstmt = con.prepareStatement(refsql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ref = rs.getInt(1) + 1; //가장 큰값에 1을 더해줌
			}
			
			//데이터를 삽입하는 쿼리
			String sql="insert into board values(board_seq.NEXTVAL,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,bean.getWriter());
			pstmt.setString(2,bean.getSubject());
			pstmt.setString(3,bean.getPassword());
			pstmt.setInt(4, ref);
			pstmt.setInt(5, re_step);
			pstmt.setInt(6, re_level);
			pstmt.setString(7,bean.getContent());
			
			pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//하나의 게시글의 상세내용(조회수 증가도 파악)
	public BoardBean getOneBoard(int num) {
		getCon();
		BoardBean bean = null;
		
		try {
			//조회수
			String countsql = "update board set readcount = readcount + 1 where num=?";
			pstmt = con.prepareStatement(countsql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
			//게시글 내용
			String sql = "select * from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setSubject(rs.getString(3));
				bean.setPassword(rs.getString(4));
				bean.setReg_date(rs.getDate(5).toString());
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
	
	//답변글을 저장하는 메소드
	public void reInsertBoard(BoardBean bean) {
		getCon();
		int ref = bean.getRef();
		int re_step= bean.getRe_step();
		int re_level= bean.getRe_level();
		try {
			String levelsql = "update board set re_level = re_level + 1 where ref=? and re_level > ?";
			pstmt = con.prepareStatement(levelsql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			rs = pstmt.executeQuery();
			
			
			//데이터를 삽입하는 쿼리
			String sql="insert into board values(board_seq.NEXTVAL,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,bean.getWriter());
			pstmt.setString(2,bean.getSubject());
			pstmt.setString(3,bean.getPassword());
			pstmt.setInt(4, ref);
			pstmt.setInt(5, re_step + 1); //기존 부모글에 스텝보다 1을 증가
			pstmt.setInt(6, re_level + 1);//기존 부모글에 레벨보다 1을 증가
			pstmt.setString(7,bean.getContent());
			
			pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//수정할때 하나의 게시글을 리턴하기
	public BoardBean getOneUpdateBoard(int num) {
		getCon();
		BoardBean bean = null;
		
		try {
			
			String sql = "select * from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setSubject(rs.getString(3));
				bean.setPassword(rs.getString(4));
				bean.setReg_date(rs.getDate(5).toString());
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
	//하나의 게시글을 수정하는 메소드
	public void UpdateBoard(int num, String subject, String content) {
		getCon();
		try {
			String sql = "update board set subject=? , content=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, num);
			
			pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//하나의 게시글을 삭제하는 메소드
	public void deleteBoard(int num) {
		getCon();
		try {
			String sql="delete from board where num=?";
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
