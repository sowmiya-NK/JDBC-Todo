package org.todo.Servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        session.getAttribute("user");
        session.removeAttribute("user");
        HttpSession session2 = req.getSession();
        session2.setAttribute("logoutmsg", "logged out successfully...");
        resp.sendRedirect("login.jsp");
    }
}
