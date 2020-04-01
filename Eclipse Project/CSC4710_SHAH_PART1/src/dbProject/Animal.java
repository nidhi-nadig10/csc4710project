package dbProject;
public class Animal {
	private String name;
	private String species;
	private String birthdate;
	private int price;
	private String traits;
	
	public Animal(String name, String species, String birthdate, int price, String traits) {
		super();
		this.name = name;
		this.species = species;
		this.birthdate = birthdate;
		this.price = price;
		this.traits = traits;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getSpecies() {
		return species;
	}
	
	public void setSpecies(String species) {
		this.species = species;
	}
	
	public String getBirthdate() {
		return birthdate;
	}
	
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTraits() {
		return traits;
	}
	
	public void getTraits(String traits) {
		this.traits = traits;
	}
}
