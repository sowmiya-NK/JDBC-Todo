package org.todo.DAO;

import org.todo.Model.Todo;
import org.todo.Model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class userDAO {

    private Connection connection;

    public userDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean userRegister(User user){
        boolean f=false;
        String sql="insert into user (Username, email, Password) values(?,?,?)";
        try {
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getPassword());
            int i=ps.executeUpdate();
            if (i==1){
                f=true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return f;
    }

    public User loginUser(String email,String pass){
        User u=null;
        String sql="select * from user where email=? and password=?";
        try {
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,email);
            ps.setString(2,pass);
            ResultSet rs= ps.executeQuery();
            while (rs.next()){
                u=new User();
                u.setId(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPassword(rs.getString(4));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return u;
    }

}