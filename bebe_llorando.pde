Ojos bb;
import processing.sound.*;
SoundFile llorar;
SoundFile comer;

PImage bebe1, bebe2, bebe3, bebe4, cuchara, cucharallena;
String estado = "enojado";
int r = 50;
int posx = 250;
int posy = 285;
int tiempo = 0;
boolean comida = false;

void setup() {
  noCursor();
  size(800, 800);

  llorar = new SoundFile(this, "llorandoMolesto.wav");
  comer = new SoundFile(this, "comer.wav");

  bb = new Ojos();

  imageMode(CENTER);
  bebe1 = loadImage("bebeenojado2.png");
  bebe2 = loadImage("bebenormal1.png");
  bebe3 = loadImage("bebeenojado1.png");
  bebe4 = loadImage("bebelleno1.png");
  cuchara = loadImage("cucharavacia.png");
  cucharallena = loadImage("cucharallena.png");

  llorar.play();
  llorar.loop();
}

void draw() {
  background(255, 240, 165);

  bb.movimientoOjoIzq();
  bb.movimientoOjoDer();
  bb.dibujarOjos();
  if (estado=="normal") {
    image(bebe1, width/2, height/2, width, height);
  }
  if (estado=="lleno") {
    image(bebe2, width/2, height/2, width, height);
    tiempo+=1;
    llorar.stop();
 
  }
  if (tiempo>2) {
    background(255, 240, 165);
    bb.movimientoOjoIzq();
    bb.movimientoOjoDer();
    bb.dibujarOjos();
    image(bebe4, width/2, height/2, width, height);
       if(!comer.isPlaying()){
    comer.play();
    comer.loop();
    }
  }
  if (estado=="enojado") {
    image(bebe3, width/2, height/2, width, height);
    comer.stop();
    if(!llorar.isPlaying()){
     llorar.play();
     llorar.loop();
    }
  }

  if (!comida) {
    image (cuchara, mouseX, mouseY, 250, 150);
  }
  if (comida) {
    image (cucharallena, mouseX, mouseY, 250, 150);
  }

  if (mousePressed && comida) {
    if (mouseX > 300 && mouseX < 600 && mouseY > 350 && mouseY < 450) {
      estado="lleno";
      comida = false;
    }
  }
  if (tiempo==10) {
    estado="enojado";
    tiempo=0;
  }
  println(tiempo);
}

void mouseDragged() {

  if (mouseX > 400 && mouseX < 500 && mouseY > 650 && mouseY < 750) {
    comida = true;
  }
}
