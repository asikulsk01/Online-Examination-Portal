package com.myproject.onlineexam.db;

import com.myproject.onlineexam.model.Instructions;
import com.myproject.onlineexam.model.Provider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class InstructionsDao {

	public static boolean insertInstruction(Instructions ist) {
		// TODO Auto-generated method stub
		boolean status = false;
		try
		{
		
		Connection con = Provider.getOracleConnection();
		String sql = "insert into instructiontable values(?,?,?,?,?,?)";
		PreparedStatement pst = con.prepareStatement(sql);

		pst.setString(1,ist.getInstId());
		pst.setString(2,ist.getSubjectCode());
		pst.setString(3,ist.getInstruction());
		pst.setString(4,ist.getTotalMarks());
		pst.setString(5,ist.getDuration());
		pst.setString(6,ist.getDate());

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
	public static ArrayList<Instructions> getAllRecords()
	{
        ArrayList<Instructions>  samp =new ArrayList<Instructions>();
		try
		{
			
		   samp.clear();
		   Connection con = Provider.getOracleConnection();
		   String sql = "select * from instructiontable";
		   PreparedStatement pst = con.prepareStatement(sql);
		   
		   ResultSet rs = pst.executeQuery(sql);
		   while(rs.next())
		   {
			  Instructions i = new Instructions();
			   i.setInstId(rs.getString(1));
			   i.setSubjectCode(rs.getString(2));
			   i.setInstruction(rs.getString(3));
			   i.setTotalMarks(rs.getString(4));
			   i.setDuration(rs.getString(5));
			   i.setDate(rs.getString(6));

			   samp.add(i);
		   }
		}
		catch(Exception e2)
		{
			e2.printStackTrace();
		}
		return samp;
	}
	public static int deleteRecord(Instructions ist) {
		// TODO Auto-generated method stub
	int val = 0;
		try
		{
		
		Connection con = Provider.getOracleConnection();
		String sql = "delete from instructiontable where instructionid=?";
		PreparedStatement pst = con.prepareStatement(sql);

		pst.setString(1,ist.getInstId());

	    val = pst.executeUpdate();
	
	
	    }
		catch(Exception e)
		{
			val = -1;
		}
		return val;
	}
	public static int doUpdateNowRecord(String instaoriginal,String instidmodified,String subcodemodified,String instamodified,String ttlmarksmodifid,String durationmodified,String datemodified)
	{
		int status = 0;
		try
		{
		
		Connection con = Provider.getOracleConnection();
		String sql = "update instructiontable set instructionid=?,subjectcode=?,instruction=?,totalmarks=?,duration=?,examdate=? where instructionid=?";
		PreparedStatement pst = con.prepareStatement(sql);

		pst.setString(1,instidmodified);
		pst.setString(2,subcodemodified);
		pst.setString(3,instamodified);
		pst.setString(4,ttlmarksmodifid);
		pst.setString(5,durationmodified);
		pst.setString(6,datemodified);
		pst.setString(7,instaoriginal);
	
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
