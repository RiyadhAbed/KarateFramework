package sharks;

import com.intuit.karate.junit5.*;

public class TestRunner { 
	
	@Karate.Test
	Karate testUsers() {
		return Karate.run().tags("@getAccount").relativeTo(getClass());
	
	}
	
}
