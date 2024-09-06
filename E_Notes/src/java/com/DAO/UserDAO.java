package com.DAO;

import com.db.DBConnect;
import com.user.UserDetails;
import java.sql.*;

public class UserDAO {

		private Connection conn;

    public UserDAO(Connection conn) {
        super();
        this.conn = conn;
    }
    
     public boolean addUser(UserDetails us){
       
        boolean f = false ;
        
        try{
            String query = "insert into user (name , email, password) values(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail()); 
            ps.setString(3, us.getPassword());
            
          int i=  ps.executeUpdate();
          if(i==1)
              f= true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
     public UserDetails loginUser(UserDetails us ){
         UserDetails user = new UserDetails();
         
         try{
             String query = "Select * from user where email = ? and password = ? ";
             PreparedStatement pst = conn.prepareStatement(query);
             pst.setString(1, us.getEmail());
             pst.setString(2, us.getPassword());
             
             ResultSet rs = pst.executeQuery();
             if(rs.next()){
               user.setId(rs.getInt("id"));
               user.setName(rs.getString("name"));
               user.setEmail(rs.getString("email"));
               user.setPassword(rs.getString("password"));
             }
         }
         catch(Exception e ){
             e.printStackTrace();
         }
         return user;
     }
     
     
                
	
}
