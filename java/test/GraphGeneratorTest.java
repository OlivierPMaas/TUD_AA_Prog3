import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class GraphGeneratorTest {

    @Test
    void Test1() {
        String[] args = {"5", "0.5", "4", "1"};
        GraphGenerator.main(args);
    }
}