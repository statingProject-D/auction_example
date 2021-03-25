package member;
import java.sql.*;
import java.util.*;

import product.ProductDTO;

public class MemberMgr {

	private final String JDBC_DRIVER="com.mysql.jdbc.Driver";
	private final String JDBC_URL="jdbc:mysql://localhost:1521/auction"; //�ڱ� db�� �°� ����
	private final String USER="root";
	private final String PASS="1111"; //�ڱ� db�� �°� ����
	
	public MemberMgr() {
		try{
			Class.forName(JDBC_DRIVER);
		}catch(Exception e){
			System.out.println("���� : ����̹� �ε� ����");
		}
	}
	public MemberBean getMemberList(String id) {
		  Connection conn=null;
		  PreparedStatement pstmt=null;
		  ResultSet rs=null;
		  MemberBean bean= new MemberBean();
		  try {
				 conn=DriverManager.getConnection(JDBC_URL, USER, PASS );

				 String sql= "select * from member where mem_id=?";
				 pstmt=conn.prepareStatement(sql);
				 pstmt.setString(1,id);
				 rs=pstmt.executeQuery();
				 if(rs.next()){
					 bean.setPhone2(rs.getString("mem_phone").substring(4,8));
					 bean.setPhone3(rs.getString("mem_phone").substring(9,13));
					 String address[] = rs.getString("mem_address").split("/");
					 bean.setAddress1(address[0]);
					 bean.setAddress2(address[1]);
					 bean.setMem_email(rs.getString("mem_email"));
				 }
		  }catch(SQLException e){
			  System.out.println("select * from member��񿡼� �������� ����");
		  }finally{
			  if(rs!=null){try{rs.close();}catch(SQLException e){}}
			  if(pstmt!=null){try{pstmt.close();}catch(SQLException e){}}
			  if(conn!=null){try{conn.close();}catch(SQLException e){}}
		  }
		  return bean;
	}
	/*MemberBean->mysql�� �� �Ѱ���, member�� ���� �� ����*/
	public int insertMember(MemberBean bean){
		  Connection conn=null;
		  PreparedStatement pstmt=null;
		  Timestamp time= new Timestamp(System.currentTimeMillis());
		  String birth;
		  String phone;
		  String address;
		  int res=0;
		  try {
			  conn=DriverManager.getConnection(JDBC_URL, USER, PASS );
			  String sql= "insert into member values(?,?,?,?,?,?,?,?,?,?,?)";
			  pstmt=conn.prepareStatement(sql);
			  pstmt.setString(1, bean.getMem_id());
			  pstmt.setString(2, bean.getMem_password());
			  pstmt.setString(3, bean.getMem_name());
			  pstmt.setString(4, bean.getMem_sex());
			  birth=bean.getYear()+"-"+bean.getMonth()+"-"+bean.getDay();
			  pstmt.setString(5, birth);
			  phone=bean.getPhone1()+"-"+bean.getPhone2()+"-"+bean.getPhone3();
			  pstmt.setString(6, phone);
			  pstmt.setString(7, bean.getMem_email());
			  address=bean.getAddress1()+"/"+bean.getAddress2();
			  pstmt.setString(8, address);
			  pstmt.setString(9, time.toString());
			  pstmt.setString(10, bean.getMem_key());
			  pstmt.setInt(11, 0);
			  pstmt.executeUpdate();
			  res=1;
		  }catch(SQLException e){
			System.out.println(e.getMessage());
			System.out.println("���� ���� ����");
		  }finally{
				if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
				if(conn!=null) try{conn.close();} catch(SQLException e){}
		  }	  
		  return res;
	}
	/*
	 * ������¥:11�� 15��
	 */
	/*id�� bean��ü�� ���ڷ� �Ͽ� id�� DB�� mem_id ���� ���� member�� ���� ����*/
	public void updateMember(MemberBean bean, String id){
		Connection conn=null;
		PreparedStatement pstmt=null;
		String birth;
		String phone;
		String address;
		try{
			conn=DriverManager.getConnection(JDBC_URL, USER, PASS );
			String sql="update member set mem_password=?,  mem_phone=?, mem_email=?, "
					+ "mem_address=? where mem_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bean.getMem_password());
			phone=bean.getPhone1()+"-"+bean.getPhone2()+"-"+bean.getPhone3();
			address=bean.getAddress1()+"/"+bean.getAddress2();
				
			pstmt.setString(2, phone);
			pstmt.setString(3, bean.getMem_email());
			pstmt.setString(4, address);
			pstmt.setString(5, id);
			pstmt.executeUpdate();
		}catch(SQLException e){
			System.out.println("������Ʈ ���� ����");
		}finally{
			if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
			if(conn!=null) try{conn.close();} catch(SQLException e){}
		}
		
	}
	
	public int loginCheck(String id, String pw){
		int result=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			conn=DriverManager.getConnection(JDBC_URL, USER, PASS );
			
			String sql ="select * from member where mem_id=? and mem_password=?";
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				if(rs.getInt("mem_value")==1){
					result=1;
				}else if(rs.getInt("mem_value")==0){
					result=2;
				}
			}else{
				result=0;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
			if(conn!=null) try{conn.close();} catch(SQLException e){}
		}
		return result;
	}
	

	public int checkId(String id){
		int result=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			conn=DriverManager.getConnection(JDBC_URL, USER, PASS );
			String sql ="select * from member where mem_id=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				result=1;
			}else{
				result=0;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null){try{rs.close();}catch(SQLException e){}}
			if(pstmt!=null){try{pstmt.close();}catch(SQLException e){}}
			if(conn!=null){try{conn.close();}catch(SQLException e){}}
		}
		return result;
	}
	
	
	
	
	public boolean mailck(String id, String key){
		boolean result=false;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			conn=DriverManager.getConnection(JDBC_URL, USER, PASS );
			
			String sql ="select * from member where mem_id=? and mem_key=?";
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, key);
			
			rs=pstmt.executeQuery();
			result=rs.next();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
			if(conn!=null) try{conn.close();} catch(SQLException e){}
		}
		return result;
	}
	
	
	public void upvalue(String id){
		boolean result=false;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			conn=DriverManager.getConnection(JDBC_URL, USER, PASS );
			
			String sql ="update member set mem_value=? where mem_id=?";
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setInt(1, 1);
			pstmt.setString(2, id);
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
			if(conn!=null) try{conn.close();} catch(SQLException e){}
		}
	}
	
	
	public Vector<MemberBean> getAdminList() {
		MemberBean bean;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<MemberBean> vlist = new Vector<MemberBean>();
		try {
			con = DriverManager.getConnection(JDBC_URL, USER, PASS );
			sql = "select * from member where mem_id!='admin'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new MemberBean();
				bean.setMem_id(rs.getString(1));
				bean.setMem_password(rs.getString(2));
				bean.setMem_name(rs.getString(3));
				bean.setMem_sex(rs.getString(4));
				String birth[]=rs.getString("mem_birth").split("-");
				bean.setYear(birth[0]);
				bean.setMonth(birth[1]);
				bean.setDay(birth[1]);
				String phone[]=rs.getString("mem_phone").split("-");
				bean.setPhone1(phone[0]);
				bean.setPhone2(phone[1]);
				bean.setPhone3(phone[2]);
			
				bean.setMem_email(rs.getString(7));
				
				String address[] = rs.getString("mem_address").split("/");
				bean.setAddress1(address[0]);
				bean.setAddress2(address[1]);
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vlist;
	}
	
	public boolean memberDelete(String id){
		boolean result=false;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			conn=DriverManager.getConnection(JDBC_URL, USER, PASS );
			
			String sql ="delete from member where mem_id=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			result=true;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
			if(conn!=null) try{conn.close();} catch(SQLException e){}
		}
	return result;	
	}
	
	
	public Vector<ProductDTO> getMyProductList_Buy(String id) {
		  Connection conn=null;
		  PreparedStatement pstmt=null;
		  ResultSet rs=null;
		  ProductDTO bean;
		  Vector<ProductDTO> vlist= new Vector<ProductDTO>();
		  try {
				 conn=DriverManager.getConnection(JDBC_URL, USER, PASS );

				 String sql= "select * from product where product_writer=?";
				 pstmt=conn.prepareStatement(sql);
				 pstmt.setString(1,id);
				 rs=pstmt.executeQuery();
				 while(rs.next()){
					 bean = new ProductDTO();
					 bean.setProduct_id(rs.getInt(1));
					 bean.setProduct_name(rs.getString(3));
					 bean.setProduct_now(rs.getInt(11));
					 bean.setProduct_status(rs.getInt(12));
					 vlist.add(bean);
				 }
		  }catch(SQLException e){
			 e.printStackTrace();
		  }finally{
			  if(rs!=null){try{rs.close();}catch(SQLException e){}}
			  if(pstmt!=null){try{pstmt.close();}catch(SQLException e){}}
			  if(conn!=null){try{conn.close();}catch(SQLException e){}}
		  }
		  return vlist;
	}

	public Vector<ProductDTO> getMyProductList_Sell(String id) {
		  Connection conn=null;
		  PreparedStatement pstmt=null;
		  ResultSet rs=null;
		  ProductDTO bean;
		  Vector<ProductDTO> vlist= new Vector<ProductDTO>();
		  try {
				 conn=DriverManager.getConnection(JDBC_URL, USER, PASS );

				 String sql= "select * from product E, product_tender D where E.product_id = D.product_tender_num and product_tender_id=? order by product_time desc";
				 pstmt=conn.prepareStatement(sql);
				 pstmt.setString(1,id);
				 rs=pstmt.executeQuery();
				 while(rs.next()){
					 bean = new ProductDTO();
					 bean.setProduct_id(rs.getInt(1));
					 bean.setProduct_name(rs.getString(3));
					 bean.setProduct_now(rs.getInt("product_now"));
					 bean.setProduct_status(rs.getInt("product_status"));
					 bean.setProduct_myvalue(rs.getInt("product_tender_price"));
					 vlist.add(bean);
				 }
		  }catch(SQLException e){
			 e.printStackTrace();
		  }finally{
			  if(rs!=null){try{rs.close();}catch(SQLException e){}}
			  if(pstmt!=null){try{pstmt.close();}catch(SQLException e){}}
			  if(conn!=null){try{conn.close();}catch(SQLException e){}}
		  }
		  return vlist;
	}
}
