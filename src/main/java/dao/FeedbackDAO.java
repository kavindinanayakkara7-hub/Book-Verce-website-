package dao;

import model.FeedbackBean;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;

public class FeedbackDAO {

    public boolean addFeedback(FeedbackBean feedback){

        boolean status=false;

        try{

            Connection con=DBConnection.getConnection();

            String sql="INSERT INTO feedback(user_id,subject,message) VALUES(?,?,?)";

            PreparedStatement ps=con.prepareStatement(sql);

            ps.setInt(1,feedback.getUserId());
            ps.setString(2,feedback.getSubject());
            ps.setString(3,feedback.getMessage());

            status=ps.executeUpdate()>0;

        }catch(Exception e){
            e.printStackTrace();
        }

        return status;

    }

    public ArrayList<FeedbackBean> getAllFeedback(){

        ArrayList<FeedbackBean> list=new ArrayList<>();

        try{

            Connection con=DBConnection.getConnection();

            String sql="SELECT * FROM feedback ORDER BY created_at DESC";

            PreparedStatement ps=con.prepareStatement(sql);

            ResultSet rs=ps.executeQuery();

            while(rs.next()){

                FeedbackBean f=new FeedbackBean();

                f.setId(rs.getInt("id"));
                f.setUserId(rs.getInt("user_id"));
                f.setSubject(rs.getString("subject"));
                f.setMessage(rs.getString("message"));
                f.setCreatedAt(rs.getTimestamp("created_at"));

                list.add(f);

            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;

    }

}