import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;
import java.sql.Statement;
//import java.util.ArrayList;
//import java.util.List;

/**
 * Servlet implementation class Connect
 */
@WebServlet("/connectDB")
public class connectDB extends HttpServlet {     
	private static final long serialVersionUID = 1L;
	private Connection connect = null;
	private Statement statement = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
	
	
	
	public connectDB() {

    }
	       
    /**
     * @see HttpServlet#HttpServlet()
     */
    protected void connect_func() throws SQLException {
        if (connect == null || connect.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            connect = (Connection) DriverManager
  			      .getConnection("jdbc:mysql://localhost:3306/dogAdoptionDB?"
  					       + "user=john&password=pass1234");
            System.out.println(connect);
        }
    }
    
    public void createUsersTable() throws SQLException{   
    	
    	//USER TABLE
    	connect_func();
    	String dropTablesSQL = "DROP TABLE IF EXISTS USERS;";
    	preparedStatement = (PreparedStatement) connect.prepareStatement(dropTablesSQL);
    	preparedStatement.executeUpdate();
    	System.out.println("Tables dropped succesfully.");
    	
    	
		String tableCreationSQL = " CREATE TABLE USERS (\r\n" + 
				"   username varchar(255), 	\r\n" + 
				"   pw varchar(255),\r\n" + 
				"   firstname varchar(255),\r\n" + 
				"   lastname varchar(255),\r\n" + 
				"   email varchar(255),\r\n" + 		
				"   PRIMARY KEY(username)\r\n" + 
				");\r\n" + 
				"";
			connect_func();   
			preparedStatement = (PreparedStatement) connect.prepareStatement(tableCreationSQL);
			preparedStatement.executeUpdate();
    
		
			String dataInsertionSQL = "insert into users (username,pw,firstname,lastname,email)\r\n" + 
			"values('root','pass1234','rootuser','admin','root@admin.com'),\r\n" + 
			"('darpanshah','darpanpass','Darpan','Shah','gg2002@wayne.edu'),\r\n" + 
			"('nidhinadig','nidhipass','Nidhi','Nadig','gh6210@wayne.edu'),\r\n" + 
			"('ctwoof','coreypass','Corey','Tessler','woofwoof@bark.com'),\r\n" + 
			"('champagnepapi','ovo','Aubrey','Graham','drizzy@drake.com');";
			
			preparedStatement = (PreparedStatement) connect.prepareStatement(dataInsertionSQL);
			preparedStatement.executeUpdate();
			System.out.println("Users created succesfully.");
			//connect.close();
			
			//ANIMALS TABLE
			connect_func();
	    	dropTablesSQL = "DROP TABLE IF EXISTS ANIMALS;";
	    	preparedStatement = (PreparedStatement) connect.prepareStatement(dropTablesSQL);
	    	preparedStatement.executeUpdate();
	    	System.out.println("Tables dropped succesfully.");
	    	
	    	
			 tableCreationSQL = " CREATE TABLE ANIMALS (\r\n" + 
					"   id INT NOT NULL auto_increment, \r\n" + 
					"   name varchar(255), 	\r\n" + 
					"   species varchar(255),\r\n" + 
					"   birthdate date,\r\n" + 
					"   price float,\r\n" + 
					"   traits varchar(255),\r\n" + 
					" review varchar(255),\r\n" +
					"   PRIMARY KEY(id)\r\n" + 
					");\r\n" + 
					"";
				connect_func();   
				preparedStatement = (PreparedStatement) connect.prepareStatement(tableCreationSQL);
				preparedStatement.executeUpdate();
	    
				dataInsertionSQL = "insert into ANIMALS (name,species,birthdate,price,traits)\r\n" + 
				"values('Fido','Dog','2019/10/23','200','happy,slobbery,wiggly'),\r\n" + 
				"('Remy','Rat','1986/10/31','50','dirty,adventurous,wiggly'),\r\n" + 
				"('Peppa','Pig','1999/08/10','1000000','sexy,flawless'),\r\n" + 
				"('Stuart Little','Mouse','2004/03/27','5000','adventurous, wiggly'),\r\n" + 
				"('Cat in the Hat','Cat','2000/08/16','200','adventurous,fluffy'),\r\n" + 
				"('Sher Khan','Tiger','1999/05/11','1000','angry,feisty'),\r\n" + 
				"('Baloo','Bear','2002/01/27','8000','energetic, sleepy'),\r\n" +
				"('Bagheera','Panther','2005/10/20','6000','fast'),\r\n" +
				"('Sonic','Hedgehog','2008/02/20','9000','fast,spiky'),\r\n" +
				"('Scooby','Dog','2003/11/11','125000','funny, dumb, hungry')";
				
				preparedStatement = (PreparedStatement) connect.prepareStatement(dataInsertionSQL);
				preparedStatement.executeUpdate();
				System.out.println("Animals created succesfully.");
				
				//TRAITS TABLE
				connect_func();
				dropTablesSQL = "DROP TABLE IF EXISTS TRAITS;";
		    	preparedStatement = (PreparedStatement) connect.prepareStatement(dropTablesSQL);
		    	preparedStatement.executeUpdate();
		    	System.out.println("Tables dropped succesfully.");
		    	
		    	
		    	tableCreationSQL = " CREATE TABLE TRAITS (\r\n" + 
						"   traitList varchar(255)" + 
						");\r\n" + 
						"";
					connect_func();   
					preparedStatement = (PreparedStatement) connect.prepareStatement(tableCreationSQL);
					preparedStatement.executeUpdate();

					 dataInsertionSQL = "insert into traits (traitList)\r\n" + 
					"values('adventurous'),\r\n" + 
					"('happy'),\r\n" + 
					"('slobbery'),\r\n" + 
					"('wiggly'),\r\n" + 
					"('dirty');";
					
					preparedStatement = (PreparedStatement) connect.prepareStatement(dataInsertionSQL);
					preparedStatement.executeUpdate();
					System.out.println("Users created succesfully.");
				
					
				//USER ANIMALS TABLE	
				connect_func();
		    	dropTablesSQL = "DROP TABLE IF EXISTS USERANIMALS;";
		    	preparedStatement = (PreparedStatement) connect.prepareStatement(dropTablesSQL);
		    	preparedStatement.executeUpdate();
		    	System.out.println("Tables dropped succesfully.");
		    	
		    	
				 tableCreationSQL = " CREATE TABLE USERANIMALS (\r\n" + 
						"   id INT NOT NULL auto_increment, \r\n" +
						"   name varchar(255), 	\r\n" + 
						"   species varchar(255),\r\n" + 
						"   birthdate date,\r\n" + 
						"   price float,\r\n" + 
						"   traits varchar(255),\r\n" + 		
						"   PRIMARY KEY(id)\r\n" + 
						");\r\n" + 
						"";
					connect_func();   
					preparedStatement = (PreparedStatement) connect.prepareStatement(tableCreationSQL);
					preparedStatement.executeUpdate();
				
				//REVIEWS TABLE	
				connect_func();
		    	dropTablesSQL = "DROP TABLE IF EXISTS REVIEWS;";
		    	preparedStatement = (PreparedStatement) connect.prepareStatement(dropTablesSQL);
		    	preparedStatement.executeUpdate();
		    	System.out.println("Review table dropped succesfully.");
		    	
		    	
				 tableCreationSQL = " CREATE TABLE REVIEWS (\r\n" + 
						"   id INT NOT NULL auto_increment, \r\n" +
						"   rating varchar(255), 	\r\n" + 
						"   review varchar(255),\r\n" + 		
						"   PRIMARY KEY(id)\r\n" + 
						");\r\n" + 
						"";
					connect_func();   
					preparedStatement = (PreparedStatement) connect.prepareStatement(tableCreationSQL);
					preparedStatement.executeUpdate();
					
				//FAVORITE BREEDERS TABLE
				connect_func();
		    	dropTablesSQL = "DROP TABLE IF EXISTS FAVBREEDERS;";
		    	preparedStatement = (PreparedStatement) connect.prepareStatement(dropTablesSQL);
		    	preparedStatement.executeUpdate();
		    	System.out.println("Breeders dropped succesfully.");
		    	
		    	
				 tableCreationSQL = " CREATE TABLE FAVBREEDERS (\r\n" + 
						"   id INT NOT NULL auto_increment, \r\n" +
						"   favUser varchar(255), 	\r\n" + 		
						"   PRIMARY KEY(id)\r\n" + 
						");\r\n" + 
						"";
					connect_func();   
					preparedStatement = (PreparedStatement) connect.prepareStatement(tableCreationSQL);
					preparedStatement.executeUpdate();
					
					dataInsertionSQL = "insert into FAVBREEDERS (favUser)\r\n" + 
							"values('Aubrey'),\r\n" + 
							"('Darpan'),\r\n" + 
							"('Nidhi')";
							
							preparedStatement = (PreparedStatement) connect.prepareStatement(dataInsertionSQL);
							preparedStatement.executeUpdate();
							System.out.println("Breeders created succesfully.");
					
				//FAVORITE ANIMALS TABLE
				connect_func();
		    	dropTablesSQL = "DROP TABLE IF EXISTS FAVANIMALS;";
		    	preparedStatement = (PreparedStatement) connect.prepareStatement(dropTablesSQL);
		    	preparedStatement.executeUpdate();
		    	System.out.println("Favorite Animals dropped succesfully.");
		    	
		    	
				 tableCreationSQL = " CREATE TABLE FAVANIMALS (\r\n" + 
						"   id INT NOT NULL auto_increment, \r\n" +
						"   favAnimal varchar(255), 	\r\n" + 		
						"   PRIMARY KEY(id)\r\n" + 
						");\r\n" + 
						"";
					connect_func();   
					preparedStatement = (PreparedStatement) connect.prepareStatement(tableCreationSQL);
					preparedStatement.executeUpdate();
					
					dataInsertionSQL = "insert into FAVANIMALS (favAnimal)\r\n" + 
							"values('Fido'),\r\n" + 
							"('Remy'),\r\n" + 
							"('Baloo')";
							
							preparedStatement = (PreparedStatement) connect.prepareStatement(dataInsertionSQL);
							preparedStatement.executeUpdate();
							System.out.println("Favorite Animals created succesfully.");
				
				connect.close();
			
			return;
    
    	}
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		connectDB dbConnection = new connectDB();
		try {
			createUsersTable();
			response.sendRedirect("user_reg.jsp");
		
		}catch (Exception e) {
			System.out.println(e);
		}
	}

	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doGet(request, response);
	    }
	/*
    public List<User> listAllUsers() throws SQLException {
        List<User> listUsers = new ArrayList<User>();        
        String sql = "SELECT * FROM username";      
        connect_func();      
        statement =  (Statement) connect.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
         
        while (resultSet.next()) {
            String username = resultSet.getString("username");
            String password = resultSet.getString("pw");
            String firstName = resultSet.getString("firstname");
            String lastName = resultSet.getString("lastname");
            String email = resultSet.getString("email");
             
            User user = new User(username,password,firstName,lastName,email);
            listUsers.add(user);
        }        
        resultSet.close();
        statement.close();         
        disconnect();        
        return listUsers;
    } 
    
    protected void disconnect() throws SQLException {
        if (connect != null && !connect.isClosed()) {
        	connect.close();
        }
    }
         
    public boolean insert(User user) throws SQLException {
    	connect_func();         
		String sql = "insert into  users(username, pw, firstname, lastname, email) values (?, ?, ?, ?, ?)";
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
		preparedStatement.setString(1, user.username);
		preparedStatement.setString(2, user.password);
		preparedStatement.setString(3, user.firstName);
		preparedStatement.setString(4, user.lastName);
		preparedStatement.setString(5, user.email);


//		preparedStatement.executeUpdate();
		
        boolean rowInserted = preparedStatement.executeUpdate() > 0;
        preparedStatement.close();
//        disconnect();
        return rowInserted;
    }     
     
    public boolean delete(String username) throws SQLException {
        String sql = "DELETE FROM student WHERE username = ?";        
        connect_func();
         
        preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
        preparedStatement.setInt(1, username);
         
        boolean rowDeleted = preparedStatement.executeUpdate() > 0;
        preparedStatement.close();
//        disconnect();
        return rowDeleted;     
    }
     
    public boolean update(User user) throws SQLException {
        String sql = "update users set firstname=?, lastname =?,username = ? where email = ?";
        connect_func();
        
        preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
        preparedStatement.setString(1, user.firstname);
        preparedStatement.setString(2, user.lastname);
        preparedStatement.setString(3, user.username);
        preparedStatement.setInt(4, user.email);
         
        boolean rowUpdated = preparedStatement.executeUpdate() > 0;
        preparedStatement.close();
//        disconnect();
        return rowUpdated;     
    } */
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response) */
	 
	/*
	
    public User getUser(String email) throws SQLException {
    	User user = null;
        String sql = "SELECT * FROM student WHERE email = ?";
         
        connect_func();
         
        preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
        preparedStatement.setEmail(1, email);
         
        ResultSet resultSet = preparedStatement.executeQuery();
         
        if (resultSet.next()) {
            String username = resultSet.getString("username");
            String password = resultSet.getString("pw");
            String firstName = resultSet.getString("firstname");
            String lastName = resultSet.getString("lastname");
                      
            user = new User(username, password, firstName, lastName, email);
        }
         
        resultSet.close();
        statement.close();
         
        return user;
      } */
      
} 
