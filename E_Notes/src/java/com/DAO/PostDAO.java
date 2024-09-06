/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.user.Post;
import com.user.UserDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class PostDAO {
    private Connection conn ;

    public PostDAO( Connection conn ) {
        super();
        this.conn = conn;
    }
    
    public boolean addNotes(String ti,String co,int uid ){
        boolean f = true ;
        try{
            String sql = "insert into post (title , content , uid ) values(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, ti);
            ps.setString(2, co);
            ps.setInt(3,uid);
           int i =  ps.executeUpdate();
           if(i==1){
               f=true;
           }
        }catch(Exception e )
        {}
        return f;
    }
    
    public List<Post> getData(int id){
        List<Post> list = new ArrayList<Post>();
        Post pst = null;
        try{
            String query = "SELECT * FROM post WHERE uid = ? ORDER BY ID DESC ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                 pst = new Post();
                 pst.setId(rs.getInt(1));
                 pst.setTitle(rs.getString(2));
                 pst.setContent(rs.getString(3));
                 pst.setPdate(rs.getTimestamp(4));
                 list.add(pst);
            }
        }
        catch(Exception e )
        {
            e.printStackTrace();
        }
        
        return list;
    }
    
    
    public boolean getDataWithId(String ti,String co,int id ){
        boolean f=false;
            try{
                String query = "Update post Set title = ? ,content = ? where id  = ?";
                PreparedStatement pst = conn.prepareStatement(query);
                pst.setString(1, ti);
                pst.setString(2, co);
                pst.setInt(3, id);
               int i =  pst.executeUpdate();
               if(i==1)
                   f= true;
            }catch(Exception e )
            {
                e.printStackTrace();
            }
        return f;
    }

   public Post getDataThroughId(int id){
        Post pst = null;
        try{
            String query = "SELECT * FROM post WHERE id = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                 pst = new Post();
                 pst.setId(rs.getInt(1));
                 pst.setTitle(rs.getString(2));
                 pst.setContent(rs.getString(3));
                 pst.setPdate(rs.getTimestamp(4));
          
            }
        }
        catch(Exception e )
        {
            e.printStackTrace();
        }
        
        return pst;
    }
   
   public boolean deleteDataWithId(int id ){
        boolean f=false;
            try{
                String query = "delete from post where id  = ?";
                PreparedStatement pst = conn.prepareStatement(query);
                pst.setInt(1, id);
               int i =  pst.executeUpdate();
               if(i==1)
                   f= true;
            }catch(Exception e )
            {
                e.printStackTrace();
            }
        return f;
    }
   
    
}
