class Bullet {
    boolean inUse;

    // 총알 관련 속성과 메소드
    public Bullet() {
        // 총알 만들면 쏜다
        inUse = true;
        try {
            Thread.sleep(0);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}

class Gun {
    public Bullet fire() {
        Bullet bullet = new Bullet(); // 총알 발사 시 새로운 객체 생성
        return bullet;
        // 총알 발사 로직
    }
}

public class Before {
    public static void main(String[] args) {
        Gun gun = new Gun();
        for (int i = 0; i < 1000000; i++) {
            gun.fire();
        }
    }

}
