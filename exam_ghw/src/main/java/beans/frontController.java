package beans;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class frontController
 */
@WebServlet("*.action")
public class frontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public frontController() {
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

	public void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//cmd 추출
		String uri = request.getRequestURI();
		String ctxPatch = request.getContextPath();
		String cmd = uri.substring(ctxPatch.length());
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		AccountDAO acc = AccountDAO.getInstance();
		RequestDispatcher rd = null;

		if(cmd.equals("/openAccountFrm.action")) {
			String accountId = (String) request.getParameter("accountId");
			String accountPwd = (String) request.getParameter("accountPwd");
			String userName = (String) request.getParameter("userName");
			int balance = Integer.parseInt(request.getParameter("balance"));
			Account ac = new  Account(accountId,accountPwd,userName,balance);
			acc.insertBoard(ac);
			
			request.setAttribute("result", "계좌 계설 완료");
			rd = request.getRequestDispatcher("/jobResult.jsp");
			rd.forward(request, response);
		}
		if(cmd.equals("/accountjob.action")) {
			String accountId = (String) request.getParameter("accountId");
			String accountPwd = (String) request.getParameter("accountPwd");
			String items = (String) request.getParameter("items");
			int balance = Integer.parseInt(request.getParameter("balance"));
			String send_accountId = (String) request.getParameter("send_accountId");
			
			acc.selectAccountItems(accountId, accountPwd, balance, items, send_accountId);
			
			request.setAttribute("result", "송금 완료");
			rd = request.getRequestDispatcher("/jobResult.jsp");
			rd.forward(request, response);
		}
		
		
		
		
	}
}
