import java.util.Random;

interface Displayable {
  void display();
}

interface Moveable {
  void move();
}

PImage ROCK;

abstract class Thing implements Displayable {
  float x, y;//Position of the Thing

  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  }
  abstract void display();
}

class Rock extends Thing {
  Rock(float x, float y) {
    super(x, y);
  }

  void display() {
    image(ROCK, x, y, width/10, height/10);
  }
}

class LivingRock extends Rock implements Moveable {
  LivingRock(float x, float y) {
    super(x, y);
  }

  void move() {
    /* ONE PERSON WRITE THIS - Kevin Li */
    super.x += randgen(-20, 20);
    super.y += randgen(-20, 20);
  }

  int randgen(int min, int max) {
    Random r = new Random();
    return r.nextInt((max - min) + 1) + min;
  }
}

class Ball extends Thing implements Moveable {
  Ball(float x, float y) {

    super(x, y);
  }

  void display() {
          fill(255);
          circle(x, y, 20);
  }

  void move() {
    y = y + 5;
  }
}

/*DO NOT EDIT THE REST OF THIS */

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;

void setup() {
  size(1000, 800);
  PImage[] rocks = new PImage[2];
  rocks[0] = loadImage("rock.png");
  rocks[1] = loadImage("rock2.png");
  ROCK = rocks[(int) Math.floor(Math.random() * 2)];

  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  for (int i = 0; i < 10; i++) {
    Ball b = new Ball(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    Rock r = new Rock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(r);
  }
  for (int i = 0; i < 3; i++) {
    LivingRock m = new LivingRock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(m);
    thingsToMove.add(m);
  }
}
void draw() {
  background(255);

  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
  for (Moveable thing : thingsToMove) {
    thing.move();
  }
}