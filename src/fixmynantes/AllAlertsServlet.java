package fixmynantes;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.SortDirection;

@SuppressWarnings("serial")
public class AllAlertsServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		try {
			DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
			
			 // Demande tous les 3 derniers messages triés par date décroissante
          Query q = new Query("Incident").setAncestor(KeyFactory.createKey("TousIncidents","ListIncidents")).addSort("Date", SortDirection.DESCENDING);
          List<Entity> results = datastore.prepare(q).asList(FetchOptions.Builder.withOffset(0));

          req.setAttribute("incidents", results);
			this.getServletContext().getRequestDispatcher( "/WEB-INF/allalerts.jsp" ).forward( req, resp );
		} catch (ServletException e) {
			// TODO Bloc catch généré automatiquement
			e.printStackTrace();
		}
	}
}