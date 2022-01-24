package org.global.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.global.beans.*;


/**
 * Servlet implementation class BookReg
 */
@WebServlet("/BookReg")
public class BookReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookReg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		String bookId = request.getParameter("bookId");
		String bookname = request.getParameter("bookname");
		String publisher = request.getParameter("publisher");
		String price = request.getParameter("price");
		BookBeans book = new BookBeans(bookId,bookname,publisher,price);
		PrintWriter out = response.getWriter();
		request.setAttribute("book", book);
		RequestDispatcher rd = request.getRequestDispatcher("bookResult.jsp");
		rd.forward(request, response);
	}

}
