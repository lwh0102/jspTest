package lwh.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

public class BbsDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public int getMaxRef(){
		try{
			String sql = "select max(ref) from jsp_bbs";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			} else {
				return 0;
			}
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			try{
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();

			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

	public int bbsWrite(BbsDTO bbsDTO) {
		try {
			conn = lwh.db.DBInfo.getConn();
			int ref = getMaxRef();
			String sql = "insert into jsp_bbs values(jsp_bbs_idx.nextval,?,?,?,?,sysdate,0,?,0,0)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, bbsDTO.getWriter());
			ps.setString(2, bbsDTO.getPwd());
			ps.setString(3, bbsDTO.getSubject());
			ps.setString(4, bbsDTO.getContent());
			ps.setInt(5, ref+1);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * 수정 관련 메서드
	 * @param ref
	 * @param sunburn
	 */
	public void updateSun(int ref, int sunburn){
		try{
			//conn = yong.db.YongDB.getConn();
			
			String sql ="update jsp_bbs set sunburn = sunburn + 1 where ref=? and sunburn>=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ref);
			ps.setInt(2, sunburn+1);
			ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{
				if (ps != null)
					ps.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * 답변달기 관련 메서드
	 * @param bbsDTO
	 * @return
	 */
	public int bbsReWrite(BbsDTO bbsDTO) {
		try{
			conn = lwh.db.DBInfo.getConn();
			updateSun(bbsDTO.getRef(), bbsDTO.getSunburn());
			String sql = "insert into jsp_bbs values(jsp_bbs_idx.nextval,?,?,?,?,sysdate,0,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, bbsDTO.getWriter());
			ps.setString(2, bbsDTO.getPwd());
			ps.setString(3, bbsDTO.getSubject());
			ps.setString(4, bbsDTO.getContent());
			ps.setInt(5, bbsDTO.getRef());
			ps.setInt(6, bbsDTO.getLev()+1);
			ps.setInt(7, bbsDTO.getSunburn()+1);
			int count = ps.executeUpdate();
			
			return count;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try{
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		} 
	}


	public ArrayList<BbsDTO> bbsList(int cp, int listSize) {
		try {
			conn = lwh.db.DBInfo.getConn();
			//String sql = "select * from jsp_bbs";
			String sql = "select * from ("
					+ "select rownum as rnum, a.* from ("
					+ "select * from jsp_bbs order by ref desc, sunburn asc)a)b "
					+ "where rnum >= ("+cp+"-1) *"+listSize+" + 1 "
							+ "and rnum <= "+cp+"*"+listSize;
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();
			while (rs.next()) {
				int idx = rs.getInt("idx");
				String writer = rs.getString("writer");
				String pwd = rs.getString("pwd");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunburn = rs.getInt("sunburn");
				BbsDTO bdto = new BbsDTO(idx, writer, pwd, subject, content,
						writedate, readnum, ref, lev, sunburn);
				list.add(bdto);
			}
			return list;
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
	/**
	 * 게시글 보기 메서드
	 * @param idx
	 * @return
	 */
	public BbsDTO bbsContent(int idx) {
		try {
			conn = lwh.db.DBInfo.getConn();
			String sql = "select * from jsp_bbs where idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			BbsDTO bdto = null;
			while (rs.next()) {
				idx = rs.getInt("idx");
				String writer = rs.getString("writer");
				String pwd = rs.getString("pwd");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunburn = rs.getInt("sunburn");
				bdto = new BbsDTO(idx, writer, pwd, subject, content,
						writedate, readnum, ref, lev, sunburn);

			}
			return bdto;
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
	/**
	 * 게시글 수정 관련 메서드
	 * @param idx
	 * @param writer
	 * @param pwd
	 * @param subject
	 * @param content
	 * @return
	 */
	public int updateContent(int idx, String writer, String pwd, String subject, String content) {
		try{
			conn = lwh.db.DBInfo.getConn();
				
			String sql2 = "update jsp_bbs set writer=?, pwd=?, subject=?, content=? where idx=?";
			ps = conn.prepareStatement(sql2);
			ps.setString(1, writer);
			ps.setString(2, pwd);
			ps.setString(3, subject);
			ps.setString(4, content);
			ps.setInt(5, idx);
			int count = ps.executeUpdate();
			
			return count;
			
		} catch(Exception e ){
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
	
	
	/**
	 * 게시글 삭제 관련 메서드
	 * @param idx
	 * @return
	 */
	public int deleteContent(int idx) {
		try {
			conn = lwh.db.DBInfo.getConn();
			String sql = "delete from jsp_bbs where idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 총 게시글 수 관련 메서드
	 * @return
	 */
	public int getTotalCnt(){
		try{
			conn = lwh.db.DBInfo.getConn();
			String sql ="select count(*) from jsp_bbs";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count == 0 ? 1: count;
		} catch(Exception e) {
			e.printStackTrace();
			return 1;
		} finally {
			try{
				if (rs != null)
					rs.close();
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
