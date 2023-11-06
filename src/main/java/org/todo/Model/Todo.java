package org.todo.Model;

public class Todo {
    private int id;
    private String todoItem;
    private int userId;

    public Todo() {
    }

    public Todo(String todoItem, int userId) {
        this.todoItem = todoItem;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTodoItem() {
        return todoItem;
    }

    public void setTodoItem(String todoItem) {
        this.todoItem = todoItem;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}

