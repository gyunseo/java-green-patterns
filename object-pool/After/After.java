import java.util.ArrayList;
import java.util.List;

class Bullet {
    public boolean inUse;

    // 총알 관련 속성과 메소드
    public Bullet() {
        this.inUse = false;
        try {
            Thread.sleep(0);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void reset() {
        // 총알 상태 초기화
        inUse = false;
    }
}

class BulletPool {
    private List<Bullet> availableBullets;

    public BulletPool() {
        availableBullets = new ArrayList<Bullet>(100);
        for (int i = 0; i < 100; i++) {
            availableBullets.add(new Bullet()); // 총알을 미리 생성
        }
    }

    public Bullet getBullet() {
        if (availableBullets.isEmpty()) {
            return new Bullet(); // 사용 가능한 총알이 없으면 새로 생성
        } else {
            Bullet bullet = availableBullets.remove(availableBullets.size() - 1);
            bullet.inUse = true;
            return bullet; // 사용 가능한 총알 반환
        }
    }

    public void releaseBullet(Bullet bullet) {
        bullet.reset();
        availableBullets.add(bullet); // 총알을 풀에 반환
    }
}

class Gun {
    BulletPool bulletPool = new BulletPool();

    public void fire() {
        Bullet bullet = bulletPool.getBullet(); // 총알 풀에서 총알 가져오기
        // 총알 발사 로직
        // 발사가 끝난 후
        bulletPool.releaseBullet(bullet); // 총알을 풀에 반환
    }
}

public class After {
    public static void main(String[] args) {
        Gun gun = new Gun();
        for (int i = 0; i < 1000000; i++) {
            gun.fire();
        }
    }
}