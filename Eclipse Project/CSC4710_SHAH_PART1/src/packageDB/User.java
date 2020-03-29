package packageDB;

public class User {
	private static int UserID;
	private static String FName;
	private static String LName;
	private static String Username;
	private static String Password;
	
	public static void setLoginUserData(int userID, String fName, String lName,String username, String password) {
		UserID = userID;
		FName = fName;
		LName = lName;
		Username = username;
		Password = password;
	}
	
	public int getUserID() {
		return UserID;
	}
	
	public void setUsername(String s) {
		Username = s;
	}
	
	public String getUsername()
	{
		return Username;
	}
}