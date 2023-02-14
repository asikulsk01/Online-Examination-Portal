package com.myproject.onlineexam.controller;

import com.myproject.onlineexam.db.SubjectsDao;
import com.myproject.onlineexam.model.Subjects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class QuestionInsert
 */
@WebServlet("/com.myproject.onlineexam.controller.SubjectInsert")
public class SubjectInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		String subjectid = request.getParameter("subid");
		String subjectcode = request.getParameter("subcode");
		String subjectname = request.getParameter("subname");

		Subjects sb = new Subjects();
		sb.setSubjectID(subjectid);
		sb.setSubjectcode(subjectcode);
		sb.setSubjectname(subjectname);

		boolean status = SubjectsDao.insertSubject(sb);
		if(status)
		{
			String msg1 = "Subject Added Successfully";
			response.sendRedirect("AddSubject.jsp?msg1="+msg1);
		}
		else
		{
			String msg2 = "Subject Not Added";
			response.sendRedirect("AddSubject.jsp?msg2="+msg2);
		}

	}

}
