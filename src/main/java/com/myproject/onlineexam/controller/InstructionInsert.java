package com.myproject.onlineexam.controller;

import com.myproject.onlineexam.db.InstructionsDao;
import com.myproject.onlineexam.model.Instructions;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class InstructionInsert
 */
@WebServlet("/com.myproject.onlineexam.controller.InstructionInsert")
public class InstructionInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InstructionInsert() {
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

		String instractionid = request.getParameter("instid");
		String subjetcode = request.getParameter("subcode");
		String instruction = request.getParameter("inst");
		String totalmarks = request.getParameter("marks");
		String duration = request.getParameter("dur");
		String date = request.getParameter("date");

		
		Instructions ist = new Instructions();

		ist.setInstId(instractionid);
		ist.setSubjectCode(subjetcode);
		ist.setInstruction(instruction);
		ist.setTotalMarks(totalmarks);
		ist.setDuration(duration);
		ist.setDate(date);


		
		boolean status = InstructionsDao.insertInstruction(ist);
		if(status)
		{
			String msg1 = "Instruction Added";
	    	response.sendRedirect("AddInstruction.jsp?msg1="+msg1);
		}
		else
		{
			String msg2 = "Instruction not Added";
	    	response.sendRedirect("AddInstruction.jsp?msg2="+msg2);
		}
		

	}



}
