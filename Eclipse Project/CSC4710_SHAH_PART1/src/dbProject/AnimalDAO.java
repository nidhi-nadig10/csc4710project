package dbProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AnimalDAO {
	String databaseURL = "jdbc:mysql://localhost:3306/dogAdoptionDB?";
	String user = "john";
	String password = "pass1234";
	
	public List<Animal> list() throws SQLException {
		List<Animal> listAnimal = new ArrayList<>();
		
		try (Connection connection = DriverManager.getConnection(databaseURL, user, password)) {
			String sql = "SELECT * FROM animals where traits = ?";
			
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			
			while (rs.next()) {
				String name = rs.getString("name");
				String species = rs.getString("species");
				String birthdate = rs.getString("birthdate");
				int price = rs.getInt("price");
				String traits = rs.getString("traits");
				
				Animal animal = new Animal(name, species, birthdate, price, traits);
				
				listAnimal.add(animal);
			}
		}
		catch (SQLException ex) {
			ex.printStackTrace();
			throw ex;
		}
		
		return listAnimal;
	}

}
