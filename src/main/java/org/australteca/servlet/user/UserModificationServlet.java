package org.australteca.servlet.user;

import org.australteca.Constants;
import org.australteca.dao.UserDAO;
import org.australteca.entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static org.australteca.Constants.*;

/**
 * Created by tomi on 11/04/17.
 */
public class UserModificationServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter(NAME_PARAM);
        String lname = req.getParameter(LAST_NAME_PARAM);
        String email = req.getParameter(EMAIL_PARAM);
        String password = req.getParameter(PASSWORD_PARAM);
        String passwordC = req.getParameter(PASSWORD_CONFIRMATION_PARAM);
        String career = req.getParameter(CAREER_PARAM);

        Integer status;
        if((password == null && passwordC != null) || (password != null && passwordC == null)){
            status = 1;
        }else if(password != null && passwordC != null && !password.equals(passwordC)){
            status = 2;
        }else {
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserByEmail(req.getRemoteUser());

            if(name != null) user.setFirstName(name);
            if(lname != null) user.setLastName(lname);
            if(email != null)user.setEmail(email);
            if(password != null)user.setPassword(password);
            if(career!= null)user.setCourse(career);

            userDAO.merge(user);
            status = 0;
        }
        req.setAttribute(STATUS, status);
        req.getRequestDispatcher("/mainMenu/userSettings.jsp").forward(req, resp);
    }
}
