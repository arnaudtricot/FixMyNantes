package fixmynantes;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.*;
import com.google.appengine.api.datastore.Query.SortDirection;



@SuppressWarnings("serial")
public class HomeServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		try {
			
			DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
			if (datastore != null){
			 // Demande tous les 3 derniers messages triés par date décroissante
           Query q = new Query("Incident").setAncestor(KeyFactory.createKey("TousIncidents","ListIncidents")).addSort("Date", SortDirection.DESCENDING);
           List<Entity> results = datastore.prepare(q).asList(FetchOptions.Builder.withLimit(300));

           req.setAttribute("incidents", results);
			
			this.getServletContext().getRequestDispatcher( "/WEB-INF/home.jsp" ).forward( req, resp );}
		} catch (ServletException e) {
			// TODO Bloc catch généré automatiquement
			e.printStackTrace();
		}
	}
}