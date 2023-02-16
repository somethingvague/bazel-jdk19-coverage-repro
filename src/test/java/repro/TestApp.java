package repro;

import static org.junit.Assert.assertEquals;
import org.junit.Test;

/**
 * Tests for correct dependency retrieval with maven rules.
 */
public class TestApp {
    record TestRecord() {
    }

    @Test
    public void testCompare() {
        App app = new App();
        new TestRecord();
        assertEquals("should return 0 when both numbers are equal", 0, app.compare(1, 1));
    }

}
