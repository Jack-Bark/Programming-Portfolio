// Jack Barklow | 28 Nov 2022 | SpaceGame
import processing.sound.*;
SoundFile blaster;
SoundFile rock;
SoundFile spaceshiphit;
SpaceShip s1;
Timer rockTimer, powerupTimer;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
Star[] stars = new Star[100];
int score, level, rockCount, laserCount, rocksPassed;
boolean play;

void setup() {
  size(800, 800);
  blaster = new SoundFile(this, "blaster.wav");
  rock = new SoundFile(this, "rock.wav");
  spaceshiphit = new SoundFile(this, "spaceshiphit.wav");
  s1 = new SpaceShip();
  rockTimer = new Timer(1000);
  rockTimer.start();
  powerupTimer = new Timer(5000);
  powerupTimer.start();
  for (int i=0; i<stars.length; i++) {
    stars[i]= new Star();
  }
  score = 0;
  level = 1;
  rockCount = 0;
  laserCount = 0;
  rocksPassed = 0;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(0);
    frameRate(60);
    noCursor();

    //rendering stars
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }

    //distributing powerups
    if (powerupTimer.isFinished()) {
      powerups.add(new PowerUp());
      powerupTimer.start();
    }

    //distributing rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
    }

    //rendeering powerups
    for (int i = 0; i < powerups.size(); i++) {
      PowerUp pu = powerups.get(i);
      if (pu.intersect(s1)) {
        if (pu.type == 'H') {
          s1.health += 100;
        } else if (pu.type == 'A') {
          s1.ammo+=100;
        } else {
          s1.turretCount++;
        }
        powerups.remove(pu);
      }
        if (pu.reachedBottom()) {
          powerups.remove(pu);
        } else {
          pu.display();
          pu.move();
        }
      
    }

    //rendering rocks
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health-=r.diam;
        score-=r.diam;
        rocks.remove(r);
        spaceshiphit.stop();
        spaceshiphit.play();
      }
      if (r.reachedBottom()) {
        rocks.remove(r);
        rocksPassed++;
      } else {
        r.display();
        r.move();
      }
    }

    //laser add
    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (r.intersect(l)) {
          r.diam -= 50;
          if (r.diam < 10) {
            rocks.remove(r);
            rock.stop();
            rock.play();
            score += 100;
          }
          lasers.remove(l);
        }

        if (l.reachedTop()) {
          lasers.remove(l);
        } else {
          l.display();
          l.move();
        }
      }
    }

    //Ship render
    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();
    if (s1.health<1 || rocksPassed > 9) {
      gameOver();
    }
  }
}

void mousePressed () {
  handleEvent();
}

void keyPressed() {
  if (key == ' ')
    handleEvent();
}

void handleEvent() {
  if (s1.fire() && s1.turretCount == 1) {
    blaster.stop();
    blaster.play();
    lasers.add(new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 2) {
    blaster.stop();
    blaster.play();
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 3) {
    blaster.stop();
    blaster.play();
    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+10, s1.y));
    lasers.add(new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 4) {
    blaster.stop();
    blaster.play();
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+10, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 5) {
    blaster.stop();
    blaster.play();
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+10, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  }
}

void infoPanel() {
  fill(128, 127);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textSize(24);
  text(" SPACEGAME " + "Health: " + s1.health + " | Score: " + score + " | Ammo: " + s1.ammo + "Rocks Passed: " + rocksPassed, width/2, 40);
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("Click or press any key to start...", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("game over!", width/2, height/2);
  text("score: !", width/2, height/2+20);
  play = false;
  noLoop();
}
