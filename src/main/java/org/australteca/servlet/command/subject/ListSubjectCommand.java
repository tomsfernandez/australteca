package org.australteca.servlet.command.subject;

import org.australteca.dao.SubjectDao;
import org.australteca.dao.UserDao;
import org.australteca.entity.Subject;
import org.australteca.entity.User;
import org.australteca.servlet.command.Command;
import org.australteca.servlet.command.context.http.HttpServletContext;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by tomi on 12/04/17.
 */
public class ListSubjectCommand implements Command {

    @Override
    public void execute(HttpServletContext context) throws IOException, ServletException {
        String userEmail = context.getServletRequest().getRemoteUser();
        List<SubjectWrapper> subjectWrapperList = new ArrayList<>();
        List<Subject> subjectList = new SubjectDao().list();

        if(userEmail.equals("")){
            for(Subject s: subjectList){
                subjectWrapperList.add(new SubjectWrapper(s, false));
            }
        }else{
            User user = new UserDao().getUserByEmail(userEmail);
            Set<Subject> userSubjects = user.getSubjects();
            for(Subject s: subjectList){
                if(userSubjects.contains(s)) subjectWrapperList.add(new SubjectWrapper(s, true));
                else subjectWrapperList.add(new SubjectWrapper(s, false));
            }
        }
        context.getServletRequest().setAttribute("subjectWrappers", subjectWrapperList);
        context.forwardRequest("/mainMenu/subjects.jsp");
    }

    @Override
    public Command create() {
        return new ListSubjectCommand();
    }

    public class SubjectWrapper{

        Subject subject;
        boolean favorite;

        SubjectWrapper(Subject subject, boolean favorite) {
            this.subject = subject;
            this.favorite = favorite;
        }

        public Subject getSubject() {
            return subject;
        }

        public boolean isFavorite() {
            return favorite;
        }
    }
}
