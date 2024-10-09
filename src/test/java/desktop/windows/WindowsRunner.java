package desktop.windows;

import com.intuit.karate.junit5.Karate;

public class WindowsRunner {
    @Karate.Test
    Karate testCalculator() {
    	return Karate.run("calculator").relativeTo(getClass());
    }
}
