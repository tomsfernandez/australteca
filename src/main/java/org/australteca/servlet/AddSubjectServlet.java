package org.australteca.servlet;

import org.australteca.Constants;
import org.australteca.dao.SubjectDAO;
import org.australteca.entity.Subject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by tomi on 08/04/17.
 */

public class AddSubjectServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String subjectName = req.getParameter(Constants.SUBJECT_NAME_PARAM);
        SubjectDAO subjectDAO = new SubjectDAO();

        Integer status = subjectDAO.addToDatabase(new Subject(subjectName));

        if(status != null) req.setAttribute(Constants.OPERATION_SUCCESFUL_PARAM, true);
        else req.setAttribute(Constants.OPERATION_SUCCESFUL_PARAM, false);
        req.getRequestDispatcher("/mainMenu/subject.jsp").forward(req, resp);
    }
}
