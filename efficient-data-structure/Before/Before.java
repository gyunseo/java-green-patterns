import java.util.LinkedList;
import java.util.List;

public class Before {
    public static void main(String[] args) {
        List<Integer> list = new LinkedList<>();
        for (int i = 0; i < 1000000; i++) {
            list.add(i);
        }
    }
}
