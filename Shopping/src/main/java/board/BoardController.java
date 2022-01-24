package board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardController
 */
@WebServlet("*.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardController() {
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
		BoardDAO vo = BoardDAO.getInstance();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		RequestDispatcher rd = null;
		if(cmd.equals("/board/writeProc.do")) { //DB에 게시글 저장 후 listProc.do로 이동
			BoardVO boardvo = new BoardVO((String)request.getParameter("userId"), (String)request.getParameter("title"), (String)request.getParameter("content"));
			vo.insertBoard(boardvo);
			
			response.sendRedirect(request.getContextPath()+"/board/listProc.do");
		}
		else if(cmd.equals("/board/listProc.do")) { //게시글 목록 DB에 불러와서 listProc.do에 출력하기
			String items = request.getParameter("items");
			String text = request.getParameter("text");
			if(items !=null) {
				request.setAttribute("list", vo.selectBoardItems(items, text));
				request.setAttribute("counts", vo.getSearchListCount(items, text));
			}
			else {
				request.setAttribute("list", vo.selectBoardAll());
				request.setAttribute("counts", vo.getListCount());
			}
			request.setAttribute("count", vo.getListCount());
			rd = request.getRequestDispatcher("/board/list.jsp");
			rd.include(request, response);
		}
		else if(cmd.equals("/board/viewProc.do")) { //패러미터 추출해서 게시글 번호에 해당하는 글 조회수 증가하기, 불러와서 view.jsp에 출력하기
			BoardVO selectboard = new  BoardVO();
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			selectboard = vo.selectBoard(boardNo);
			vo.increaseHit(boardNo);
			
			request.setAttribute("listuserId", request.getParameter("userId"));
			request.setAttribute("listtitle", selectboard.getTitle());
			request.setAttribute("listcontent", selectboard.getContent());
			request.setAttribute("listboardNo", boardNo);
			
			
			rd = request.getRequestDispatcher("/board/view.jsp");
			rd.forward(request, response);
		}
		else if(cmd.equals("/board/viewProcdelete.do")) { //패러미터 추출해서 게시글 번호에 해당하는 글 조회수 증가하기, 불러와서 view.jsp에 출력하기
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			vo.deleteBoard(boardNo);
			
			rd = request.getRequestDispatcher("/board/listProc.do");
			rd.forward(request, response);
		}
		else if(cmd.equals("/board/viewProcupdate.do")) { //패러미터 추출해서 게시글 번호에 해당하는 글 조회수 증가하기, 불러와서 view.jsp에 출력하기
			BoardVO boardvo = new BoardVO((String)request.getParameter("userId"), (String)request.getParameter("updatetitle"), (String)request.getParameter("updatecontent"),Integer.parseInt((String)request.getParameter("boardNo") ));
			vo.updateBoard(boardvo);
			rd = request.getRequestDispatcher("/board/listProc.do");
			rd.forward(request, response);
		}
		else if(cmd.equals("/board/search.do")) { //패러미터 추출해서 게시글 번호에 해당하는 글 조회수 증가하기, 불러와서 view.jsp에 출력하기
			BoardVO boardvo = new BoardVO((String)request.getParameter("userId"), (String)request.getParameter("updatetitle"), (String)request.getParameter("updatecontent"),Integer.parseInt((String)request.getParameter("boardNo") ));
			vo.updateBoard(boardvo);
			rd = request.getRequestDispatcher("/board/listProc.do");
			rd.forward(request, response);
		}
	}

}
