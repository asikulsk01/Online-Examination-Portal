package com.myproject.onlineexam.controller;

import com.myproject.onlineexam.db.QuestionsDao;
import com.myproject.onlineexam.model.Questions;
import org.jetbrains.annotations.NotNull;

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
@WebServlet("/com.myproject.onlineexam.controller.QuestionInsert")
public class QuestionInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(@NotNull HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String questionid = request.getParameter("questionid");
		String subjectcode = request.getParameter("subjectcode");
		String question = request.getParameter("question");
		String a = request.getParameter("option1");
		String b = request.getParameter("option2");
		String c = request.getParameter("option3");
		String d = request.getParameter("option4");
		String answer = request.getParameter("answer");

		Questions q = new Questions();
		q.setA(a);
		q.setB(b);
		q.setC(c);
		q.setD(d);
		q.setAnswer(answer);
		q.setQuestion(question);
		q.setQuestionId(questionid);
		q.setSubjectCode(subjectcode);
		
		boolean status = QuestionsDao.insertQuestion(q);
		
		if(status)
		{
			String msg1 = "Question Added";
	    	response.sendRedirect("AddQuestion.jsp?msg1="+msg1);
		}
		else
		{
			String msg2 = "Question not Added";
	    	response.sendRedirect("AddQuestion.jsp?msg2="+msg2);
		}
	}

}
