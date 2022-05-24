class Ojos {
  PImage ojoizq, ojoder;
  float mxizq, myizq;
  float mxder, myder;

  Ojos() {
    ojoizq = loadImage("ojo2.png");
    ojoder = loadImage("ojo2.png");
  }

  void dibujarOjos() {
    //rectMode(CENTER);
    fill(255);
  }

  void movimientoOjoIzq() {
    mxizq=  constrain(mouseX, 280, 340);
    myizq = constrain(mouseY, 180, 250);
    rect(230, 150, 150, 200);
    image(ojoizq, mxizq, myizq, 75, 100);
  }
  void movimientoOjoDer() {
    mxder=  constrain(mouseX, 450, 520);
    myder = constrain(mouseY, 180, 250);
    rect(400, 140, 150, 200);
    image(ojoder, mxder, myder, 75, 100);
  }
}
