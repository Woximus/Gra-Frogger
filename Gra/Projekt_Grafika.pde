Zabcia MojaZaba; 
float czasGry = 400;
int grid = 40; // kratka w gre
// Obiekty do gry
Auto auto1, auto2, auto3, auto4, auto5;
Kloda kloda1, kloda2, kloda3, kloda4; 
Lisc lisc1, lisc2,lisc3,lisc4,lisc5; 

// Obrazki
PImage imgZaba;
PImage imgAuto1, imgAuto2, imgAuto3;
PImage imgKloda1, imgKloda2, imgKloda3;
PImage imgLisc1, imgLisc2;

void setup() {
  size(400, 480); //wielkosc okna
  frameRate(60); // liczba klatek na sekunde
  
  //ladowanie zdjec
  imgZaba = loadImage("zaba.png");
  imgAuto1 = loadImage("auto1.png");
  imgAuto2 = loadImage("auto2.png");
  imgAuto3 = loadImage("auto3.png");
  imgKloda1 = loadImage("kloda1.png");
  imgKloda2 = loadImage("kloda2.png"); 
  imgKloda3 = loadImage("kloda3.png"); 
  imgLisc1 = loadImage("lisc1.png"); 
  imgLisc2 = loadImage("lisc2.png"); 

  // Gdzie tworza sie te obiekty
  MojaZaba = new Zabcia(200, 440, grid);
  
  auto1 = new Auto(0,   400,  3, 40, imgAuto1);
  auto2 = new Auto(200, 360,  2, 40, imgAuto2);
  auto3 = new Auto(50,  320, -3, 40, imgAuto3);
  auto4 = new Auto(300, 280, -4, 40, imgAuto1);
  auto5 = new Auto(200, 400, 3, 40, imgAuto3);
  
  // 1 rzad
  kloda1 = new Kloda(0,   80,  2, 120, imgKloda1); 
  kloda2 = new Kloda(200, 80,  2, 80,  imgKloda2); 
  
  // 2 rzad
  kloda3 = new Kloda(0,   160, 3, 100, imgKloda3);
  kloda4 = new Kloda(200, 160, 3, 100, imgKloda3);
  
  // 1 rzad
  lisc1 = new Lisc(0,   120, -2, imgLisc2);
  lisc2 = new Lisc(150, 120, -2, imgLisc2); 
  
  // 2 rzad
  lisc3 = new Lisc(0,   200, 1, imgLisc1);
  lisc4 = new Lisc(140, 200, 1, imgLisc1);
  lisc5 = new Lisc(280, 200, 1, imgLisc1);
}

void draw() {
  background(0); //tlo
  // Pasek dla ozdoby
  fill(0, 0, 150);
  rect(0, 0, 400, 40);
  
  // Woda
  fill(0, 0, 255); 
  rect(0, 80, 400, 160);   
  
  // Bezpieczna powierzchnia
  fill(100,0,100); 
  rect(0, 240, 400, 40);   
  
  //Start
  fill(100,0,100); 
  rect(0, 440, 400, 40);   
  
  boolean naBezpiecznym = false; 
  
  //Logika gry
  
  kloda1.jedz(); kloda1.rysuj(); if (MojaZaba.dotykaKlody(kloda1)) { MojaZaba.x += kloda1.speed; naBezpiecznym = true; }
  kloda2.jedz(); kloda2.rysuj(); if (MojaZaba.dotykaKlody(kloda2)) { MojaZaba.x += kloda2.speed; naBezpiecznym = true; }
  kloda3.jedz(); kloda3.rysuj(); if (MojaZaba.dotykaKlody(kloda3)) { MojaZaba.x += kloda3.speed; naBezpiecznym = true; }
  kloda4.jedz(); kloda4.rysuj(); if (MojaZaba.dotykaKlody(kloda4)) { MojaZaba.x += kloda4.speed; naBezpiecznym = true; }
  
  lisc1.jedz(); lisc1.rysuj(); if (MojaZaba.dotykaLiscia(lisc1) && lisc1.widoczny) { MojaZaba.x += lisc1.speed; naBezpiecznym = true; }
  lisc2.jedz(); lisc2.rysuj(); if (MojaZaba.dotykaLiscia(lisc2) && lisc2.widoczny) { MojaZaba.x += lisc2.speed; naBezpiecznym = true; }
  lisc3.jedz(); lisc3.rysuj(); if (MojaZaba.dotykaLiscia(lisc3) && lisc3.widoczny) { MojaZaba.x += lisc3.speed; naBezpiecznym = true; }
  lisc4.jedz(); lisc4.rysuj(); if (MojaZaba.dotykaLiscia(lisc4) && lisc4.widoczny) { MojaZaba.x += lisc4.speed; naBezpiecznym = true; }
  lisc5.jedz(); lisc5.rysuj(); if (MojaZaba.dotykaLiscia(lisc5) && lisc5.widoczny) { MojaZaba.x += lisc5.speed; naBezpiecznym = true; }

  //Smierc na wodzie to 240 i 80 czy jest na wysokosci rzeki
  if (MojaZaba.y < 240 && MojaZaba.y >= 80 && naBezpiecznym == false) {
      resetGry();
  }

  auto1.jedz(); auto1.rysuj(); if (MojaZaba.dotykaAuta(auto1)) resetGry();
  auto2.jedz(); auto2.rysuj(); if (MojaZaba.dotykaAuta(auto2)) resetGry();
  auto3.jedz(); auto3.rysuj(); if (MojaZaba.dotykaAuta(auto3)) resetGry();
  auto4.jedz(); auto4.rysuj(); if (MojaZaba.dotykaAuta(auto4)) resetGry();
  auto5.jedz(); auto5.rysuj(); if (MojaZaba.dotykaAuta(auto5)) resetGry();
 
  //Meta i czas
  rysujMete();
  
  czasGry = czasGry - 0.5; 
  // Lokalizacja czasu gry
  fill(255, 255, 0); rect(0, 460, czasGry, 20); 
  if (czasGry < 0) resetGry();

  MojaZaba.rysuj();
}

void rysujMete() {
  // Rysuje zielony kwadrat co 80 pixeli
  fill(0, 255, 0); 
  for (int i = 0; i < width; i = i + 80) {
    rect(i, 40, 40, 40);
  }
  
  // Logika mety
  if (MojaZaba.y < 80) { // jezeli wskoczyla na linie mety  
    if (MojaZaba.x % 80 != 0) {// sprawdza czy weszła w diure
       textSize(50); fill(255); text("WIN!", 150, 200); noLoop();// zaba nie moze wyzej bo system wygranej zablokuje
    } else {
       resetGry(); // Trafila w sciane
    }
  }
}

void resetGry() {
   println("ŚMIERĆ!");
   // cofa zabe na poczatek i resetuje czas
   MojaZaba.x = 200; 
   MojaZaba.y = 440; 
   czasGry = 400;
}
//chodzenie 
void keyPressed() {
  if (keyCode == UP) MojaZaba.y -= 40;
  if (keyCode == DOWN) MojaZaba.y += 40;
  if (keyCode == LEFT) MojaZaba.x -= 40;
  if (keyCode == RIGHT) MojaZaba.x += 40;
  // Ograniczenie ruchu
  MojaZaba.x = constrain(MojaZaba.x, 0, width-40);
  MojaZaba.y = constrain(MojaZaba.y, 40, height-40); // nie mozna na y=0
}
//Klasy
class Zabcia {
  float x, y, w; // x-lewo,prawo, y- gora,dol, w-szerokosc,wysokosc to jest to grid
  Zabcia(float x, float y, float w) { this.x = x; this.y = y; this.w = w; } //konstruktor i uzupelnainie za pomoca this
  void rysuj() { image(imgZaba, x, y, w, w); } // stowrzenie obrazaka w tym miejscu
  //czy lewa sciana jest na lewo od prawej strony auta, potem czy prawa sciana jest na prawo od lewej, gora zaby jest wyzej niz dol auta , dol zaby  jest nizej niz gora auta
  boolean dotykaAuta(Auto a) { return x < a.x + a.w && x + w > a.x && y < a.y + 40 && y + w > a.y; } // x-lewa sciana, x+w-prawa sciana, y-sufit, y+w-podloga (zaby wszystko)
  boolean dotykaKlody(Kloda k) { return x < k.x + k.w && x + w > k.x && y < k.y + 40 && y + w > k.y; }
  boolean dotykaLiscia(Lisc l) { return x < l.x + 40 && x + w > l.x && y < l.y + 40 && y + w > l.y; }
} 

class Auto {
  float x, y, speed, w; //x,y - wspolrzedne, spped-szybkosc,w-szerokosc
  PImage wyglad;
  Auto(float x, float y, float speed, float w, PImage img) {
    this.x = x; this.y = y; this.speed = speed; this.w = w;
    this.wyglad = img; 
  }
  void jedz() {
    x += speed;
    //Gdy wyjedzie sie poza ekran
    if (x > width) x = -w;
    if (x < -w) x = width;
  }
  void rysuj() { image(wyglad, x, y, w, 40); }
}

class Kloda {
  float x, y, speed, w; //tak samo jak wyzej
  PImage wyglad;
  Kloda(float x, float y, float speed, float w, PImage img) {
    this.x = x; this.y = y; this.speed = speed; this.w = w;
    this.wyglad = img;
  }
  void jedz() {
    x += speed;
    //gdy wyjedzie sie poza ekran
    if (x > width) x = -w;
    if (x < -w) x = width;
  }
  void rysuj() { image(wyglad, x, y, w, 40); }
}

class Lisc {
  float x, y, speed;
  PImage wyglad; 
  boolean widoczny = true; // true-na , flase - pod woda
  int licznik; 
  
  Lisc(float x, float y, float speed, PImage img) { 
    this.x = x; this.y = y; this.speed = speed; 
    this.wyglad = img; 
    this.licznik = (int)random(0, 600); // dzieki radom znikaja roznie
  }
  
  void jedz() {
    x += speed;
    if (x > width) x = -40; if (x < -40) x = width;
    licznik++;
    if (licznik % 600 < 450) { widoczny = true; } 
    else { widoczny = false; }
  }
  
  void rysuj() {
    if (widoczny) { image(wyglad, x, y, 40, 40); } 
    //gdy znika
    else { fill(0, 0, 100); ellipse(x+20, y+20, 10, 10); }
  }
}
