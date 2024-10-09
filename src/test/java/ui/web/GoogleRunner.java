package ui.web;

import com.intuit.karate.junit5.Karate;

public class GoogleRunner {
    @Karate.Test
    Karate testSearch() {
    	return Karate.run("search").relativeTo(getClass());
    }
}
