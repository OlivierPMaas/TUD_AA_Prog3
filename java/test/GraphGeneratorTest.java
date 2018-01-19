import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class GraphGeneratorTest {

    @Test
    void Test1() {
        String[] amounts = {"5", "10", "15", "20", "25", "30", "35", "40", "45", "50",
                "55", "60", "65", "70", "75", "80", "85", "90", "95", "100"};
        String[] probabilities = {"0.5", "1"};
        String[] weights = {"1", "5", "10", "50", "100"};
        String[] ids = {"1", "2", "3", "4"};
        for(String amount : amounts) {
            for(String p : probabilities) {
                for(String maxweight : weights) {
                    for(String id : ids) {
                        String[] args = {amount, p, maxweight, id};
                        GraphGenerator.main(args);
                    }
                }
            }
            System.out.println("Finished amount " + amount);
        }
    }
}