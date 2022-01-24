package member;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 * Servlet implementation class LoginProc
 */
@WebServlet("/member/loginProc.do")
public class loginProc extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginProc() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      response.getWriter().append("Served at: ").append(request.getContextPath());
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      actionDo(request,response);
   }

   private void actionDo(HttpServletRequest request, HttpServletResponse response) {
      
      try {
         request.setCharacterEncoding("utf-8");
      } catch (UnsupportedEncodingException e1) {
         // TODO Auto-generated catch block
         e1.printStackTrace();
      }
      String sql="";
      InitialContext ic;
      String userId = null,userPwd = null,username=null;
      try {
         ic = new InitialContext();
         
         DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
         String userIds = request.getParameter("userId");
         sql="select userId,userPwd,userName from Members where userId =?";
         Connection conn = ds.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userIds);
         ResultSet rs = pstmt.executeQuery();
         
         while(rs.next()) {
            userId = rs.getString(1);
            userPwd = rs.getString(2);
            username = rs.getString(3);
            HttpSession httpsession = request.getSession();
            httpsession.setAttribute("userId", userId);
            httpsession.setAttribute("userPwd", userPwd);
            httpsession.setAttribute("username", username);
            if(request.getParameter("userId").equals(userId) &&request.getParameter("userPwd").equals(userPwd)) {
               RequestDispatcher rd = request.getRequestDispatcher("/loginResult.jsp");
               try {
                  rd.forward(request, response);
               } catch (ServletException e) {
                  e.printStackTrace();
               }
            }else {
               RequestDispatcher rd = request.getRequestDispatcher("/loginFrm.jsp");
               try {
                  rd.forward(request, response);
               } catch (ServletException e) {
                  // TODO Auto-generated catch block
                  e.printStackTrace();
               }
            }
         }
         rs.close();
         conn.close();
      }catch (NamingException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
   
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }
}
