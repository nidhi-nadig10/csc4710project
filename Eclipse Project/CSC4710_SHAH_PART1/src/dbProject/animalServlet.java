package dbProject;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/animalServlet")
public class animalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		listAnimal(request, response);
    }
    
    private void listAnimal(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AnimalDAO dao = new AnimalDAO();
 
        try {
 
            List<Animal> listAnimal = dao.list();
            request.setAttribute("listAnimal", listAnimal);
 
            RequestDispatcher dispatcher = request.getRequestDispatcher("search_animal.jsp");
            dispatcher.forward(request, response);
 
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
       
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    	throws ServletException, IOException {
    		String postTrait = request.getParameter("selectTrait");
    		
    		request.setAttribute("selectTrait", postTrait);
    		
    		listAnimal(request, response);
    	}
    }
