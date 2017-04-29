package org.australteca.servlet.command.subject;

import org.australteca.servlet.command.Command;
import org.australteca.servlet.command.context.http.HttpServletContext;

import javax.servlet.ServletException;
import java.io.IOException;

/**
 * Created by tomi on 26/04/17.
 */
public class DeleteNoteFromSubjectCommand implements Command{

    @Override
    public void execute(HttpServletContext context) throws IOException, ServletException {
        /**
         * to be implemented
         */
    }

    @Override
    public Command create() {
        return new DeleteNoteFromSubjectCommand();
    }
}