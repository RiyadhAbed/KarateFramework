package sharks;

import com.github.javafaker.Faker;

public class DataGenerator {
  
	
	public static String getEmail() {
		Faker faker = new Faker();
		String email = faker.name().firstName()+ faker.name().lastName()+"@gmail.com";
		return email;
	}
	
	public static String getFirstName() {
		Faker faker = new Faker();
		String firstName = faker.name().firstName();
		return firstName;
	}
	public static String getLastName() {
		Faker faker = new Faker();
		String lastName = faker.name().lastName();
		return lastName;
				
	}
	public static String getTitle() {
		Faker faker = new Faker();
		String title = faker.name().title().toUpperCase();
		return title;
	}

	}
