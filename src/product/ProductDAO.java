package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Vector;

import product.ProductDTO;
import product.TenderDTO;

public class ProductDAO {
	private final String JDBC_Driver="com.mysql.jdbc.Driver";
	private final String JDBC_URL="jdbc:mysql://localhost:3306/auction";
	private final String USER="root";
	private final String PASS="vltlr00";
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public ProductDAO(){}
	
	public void connectDB(){
		try{
			Class.forName(JDBC_Driver);
			conn=DriverManager.getConnection(JDBC_URL,USER,PASS);
		}catch(Exception e){
			System.out.println("에러 : 드라이버 로딩 실패");
		}
	}
	public void closeDB(){
		if(rs!=null){try{rs.close();}catch(SQLException e){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException e){}}
		if(conn!=null){try{conn.close();}catch(SQLException e){}}
	}
	
	
	public int productNew(ProductDTO product){
		connectDB();
		String image;
		String sql="insert into product values(?,?,?,?,?,?,?,?,?,?,?,?)";
		int res=0;
		try{			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, null);
			pstmt.setString(2, product.getProduct_title());
			pstmt.setString(3, product.getProduct_name());
			pstmt.setInt(4, product.getProduct_stprice());
			pstmt.setInt(5, product.getProduct_unit());
			pstmt.setString(6, product.getProduct_date());
			pstmt.setString(7, product.getProduct_memo());
			image=product.getProduct_img1()+"/"+product.getProduct_img2()+"/"+product.getProduct_img3();
			pstmt.setString(8, image);
			pstmt.setString(9, product.getProduct_writer());
			Timestamp time = new Timestamp(System.currentTimeMillis());
			pstmt.setString(10, time.toString());
			pstmt.setInt(11, product.getProduct_stprice());
			pstmt.setInt(12, 1);
			res=pstmt.executeUpdate();
			res=1;
		}catch(SQLException e){
			  e.printStackTrace();
		}finally{
			closeDB();
		}
		return res;
	}
	
	public Vector<ProductDTO> productList(){
		connectDB();
		ProductDTO bean;
		String sql="select * from product where product_status=1";
		Vector<ProductDTO> vecList= new Vector<ProductDTO>();
		try{			
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				 bean = new ProductDTO();
				 bean.setProduct_id(rs.getInt(1));
				 bean.setProduct_name(rs.getString(3));
				 bean.setProduct_now(rs.getInt(11));
				 String image[] = rs.getString("product_img").split("/");
				 bean.setProduct_img1(image[0]);
				 bean.setProduct_status(rs.getInt(12));
				 vecList.add(bean);
			 }
		}catch(SQLException e){
			  e.printStackTrace();
		}finally{
			closeDB();
		}
		return vecList;
	}
	
	public Vector<ProductDTO> product_AllList(){
		connectDB();
		ProductDTO bean;
		String sql="select * from product order by product_status desc";
		Vector<ProductDTO> vecList= new Vector<ProductDTO>();
		try{			
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				 bean = new ProductDTO();
				 bean.setProduct_id(rs.getInt(1));
				 bean.setProduct_name(rs.getString(3));
				 bean.setProduct_now(rs.getInt(11));
				 bean.setProduct_date(rs.getString("product_date"));
				 bean.setProduct_time(rs.getDate("product_time"));
				 bean.setProduct_writer(rs.getString("product_writer"));
				 bean.setProduct_status(rs.getInt(12));
				 vecList.add(bean);
			 }
		}catch(SQLException e){
			  e.printStackTrace();
		}finally{
			closeDB();
		}
		return vecList;
	}
	
	
	public ProductDTO productDetail(int id){
		connectDB();
		ProductDTO bean = new ProductDTO();
		String sql="select * from product where product_id=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setProduct_title(rs.getString("product_title"));
				bean.setProduct_name(rs.getString("product_name"));
				bean.setProduct_now(rs.getInt("product_now"));
				bean.setProduct_time(rs.getDate("product_time"));
				bean.setProduct_unit(rs.getInt("product_unit"));
				bean.setProduct_memo(rs.getString("product_memo"));
				bean.setProduct_date(rs.getString("product_date"));
				bean.setProduct_time(rs.getDate("product_time"));
				bean.setProduct_writer(rs.getString("product_writer"));
				String img[]=rs.getString("product_img").split("/");
				bean.setProduct_img1(img[0]);
				bean.setProduct_img2(img[1]);
				bean.setProduct_img3(img[2]);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return bean;
	}
	
	public int tenderNew(int num, String id, int price){
		connectDB();
		String sql="insert into product_tender values(?,?,?)";
		int res=0;
		try{			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, id);
			pstmt.setInt(3, price);
			res=pstmt.executeUpdate();
			res=1;
		}catch(SQLException e){
			  e.printStackTrace();
		}finally{
			closeDB();
		}
		return res;
	}
	
	public int tenderSearch(int num, String id){
		connectDB();
		String sql = "select * from product_tender where product_tender_num=? and product_tender_id=?";
		int res=0;
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, id);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				res=1;
			}
		}catch(SQLException e){
			  e.printStackTrace();
		}finally{
			closeDB();
		}
		return res;
	}
	
	public int tenderUpdate(int num, String id, int price){
		connectDB();
		String sql="update product_tender set product_tender_price=? where product_tender_num=? and product_tender_id=?";
		int res=0;
		try{			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, price);
			pstmt.setInt(2, num);
			pstmt.setString(3, id);
			res=pstmt.executeUpdate();
			res=1;
		}catch(SQLException e){
			  e.printStackTrace();
		}finally{
			closeDB();
		}
		return res;
	}
	
	public int productUpdate(int num, int price){
		connectDB();
		String sql="update product set product_now=? where product_id=?";
		int res=0;
		try{			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, price);
			pstmt.setInt(2, num);
			res=pstmt.executeUpdate();
			res=1;
		}catch(SQLException e){
			  e.printStackTrace();
		}finally{
			closeDB();
		}
		return res;
	}
	
	public Vector<TenderDTO> tenderList(int num) {
		TenderDTO bean;
		connectDB();
		Vector<TenderDTO> vlist = new Vector<TenderDTO>();
		try{
			String sql = "select * from product_tender where product_tender_num=? order by product_tender_price desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean = new TenderDTO();
				bean.setTender_num(rs.getInt(1));
				bean.setTender_id(rs.getString(2));
				bean.setTender_price(rs.getInt(3));
				vlist.add(bean);
			}
		}catch(SQLException e){
			  e.printStackTrace();
		}finally{
			closeDB();
		}
		return vlist;
	}
	
	public Vector<ProductDTO> mainList(String search){
		connectDB();
		ProductDTO bean;
		Vector<ProductDTO> vlist = new Vector<ProductDTO>();
		String sql = null;
		try{
			if(search!=null){
				if(search.equals("price"))
				{
					sql = "SELECT * FROM auction.product where product_status=1 order by product_now desc";
				}
				else if(search.equals("regdate"))
				{
					sql = "SELECT * FROM auction.product where product_status=1 order by product_id desc";
				}
			}else{
				sql = "SELECT * FROM auction.product where product_status=1 order by product_now desc";
			}
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				bean = new ProductDTO();
				bean.setProduct_id(rs.getInt(1));
				bean.setProduct_name(rs.getString("product_name"));
				bean.setProduct_now(rs.getInt("product_now"));
				String img[]=rs.getString("product_img").split("/");
				bean.setProduct_img1(img[0]);
				vlist.add(bean);
			}
		}catch(SQLException e){
			  e.printStackTrace();
		}finally{
			closeDB();
		}
		return vlist;
	}
	
	public Vector<ProductDTO> auctionEnd(){
		ProductDTO bean;
		connectDB();
		Vector<ProductDTO> vlist = new Vector<ProductDTO>();
		try{
			String sql="SELECT * FROM product where product_status=1";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				bean = new ProductDTO();
				bean.setProduct_id(rs.getInt(1));
				bean.setProduct_date(rs.getString("product_date"));
				bean.setProduct_time(rs.getDate("product_time"));
				vlist.add(bean);
			}
		}catch(SQLException e){
			  e.printStackTrace();
		}finally{
			closeDB();
		}
		return vlist;
	}
	
	public int upEnd(int id){
		int res = 0;
		connectDB();
		try{
			String sql="update product set product_status=0 where product_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			res=pstmt.executeUpdate();
			res=1;
		}catch(SQLException e){
			  e.printStackTrace();
		}finally{
			closeDB();
		}
		return res;
	}
	
	public boolean productDelete(int id){
		boolean result=false;
		connectDB();
		try{
			String sql ="delete from product where product_id=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			result=true;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			closeDB();
		}
	return result;	
	}
	
	public boolean productUpdate(int id){
		boolean result=false;
		connectDB();
		try{
			String sql ="update product set product_status=0 where product_id=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			result=true;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			closeDB();
		}
	return result;	
	}
}
