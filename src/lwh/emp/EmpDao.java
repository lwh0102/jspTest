package lwh.emp;

import java.sql.*;
import java.util.Vector;

public class EmpDao {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public EmpDao() {
	}

	// public void dbConnect() {
	// try {
	// Class.forName("oracle.jdbc.driver.OracleDriver");
	// String url = "jdbc:oracle:thin:@localhost:1521:xe";
	// String user = "hr";
	// String password = "hr";
	//
	// conn = DriverManager.getConnection(url, user, password);
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// }

	public int empAdd(EmpDto empDto) {
		try {
			conn = lwh.db.DBInfo.getConn();
			String sql = "insert into employee values(employee_idx.nextval,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, empDto.getName());
			ps.setString(2, empDto.getEmail());
			ps.setString(3, empDto.getDept());
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				ps.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public int empDelete(EmpDto empDto) {
		try {
			conn = lwh.db.DBInfo.getConn();
			String sql = "delete from employee where name =?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, empDto.getName());
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				ps.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public EmpDto[] empAllSelect() {
		try {
			conn = lwh.db.DBInfo.getConn();
			String sql = "select * from employee";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			Vector<EmpDto> v = new Vector<EmpDto>();
			while (rs.next()) {
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");

				EmpDto temp = new EmpDto(idx, name, email, dept);
				v.add(temp);
			}
			EmpDto[] dtos = new EmpDto[v.size()];
			v.copyInto(dtos);
			return dtos;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public EmpDto empSelect(EmpDto empDto) {
		try {
			conn = lwh.db.DBInfo.getConn();
			String sql = "select * from employee where idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, empDto.getIdx());
			rs = ps.executeQuery();
			if(rs.next()) {
				do{
					int idx = rs.getInt("idx");
					String name = rs.getString("name");
					String email = rs.getString("email");
					String dept = rs.getString("dept");
					empDto = new EmpDto(idx, name, email, dept);			
				} while(rs.next());
			}
			return empDto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public EmpDto empUpdate(EmpDto empDto){
		try{
			conn = lwh.db.DBInfo.getConn();
			String sql = "select * from employee where idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, empDto.getIdx());
			rs = ps.executeQuery();
			
			if(rs.next()){
				do{
					int idx = rs.getInt("idx");
					String name = rs.getString("name");
					String email = rs.getString("email");
					String dept = rs.getString("dept");
					empDto = new EmpDto(idx, name, email, dept);	
				} while(rs.next());
			}
			return empDto;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try{
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public int empUpdate_ok(EmpDto empDto){
		try{
			String sql = "update employee set name=?, email=?, dept=? where idx=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, empDto.getName());
			ps.setString(2, empDto.getName());
			ps.setString(3, empDto.getDept());
			ps.setInt(4, empDto.getIdx());
			
			int count = ps.executeUpdate();
			return count;
		} catch(Exception e) {
			 e.printStackTrace();
			 return -1;
		} finally {
			try{
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
