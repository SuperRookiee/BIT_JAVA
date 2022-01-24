package org.global.beans;

import java.sql.*;
import java.util.*;


public class MemberDAO {
    //singleton
	private static MemberDAO dao = new MemberDAO();
	private MemberDAO() {
		
	}
	public static MemberDAO getInstance() {
		return dao;
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	} // 연결 닫기
	public void close(Connection conn, PreparedStatement pstmt) {
		try {
			conn.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} // 연결 닫기
	public ArrayList<MemberDTO> selectMemberAll(){
		 ArrayList<MemberDTO> Listall = new  ArrayList<MemberDTO>();
		 Connection conn=null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 try {
			 conn = getConnection();
			 pstmt = conn.prepareStatement("SELECT * FROM Members");
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 String userId = rs.getString(1);
				 String userPwd = rs.getString(2);
				 String userName = rs.getString(3);
				 String phoneNo = rs.getString(4);
				 String address = rs.getString(5);
				 String email = rs.getString(6);
				 String regDate = rs.getString(7);
				 
				 
				 MemberDTO dto = new MemberDTO(userId, userPwd, userName, phoneNo, address, email, regDate);
				 Listall.add(dto);
			 }
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		return Listall;
	} // 모든 멤버 조회
	
	public MemberDTO selectMember(String userId) {
		MemberDTO selectMember = new  MemberDTO();
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM Members WHERE userId = ?");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			 
			while(rs.next()) {
				String userPwd = rs.getString("userPwd");
				String userName = rs.getString("userName");
				String phoneNo = rs.getString("phoneNo");
				String address = rs.getString("address");
				String email = rs.getString("email");
				String regDate = rs.getString("regDate");
				
				selectMember = new MemberDTO(userId, userPwd, userName, phoneNo, address, email, regDate);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return selectMember;
	} //특정 멤버 조회
	public int insertMember(MemberDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("INSERT INTO Members(userId, userPwd, userName, phoneNo, address, email) values(?,?,?,?,?,?)");
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPwd());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getPhoneNo());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getEmail());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	} //회원 정보 삽입
	public int updateMember(MemberDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("UPDATE Members SET userPwd=?, userName=?, phoneNo=?, address=?, email=? where userId =? ");
			pstmt.setString(1, dto.getUserPwd());
			pstmt.setString(2, dto.getUserName());
			pstmt.setString(3, dto.getPhoneNo());
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getUserId());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	} //모든 멤버 수정
	public int deleteMember(String userId) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("DELETE FROM Members WHERE userId =?");
			pstmt.setString(1, userId);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	} //특정 멤버 삭제
	    	
}
