package beans;

import java.sql.*;
import java.util.*;




public class AccountDAO {
	private static AccountDAO ac = new AccountDAO();
	private AccountDAO() {
		
	}
	public static AccountDAO getInstance() {
		return ac;
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
	
	public int insertBoard(Account ac) {
		//계좌 개설
		Connection conn=null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("INSERT INTO Accounts(accountId,accountPwd,username,balance) values(?,?,?,?)");
			pstmt.setString(1, ac.getAccountId());
			pstmt.setString(2, ac.getAccountPwd());
			pstmt.setString(3, ac.getUserName());
			pstmt.setInt(4, ac.getBalance());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, pstmt);
		}		return 0;
	} 
	
	public List<Account> selectBoardAll(){
		//게시글 전체 목록 반환
		List<Account> list = new  ArrayList<Account>();
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM Accounts");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String accountId = rs.getString(1);
				String accountPwd = rs.getString(2);
				String userName = rs.getString(3);
				int balance = rs.getInt(4);
				Account vo = new Account(accountId,accountPwd,userName,balance);
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, pstmt, rs);
		}		return list;
		
	}
	
	public Account selectAccount(String accountId, String accountPwd){
		//특정 게시글 정보 반환
		Account selectAccount = new  Account();
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM Accounts WHERE accountId = ? & accountPwd= ?");
			pstmt.setString(1, accountId);
			pstmt.setString(2, accountPwd);
			rs = pstmt.executeQuery();
			 
			while(rs.next()) {
				String userName = rs.getString(3);
				int balance = rs.getInt(4);
				
				selectAccount = new Account(accountId,accountPwd,userName,balance);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, pstmt, rs);
		}		
		return selectAccount;
	}
	
	public List<Account> selectAccountItems(String accountId, String accountPwd, int balance, String item, String send_accountId){
		List<Account> list = new  ArrayList<Account>();
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean a = false;
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM Accounts WHERE accountId= ? & accountPwd=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, accountId);
			pstmt.setString(2, accountPwd);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int balances = rs.getInt(4);
				
				if(balances >= balance) {
					a = true;
				}
			}
			
			if(a==true) {
				sql = "UPDATE Accounts SET  balance=balance"+balance+" where send_accountId ="+send_accountId;
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				
				sql = "UPDATE Accounts SET  balance=balance"+(-balance)+" where send_accountId ="+accountId;
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return list;
		
	}
	
}
