import java.util.ArrayList;
import java.util.List;

class HeavyResource {
    private List<Object> objectList;

    public HeavyResource() {
        // 많은 수의 객체 생성
        objectList = new ArrayList<Object>();
        for (int i = 0; i < 1000; i++) {
            objectList.add(new Object());
        }
    }
    // 매우 무거운 자원
}

class Example {
    private HeavyResource resource;

    public Example() {
        // 생성자
    }

    public HeavyResource getResource() {
        if (resource == null) {
            resource = new HeavyResource();
        }
        return resource;
    }
    // 다른 메소드 및 필드
}

public class After {

    public static void main(String[] args) {
        for (int i = 0; i < 1000000; i++) {
            Example example = new Example();

            // 무거운 작업
        }
        // 다른 작업
    }

}