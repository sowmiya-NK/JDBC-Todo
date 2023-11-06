package org.todo.Servlets;

import org.todo.Connection.DbConnect;
import org.todo.DAO.userDAO;
import org.todo.Model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String name=req.getParameter("name");
        String email=req.getParameter("email");
        String password=req.getParameter("password");
        User user=new User(name,email,password);
        userDAO dao=new userDAO(DbConnect.getConnection());
        boolean isUserExists=dao.userRegister(user);
        HttpSession session=req.getSession();

        if (isUserExists){
            session.setAttribute("successMsg","User is successfully registerd");
            resp.sendRedirect("register.jsp");
//            System.out.println("registerd successfully");
        }else {
            session.setAttribute("ErrorMsg","User is not registerd yet!!Please register here");
            resp.sendRedirect("register.jsp");
//            System.out.println("error on server");
        }
    }
}
