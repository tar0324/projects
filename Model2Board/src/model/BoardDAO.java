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
	
	//��ü �Խñ��� ������ �����ϴ� �޼ҵ�
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
	
	//��� �Խñ��� �������ִ� �޼ҵ�(�ֽż����� 10����)
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
				
				//��Ű¡�� �����͸� ���Ϳ� ����
				v.add(bean);
			}
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	//�ϳ��� �Խñ��� �����ϴ� �޼ҵ�
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
				ref = rs.getInt(1) + 1; //���� ū���� 1�� ������
			}
			
			//�����͸� �����ϴ� ����
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
	
	//�ϳ��� �Խñ��� �󼼳���(��ȸ�� ������ �ľ�)
	public BoardBean getOneBoard(int num) {
		getCon();
		BoardBean bean = null;
		
		try {
			//��ȸ��
			String countsql = "update board set readcount = readcount + 1 where num=?";
			pstmt = con.prepareStatement(countsql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
			//�Խñ� ����
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
	
	//�亯���� �����ϴ� �޼ҵ�
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
			
			
			//�����͸� �����ϴ� ����
			String sql="insert into board values(board_seq.NEXTVAL,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,bean.getWriter());
			pstmt.setString(2,bean.getSubject());
			pstmt.setString(3,bean.getPassword());
			pstmt.setInt(4, ref);
			pstmt.setInt(5, re_step + 1); //���� �θ�ۿ� ���ܺ��� 1�� ����
			pstmt.setInt(6, re_level + 1);//���� �θ�ۿ� �������� 1�� ����
			pstmt.setString(7,bean.getContent());
			
			pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//�����Ҷ� �ϳ��� �Խñ��� �����ϱ�
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
	//�ϳ��� �Խñ��� �����ϴ� �޼ҵ�
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
	
	//�ϳ��� �Խñ��� �����ϴ� �޼ҵ�
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
