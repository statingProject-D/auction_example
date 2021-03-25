package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Vector;

public class NoticeMgr {
	private final String JDBC_DRIVER="com.mysql.jdbc.Driver";
	private final String JDBC_URL="jdbc:mysql://localhost:1521/auction"; //�ڱ� db�� �°� ����
	private final String USER="root";
	private final String PASS="1111"; //�ڱ� db�� �°� ����
	public NoticeMgr() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Vector<NoticeBean> getNoticeList(String keyField, String keyWord, int start, int end) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<NoticeBean> vlist = new Vector<NoticeBean>();
		try {
			con = DriverManager.getConnection(JDBC_URL, USER, PASS );
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * from notice order by num desc, pos limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from  notice where " + keyField + " like ? ";
				sql += "order by num desc, pos limit ? , ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				NoticeBean bean = new NoticeBean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));

				vlist.add(bean);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vlist;
	}
	
	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = DriverManager.getConnection(JDBC_URL, USER, PASS );
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select count(num) from notice";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select count(num) from  notice where " + keyField + " like ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
			if(con!=null) try{con.close();} catch(SQLException e){}
			if(rs!=null) try{rs.close();} catch(SQLException e){}
		}
		return totalCount;
	}
	
	public void insertNotice(NoticeBean bean){
		Connection conn=null;
		PreparedStatement pstmt=null;
		Timestamp time= new Timestamp(System.currentTimeMillis());
		int res=0;
		try {
			conn=DriverManager.getConnection(JDBC_URL, USER, PASS );
			String sql= "insert into notice(name,subject,content,regdate) values (?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setString(4, time.toString());
			
			pstmt.executeUpdate();
	  }catch(SQLException e){
		System.out.println(e.getMessage());
		System.out.println("���� ���� ����");
	  }finally{
			if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
			if(conn!=null) try{conn.close();} catch(SQLException e){}
	  }	  
	}
	
	public void upCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DriverManager.getConnection(JDBC_URL, USER, PASS );
			sql = "update notice set count=count+1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
			if(con!=null) try{con.close();} catch(SQLException e){}
		}
	}
	
	public NoticeBean getnotice(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		NoticeBean bean = new NoticeBean();
		try {
			con = DriverManager.getConnection(JDBC_URL, USER, PASS );
			sql = "select * from notice where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("content"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
			if(con!=null) try{con.close();} catch(SQLException e){}
			if(rs!=null) try{rs.close();} catch(SQLException e){}
		}
		return bean;
	}
	
	public void deletNotice(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DriverManager.getConnection(JDBC_URL, USER, PASS );
			sql = "delete from notice where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
			if(con!=null) try{con.close();} catch(SQLException e){}
		}
	}

	public void updateNotice(NoticeBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DriverManager.getConnection(JDBC_URL, USER, PASS );
			sql = "update notice set name=?,subject=?,content=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setInt(4, bean.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
			if(con!=null) try{con.close();} catch(SQLException e){}
		}
	}
	
}
