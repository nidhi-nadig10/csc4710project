package packageDB;

public class Animal {
	private static int Animalid;
	private static String Name;
	private static String Species;
	private static String Bday;
	private static float Price;
	private static String Traits;
	//private static int Userid;
	
	public static void setItemData(int animalid, String name, String species, String bday, float price, String traits) {
		Animalid = animalid;
		Name = name;
		Species = species;
		Bday = bday;
		Price = price;
		Traits = traits;
		//Userid=userid;
	}
	
	public int getAnimalID() {
		return Animalid;
	}
}
