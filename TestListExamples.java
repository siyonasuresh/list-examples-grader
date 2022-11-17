import static org.junit.Assert.*;
import org.junit.*;

public class TestListExamples {
  // Write your grading tests here!
  @Test 
	public void testFilter1() {
        ArrayList<String> input1 = new ArrayList<>();
        StringChecker sc = new StringChecker();
        input1.add(0, "apple");
        input1.add(1, "banana");
        input1.add(2, "citrus");
        assertEquals(input1, ListExamples.filter(input1, sc));
    }
  @Test 
	public void testFilter2() {
        ArrayList<String> input1 = new ArrayList<>();
        StringChecker sc = new StringChecker();
        input1.add(0, "apple");
        input1.add(2, "citrus");
        assertEquals(input1, ListExamples.filter(input1, sc));
    }
  @Test 
	public void testFilter3() {
        ArrayList<String> input1 = new ArrayList<>();
        StringChecker sc = new StringChecker();
        input1.add(0, "apple");
        assertEquals(input1, ListExamples.filter(input1, sc));
    }
}
