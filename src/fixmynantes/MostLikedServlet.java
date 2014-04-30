package fixmynantes;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class MostLikedServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		try {
			this.getServletContext().getRequestDispatcher( "/WEB-INF/mostliked.jsp" ).forward( req, resp );
		} catch (ServletException e) {
			// TODO Bloc catch généré automatiquement
			e.printStackTrace();
		}
	}
}