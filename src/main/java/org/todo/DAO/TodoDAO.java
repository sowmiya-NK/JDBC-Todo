package org.todo.DAO;

import org.todo.Model.Todo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TodoDAO {

    private Connection connection;

    public TodoDAO(Connection connection) {
        this.connection = connection;
    }

    public  boolean addTodo(Todo todo){
        boolean f=false;
        String sql="insert into todo(Item,UserId) values (?,?)";
        try {
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,todo.getTodoItem());
            ps.setInt(2,todo.getUserId());
            int i=ps.executeUpdate();
            if (i==1){
                f=true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return f;
    }
    public List<Todo> getAllTodos(int userid){
        List<Todo> todoList=new ArrayList<>();
        String sql="select * from Todo where UserId=? ";
        try {
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setInt(1,userid);
            ResultSet rs= ps.executeQuery();
            while (rs.next()){
                Todo todos = new Todo();
                todos=new Todo();
                todos.setId(rs.getInt(1));
                todos.setTodoItem(rs.getString(2));
                todoList.add(todos);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

//        System.out.println(todoList.size());
        return todoList;
    }
}
