package com.myproject.onlineexam.db;

import com.myproject.onlineexam.model.Provider;
import com.myproject.onlineexam.model.Students;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class StudentsDao {

	public static boolean doValidate(Students sd) {
		// TODO Auto-generated method stub
		boolean status = false;
		try
		{
		
		Connection con = Provider.getOracleConnection();
		String sql = "select * from studenttable where studentId=? and password=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, sd.getStudentId());
		pst.setString(2, sd.getPassword());
		ResultSet rs = pst.executeQuery();
		
		if(rs.next())
		{
			sd.setName(rs.getString("name"));
			status = true;
		}
		else
		{
			status = false;
		}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		// for testing status=true
		//status = true;
		return status;
	}

	public static boolean insertStudent(Students st) {
		// TODO Auto-generated method stub
		boolean status = false;
		try
		{
		
		Connection con = Provider.getOracleConnection();
		String sql = "insert into studenttable values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, st.getStudentId());
		pst.setString(2, st.getPassword());
		pst.setString(3, st.getName());
		pst.setString(4, st.getBatch());
		pst.setString(5, st.getCourse());
		pst.setString(6, st.getRegistrationNo());
		pst.setString(7, st.getDepartment());
		pst.setString(8, st.getDob());
		pst.setString(9, st.getGender());
		pst.setString(10, st.getEmail());
		pst.setString(11, st.getContactNo());
		pst.setString(12, st.getAddress());
		pst.setString(13, st.getAdmissionYear());
		pst.setString(14, st.getPassOutYear());


		int val = pst.executeUpdate();
		if(val > 0)
		{
			status = true;
		}
		else
		{
			status = false;
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	public static ArrayList<Students> getAllRecords()
	{
        ArrayList<Students>  samp =new ArrayList<Students>();
		try
		{
			
		   samp.clear();
		   Connection con = Provider.getOracleConnection();
		   String sql = "select * from studenttable";
		   PreparedStatement pst = con.prepareStatement(sql);
		   
		   ResultSet rs = pst.executeQuery(sql);
		   while(rs.next())
		   {
			  Students s = new Students();
			  s.setStudentId(rs.getString(1));
			  s.setPassword(rs.getString(2));
			  s.setName(rs.getString(3));
			  s.setBatch(rs.getString(4));
			  s.setCourse(rs.getString(5));
			  s.setRegistrationNo(rs.getString(6));
			  s.setDepartment(rs.getString(7));
			  s.setDob(rs.getString(8));
			  s.setGender(rs.getString(9));
			  s.setEmail(rs.getString(10));
			  s.setContactNo(rs.getString(11));
			  s.setAddress(rs.getString(12));
			  s.setAdmissionYear(rs.getString(13));
			  s.setPassOutYear(rs.getString(14));

			   samp.add(s);
			 
			  
			   
		   }
		  

		}
		catch(Exception e2)
		{
			e2.printStackTrace();
		}
		return samp;
	}
	public static int deleteRecord(Students st) {
		// TODO Auto-generated method stub
		int status = 0;
		try
		{
		
		Connection con = Provider.getOracleConnection();
		String sql = "delete from  studenttable where studentId=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, st.getStudentId());
	
		int val = pst.executeUpdate();
		if(val > 0)
		{
			status = 1;
		}
		else
		{
			status = 0;
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	public static String getStudentName(String Name) {
		// TODO Auto-generated method stub
		String name = null;
		try
		{
		
		Connection con = Provider.getOracleConnection();
		String sql = "select name from studenttable where studentId=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1,Name);
	
		ResultSet rs = pst.executeQuery();
		if(rs.next())
		{
			name = rs.getString(1);
		}
		else
		{
			name="DB-Error";
		}
		
	    }
		catch(Exception e)
		{
			name = e.getMessage();
		}
		return name;

   }

	public static int doUpdateNowRecord(String originalstudentId,String newStudentId,String newPassword,String newName,String newBatch,String newCourse,String newRegistrationNo,String newDepartment,String newDob,String newEmail,String newContactNo,String newAddress,String newAdmissionYear,String newPassOutYear)
	{
		int status = 0;
		try
		{

			Connection con = Provider.getOracleConnection();
			String sql = "update studenttable set studentId=?,password=?,name=?,batch=?,course=?,registrationNo=?,department=?,dob=?,email=?,contactNo=?,address=?,admissionYear=?,passOutYear=? where studentId=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1,newStudentId);
			pst.setString(2, newPassword);
			pst.setString(3, newName);
			pst.setString(4, newBatch);
			pst.setString(5, newCourse);
			pst.setString(6, newRegistrationNo);
			pst.setString(7, newDepartment);
			pst.setString(8, newDob);
			pst.setString(9, newEmail);
			pst.setString(10, newContactNo);
			pst.setString(11, newAddress);
			pst.setString(12, newAdmissionYear);
			pst.setString(13, newPassOutYear);
			pst.setString(14, originalstudentId);

			int val = pst.executeUpdate();
			if(val > 0)
			{
				status = 1;
			}
			else
			{
				status = -1;
			}
		}
		catch(Exception f)
		{
			status = 2;
			f.printStackTrace();
		}


		return status;
	}
	public static int doUpdatestudentprofile(String originalSId,String newPassword,String newEmail,String newContactNo,String newAddress)
	{
		int status = 0;
		try
		{

			Connection con = Provider.getOracleConnection();
			String sql = "update studenttable set password=?,email=?,contactNo=?,address=? where studentId=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, newPassword);;
			pst.setString(2, newEmail);
			pst.setString(3, newContactNo);
			pst.setString(4, newAddress);
			pst.setString(5, originalSId);

			int val = pst.executeUpdate();
			if(val > 0)
			{
				status = 1;
			}
			else
			{
				status = -1;
			}
		}
		catch(Exception f)
		{
			status = 2;
			f.printStackTrace();
		}


		return status;
	}

}
