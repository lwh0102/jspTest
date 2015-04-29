package lwh.member;

import java.sql.*;
import java.util.*;
import java.util.Date;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public MemberDAO(){
		//dbConnect();
		try{
			conn = lwh.db.DBInfo.getConn();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
//	public void dbConnect(){
//		try{
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			String url = "jdbc:oracle:thin:@localhost:1521:xe";
//			String user = "hr";
//			String password = "hr";			
//			conn = DriverManager.getConnection(url, user, password);
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//	}
	
	public int joinMember(MemberDTO memberDTO){
		try{
			String sql = "insert into jsp_member values("
					+ "jsp_member_idx.nextval, ?, ?, ?, ?, ?, sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, memberDTO.getId());
			ps.setString(2, memberDTO.getName());
			ps.setString(3, memberDTO.getPwd());
			ps.setString(4, memberDTO.getTel());
			ps.setString(5, memberDTO.getAddr());
			
			int count = ps.executeUpdate();
			return count;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	public boolean idCheck(String requestId){
		try{		
			String sql = "select id from jsp_member where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, requestId);
			rs = ps.executeQuery();

			return rs.next();
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

	public ArrayList<MemberDTO> memberFind(String fkey, String fvalue){
		try{
			String sql = "select * from jsp_member where "+ fkey + "=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, fvalue);
			rs = ps.executeQuery();
			ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
			while(rs.next()){
				int idx = rs.getInt("idx");
				String id = rs.getString("id");
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				String tel = rs.getString("tel");
				String addr = rs.getString("addr");
				Date joinDate = rs.getDate("joindate");
				MemberDTO mdto = new MemberDTO(idx, id, name, pwd, tel, addr, joinDate);
				list.add(mdto);
			}
			return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		} finally {
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public int loginCheck(String id, String pwd){
		try{
			String sql = "select count(id) from jsp_member where id=? and pwd=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pwd);
			rs = ps.executeQuery();
			int count = 0;
			if(rs.next()){
				count = count + 1;
			}
			return count;
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public String getUserInfo(String id) {
		try{
			String sql = "select name from jsp_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			String name = null;
			while(rs.next()){
				name = rs.getString("name");
			}
			return name;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
