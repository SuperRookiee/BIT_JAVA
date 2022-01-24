package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.action")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI(); System.out.println("uri: "+uri);
		String ctxPatch = request.getContextPath(); System.out.println("ctxPath: " + ctxPatch);
		String cmd = uri.substring(ctxPatch.length()); System.out.println("cmd: "+cmd);
		if(cmd.equals("/member/login.action")) {
			System.out.println("login"); System.out.println("====================");
			response.sendRedirect(request.getContextPath()+"/member/loginFrm.jsp");
		}else if(cmd.equals("/member/insert.action")){
			System.out.println("insert"); System.out.println("====================");
			response.sendRedirect(request.getContextPath()+"/member/joinFrm.jsp");
		}else if(cmd.equals("/member/select.action")){
			System.out.println("select"); System.out.println("====================");
			response.sendRedirect(request.getContextPath()+"/member/searchFrm.jsp");
		}else if(cmd.equals("/member/update.action")){
			System.out.println("update"); System.out.println("====================");
			response.sendRedirect(request.getContextPath()+"/member/updateFrm.jsp");
		}else if(cmd.equals("/member/delete.action")){
			System.out.println("delete"); System.out.println("====================");
			response.sendRedirect(request.getContextPath()+"/member/deleteSearchFrm.jsp");
		}else if(cmd.equals("/member/SelectAll.action")){
			System.out.println("SelectAll"); System.out.println("====================");
			response.sendRedirect(request.getContextPath()+"/member/memberSelectAll.jsp");
		}
	}

}
