package com.myproject.onlineexam.db;

import com.myproject.onlineexam.model.*;
//import com.myproject.onlineexam.model.Provider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AdminsDao {

	public static boolean doValidate(Admins ad) {
		// TODO Auto-generated method stub
		boolean status = false;
		try
		{
		
		Connection con = Provider.getOracleConnection();
		String sql = "select * from admintable where adminId=? and password=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, ad.getAdminId());
		pst.setString(2, ad.getPassword());

		ResultSet rs = pst.executeQuery();
		if(rs.next())
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
	public static boolean insertAdmin(Admins ad) {
		// TODO Auto-generated method stub
		boolean status = false;
		try
		{
		Connection con = Provider.getOracleConnection();
		String sql = "insert into admintable values(?,?,?,?,?,?,?,?)";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, ad.getAdminId());
		pst.setString(2, ad.getPassword());
		pst.setString(3, ad.getAdminName());
		pst.setString(4, ad.getAdminEmail());
		pst.setString(5, ad.getAdminContactNo());
		pst.setString(6, ad.getAdminAddress());
		pst.setString(7, ad.getAdminDob());
		pst.setString(8, ad.getAdminGender());




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
		catch(Exception a)
		{
			a.printStackTrace();
		}
		return status;
	}
	public static ArrayList<Admins> getAllRecords()
	{
		ArrayList<Admins> samp = new ArrayList<Admins>();
		try {

			samp.clear();
			Connection con = Provider.getOracleConnection();
			String sql = "select * from admintable";
			PreparedStatement pst = con.prepareStatement(sql);

			ResultSet rs = pst.executeQuery(sql);
			while (rs.next()) {
				Admins a = new Admins();
				a.setAdminId(rs.getString(1));
				a.setPassword(rs.getString(2));
				a.setAdminName(rs.getString(3));
				a.setAdminEmail(rs.getString(4));
				a.setAdminContactNo(rs.getString(5));
				a.setAdminAddress(rs.getString(6));
				a.setAdminDob(rs.getString(7));
				a.setAdminGender(rs.getString(8));


				samp.add(a);
			}

		}
		catch(Exception a2) {
			a2.printStackTrace();
		}
		return samp;
	}

	public static String getAdminName(String adminName) {
		// TODO Auto-generated method stub
		String name = null;
		try
		{

			Connection con = Provider.getOracleConnection();
			String sql = "select adminName from admintable where adminId=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1,adminName);

			ResultSet rs = pst.executeQuery();
			if(rs.next())
			{
				name = rs.getString(1);
			}
			else
			{
				name="DB-Error!";
			}

		}
		catch(Exception e)
		{
			name = e.getMessage();
		}
		return name;

	}

	public static int doUpdateAdminRecords(String originaladminId,String newAdminId,String newPassword)
	{
		int status = 0;
		try
		{

			Connection con = Provider.getOracleConnection();
			String sql = "update admintable set adminId=?,password=? where adminId=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, newAdminId);
			pst.setString(2, newPassword);
			pst.setString(3, originaladminId);

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
	public static int doUpdateadminprofile(String originalaId,String newName,String newPassword,String newDob,String newGender,String newEmail,String newContactNo,String newAddress)
	{
		int status = 0;
		try
		{

			Connection con = Provider.getOracleConnection();
			String sql = "update admintable set adminName=?,password=?,adminDob=?,adminGender=?,adminEmail=?,adminContactNo=?,adminAddress=? where adminId=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1,newName);
			pst.setString(2, newPassword);
			pst.setString(3, newDob);
			pst.setString(4, newGender);
			pst.setString(5, newEmail);
			pst.setString(6, newContactNo);
			pst.setString(7, newAddress);
			pst.setString(8, originalaId);

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

