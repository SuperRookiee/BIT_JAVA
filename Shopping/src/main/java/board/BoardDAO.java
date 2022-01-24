package board;

import java.sql.*;
import java.util.*;


public class BoardDAO {
	//singleton으로 생성자 반환
	private static BoardDAO vo = new BoardDAO();
	private BoardDAO() {
		
	}
	public static BoardDAO getInstance() {
		return vo;
	}
	
	public Connection getConnection() {
		//DB 연결 객체 반환
		Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/scottdb?useSSL=false";
        String id = "scott";
        String pw = "tiger";
 
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
 
            conn = DriverManager.getConnection(url, id, pw);
 
            return conn;
        } catch (Exception e) {
           
        }
        return null;
	}
	
	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			conn.close();
			pstmt.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	} // 연결 닫기
	public void close(Connection conn, PreparedStatement pstmt) {
		try {
			conn.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} // 연결 닫기
	
	
	public List<BoardVO> selectBoardItems(String items, String text){
		List<BoardVO> list = new  ArrayList<BoardVO>();
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM Boards WHERE "+items+" like concat( '%', ? , '%')  ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, text);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int boardNo = rs.getInt(1);
				String userId = rs.getString(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				String regDate = rs.getString(5);
				int hit = rs.getInt(6);
				BoardVO vo = new BoardVO(boardNo,userId,title,content,regDate,hit);
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return list;
		
	}
	
	public List<BoardVO> selectBoardAll(){
		//게시글 전체 목록 반환
		List<BoardVO> list = new  ArrayList<BoardVO>();
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM Boards");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int boardNo = rs.getInt(1);
				String userId = rs.getString(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				String regDate = rs.getString(5);
				int hit = rs.getInt(6);
				BoardVO vo = new BoardVO(boardNo,userId,title,content,regDate,hit);
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, pstmt, rs);
		}		return list;
		
	}
	public BoardVO selectBoard(Integer boardNo){
		//특정 게시글 정보 반환
		BoardVO selectboard = new  BoardVO();
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM Boards WHERE boardNo = ?");
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			 
			while(rs.next()) {
				String userId = rs.getString(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				String regDate = rs.getString(5);
				int hit = rs.getInt(6);
				
				selectboard = new BoardVO(boardNo,userId,title,content,regDate,hit);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, pstmt, rs);
		}		return selectboard;
	}
	public int insertBoard(BoardVO vo) {
		//게시글 저장
		Connection conn=null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("INSERT INTO Boards(userId,title,content) values(?,?,?)");
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, pstmt);
		}		return 0;
	} 
	public int updateBoard(BoardVO vo) {
		//게시글 번호에 해당하는 게시글 수정
		Connection conn=null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("UPDATE Boards SET userId=?,title=?,content=? where boardNo = ? ");
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4, vo.getBoardNo());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, pstmt);
		}		return 0;
	} 
	public int deleteBoard(Integer boardNo) {
		//게시글 번호에 해당하는 게시글 삭제
		Connection conn=null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("DELETE FROM Boards WHERE boardNo =?");
			pstmt.setInt(1, boardNo);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, pstmt);
		}		return 0;
	} 
	public int getListCount() {
		//게시글 개수 반환
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int hit = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM Boards");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				hit = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, pstmt, rs);
		}		return hit;
	}
	public int getSearchListCount(String items, String text) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM Boards WHERE "+items+" like concat( '%', ? , '%')  ";
		int hit = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, text);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				hit = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		
		return hit;
	}
	
	public int increaseHit(Integer boardNo) {
		//조회수 증가
		Connection conn=null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("UPDATE Boards SET hit=hit+1 WHERE boardNo =? ");
			pstmt.setInt(1, boardNo);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		close(conn, pstmt);
		return 0;
	}
	
	
	
}
