package fixmynantes;

import java.io.IOException;
import java.text.DateFormat;
import java.util.List;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.*;
import com.google.appengine.api.datastore.Query.SortDirection;
import com.google.appengine.api.blobstore.*;
import com.google.appengine.api.images.*;

@SuppressWarnings("serial")
public class ReportProblemServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		try {
			DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
			
			 // Demande tous les 3 derniers messages triés par date décroissante
            Query q = new Query("Incident").setAncestor(KeyFactory.createKey("TousIncidents","ListIncidents")).addSort("Date", SortDirection.DESCENDING);
            List<Entity> results = datastore.prepare(q).asList(FetchOptions.Builder.withLimit(3));

            req.setAttribute("incidents", results);
			
			this.getServletContext().getRequestDispatcher( "/WEB-INF/reportproblem.jsp" ).forward( req, resp );
		} catch (ServletException e) {
			// TODO Bloc catch généré automatiquement
			e.printStackTrace();
		}
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		try {
			DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
			BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
			ImagesService imagesService = ImagesServiceFactory.getImagesService(); // Récupération du service d'images
			
			String urlImage = null;
			
			Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
			
	        List<BlobKey> blobKeys = blobs.get("Photo");
			
			if (blobs.get("Photo")!=null){
				BlobKey blobKey = blobKeys.get(0);
				 BlobInfo blobInfo = new BlobInfoFactory().loadBlobInfo(blobKey);
				 if (blobInfo.getSize() > 0) {
					// Récupération de l'URL de l'image
				        urlImage = imagesService.getServingUrl(ServingUrlOptions.Builder.withBlobKey(blobKeys.get(0)));
				 } else {
				  blobstoreService.delete(blobKey);
				 }
				
			}
			
				
			
			//Stocke le message posté
			Entity incident = new Entity("Incident", KeyFactory.createKey("TousIncidents","ListIncidents"));
			
			incident.setProperty("Sujet", req.getParameter("Sujet"));
			incident.setProperty("Adresse", req.getParameter("Adresse"));
			incident.setProperty("Categorie", req.getParameter("Categorie"));
			incident.setProperty("Photo", urlImage);
			incident.setProperty("Description", req.getParameter("Description"));
			Date date = new Date();
			DateFormat dfl = DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.MEDIUM);
			incident.setProperty("Date", dfl.format(date));
			
			datastore.put(incident);
			
			resp.sendRedirect( "/fixmynantes/reportproblem" );
		} catch (IOException e) {
			// TODO Bloc catch généré automatiquement
			e.printStackTrace();
		}
	}
}