package com.myproject.onlineexam.db;

import com.myproject.onlineexam.model.Provider;
import com.myproject.onlineexam.model.Subjects;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SubjectsDao {

    public static boolean insertSubject(Subjects sb) {
        // TODO Auto-generated method stub
        boolean status = false;
        try
        {

            Connection con = Provider.getOracleConnection();
            String sql = "insert into subjecttable values(?,?,?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, sb.getSubjectID());
            pst.setString(2, sb.getSubjectcode());
            pst.setString(3, sb.getSubjectname());


            int val = pst.executeUpdate();
            if(val > 0)
            {
                status =true;
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

    public static ArrayList<Subjects> getAllRecords()
    {
        ArrayList<Subjects> samp = new ArrayList<Subjects>();
        try
        {

            samp.clear();
            Connection con = Provider.getOracleConnection();
            String sql = "select * from subjecttable";
            PreparedStatement pst = con.prepareStatement(sql);

            ResultSet rs = pst.executeQuery(sql);
            while(rs.next())
            {
                Subjects sb = new Subjects();
                sb.setSubjectID(rs.getString(1));
                sb.setSubjectcode(rs.getString(2));
                sb.setSubjectname(rs.getString(3));


                samp.add(sb);

            }


        }
        catch(Exception e2)
        {
            e2.printStackTrace();
        }
        return samp;
    }
    public static int deleteRecord(Subjects sb)
    {
        int status = 0;
        try
        {

            Connection con = Provider.getOracleConnection();
            String sql = "delete from subjecttable where subjectcode=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, sb.getSubjectcode());

            int val = pst.executeUpdate();
            if(val > 0)
            {
                status =1;
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
    public static int doUpdateNowRecord(String originalsubjectid,String newsubjectid,String newsubjectcode,String newsubjectname)
    {
        int status = 0;
        try
        {

            Connection con = Provider.getOracleConnection();
            String sql = "update subjecttable set subjectid=?,subjectcode=?,subjectname=? where subjectid=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, newsubjectid);
            pst.setString(2, newsubjectcode);
            pst.setString(3, newsubjectname);
            pst.setString(4, originalsubjectid);

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
