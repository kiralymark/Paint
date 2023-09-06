import java.util.LinkedList;
import java.util.Queue;

//KITÖLTŐ ESZKÖZ
int fx=0, fy=0, fx1=0, fy1=0;
int[][] d={{1, 0}, {0, 1}, {-1, 0}, {0, -1}};    //distance measure

Queue<Integer> qx=new LinkedList();
Queue<Integer> qy=new LinkedList();

int Bsize=10;    //GLOBAL VARIABLE (size of all drawing tools)
int BCol;        //color of all drawing tools

int keyCol1;    //Shortcuts for colors
int keyCol2;
int keyCol3;
int keyCol4;
int keyCol5;
int keyCol6;
int keyCol7;
int keyCol8;

//images for the buttons
PImage button1;    
PImage button2;
PImage button3;
PImage button4;
PImage button5;
PImage button6;

PImage colorPalette;

// brush, eraser, FILL TOOL, line, rectangle, circle, palette , COLORDISPLAY

Button b1;
Button b2;
Button b3;
Button b4;
Button b5;
Button b6;

ColorDisplay cd;

ToolBox tb;    //interface on top of the screen

//Tools selection
boolean Bactive1 = true;    
boolean Bactive2 = false;
boolean Bactive3 = false;
boolean Bactive4 = false;
boolean Bactive5 = false;
boolean Bactive6 = false;

boolean BColor = false;  //ColorDisplay button

PGraphics extraCanvas1;  // Canvas to draw on      !!
PGraphics extraCanvas2; // Shape Preview           !!!

void setup() {
  //fullScreen(P2D);
  size(1024, 642, P2D);

  button1 = loadImage("brushtool.png");
  button2 = loadImage("eraser.png");  
  button3 = loadImage("line.png");    
  button4 = loadImage("rect.png");
  button5 = loadImage("circle.png");
  button6 = loadImage("bucket.png");

  colorPalette = loadImage("colors.jpg");

  extraCanvas1 = createGraphics(1024, 642, P2D);    //Permanent canvas
  extraCanvas2 = createGraphics(1024, 642, P2D);    //Temporary shape display canvas

  extraCanvas1.beginDraw();
  extraCanvas1.clear();
  extraCanvas1.endDraw();

  extraCanvas2.beginDraw();
  extraCanvas2.clear();
  extraCanvas2.endDraw();

  b1 = new Button(button1, 100, 8, 50);
  b2 = new Button(button2, 175, 8, 50);
  b3 = new Button(button3, 250, 8, 50);   
  b4 = new Button(button4, 325, 8, 50);
  b5 = new Button(button5, 400, 8, 50); 
  b6 = new Button(button6, 475, 8, 50); 

  cd = new ColorDisplay(50, 550, 8, 50, colorPalette);

  tb = new ToolBox();  //Gray interface box On Top

  keyCol1 = color(255, 0, 0);       //piros;
  keyCol2 = color(255, 255, 0);     //sárga
  keyCol3 = color(0, 255, 0);       //zöld
  keyCol4 = color(0, 90, 0 );       //sötétzöld
  keyCol5 = color(0, 255, 255);     //türkisz
  keyCol6 = color(0, 0, 255 );      //kék
  keyCol7 = color(255, 0, 255);     //lila
  keyCol8 = color(150, 50, 0);      //barna
  
  BCol = 1;  //'Bug' elkerüléshez
  
}

void draw() {
  background(255);  //!!!! 

  image(extraCanvas1, 0, 0);  //to display the extra canvases
  image(extraCanvas2, 0, 0);

  //BUTTON FUNCTIONALITY
  if (Bactive1) {
    b1.highlight();
    b2.revoke();
    b3.revoke();
    b4.revoke();
    b5.revoke();
    b6.revoke();
    cd.revoke();
  }
  if (Bactive2) {
    b2.highlight();
    b1.revoke();
    b3.revoke();
    b4.revoke();
    b5.revoke();
    b6.revoke();
    cd.revoke();
  }
  if (Bactive3) {
    b3.highlight();
    b2.revoke();
    b1.revoke();
    b4.revoke();
    b5.revoke();
    b6.revoke();
    cd.revoke();
  }
  if (Bactive4) {
    b4.highlight();
    b2.revoke();
    b3.revoke();
    b1.revoke();
    b5.revoke();
    b6.revoke();
    cd.revoke();
  }
  if (Bactive5) {
    b5.highlight();
    b2.revoke();
    b3.revoke();
    b4.revoke();
    b1.revoke();
    b6.revoke();
    cd.revoke();
  }
  if (Bactive6) {
    b6.highlight();
    b5.revoke();
    b2.revoke();
    b3.revoke();
    b4.revoke();
    b1.revoke();
    cd.revoke();
  }

  tb.display();        //TOOLBOX

  if (BColor) {
    cd.highlight();
    b1.revoke();
    b2.revoke();
    b3.revoke();
    b4.revoke();
    b5.revoke();
    b6.revoke();
  }

  // Az adott gombok érzékelése
  if (mouseX>b1.x && mouseX<b1.x + b1.size && mouseY>b1.y && mouseY<b1.y + b1.size ) {
    if (mousePressed==true) {
      Bactive1 = true;
      Bactive2 = false;
      Bactive3 = false;
      Bactive4 = false;
      Bactive5 = false;
      Bactive6 = false;
      BColor = false;
    }
  }
  if (mouseX>b2.x && mouseX<b2.x + b2.size && mouseY>b2.y && mouseY<b2.y + b2.size ) {
    if (mousePressed==true) {
      Bactive1 = false;
      Bactive2 = true;
      Bactive3 = false;
      Bactive4 = false;
      Bactive5 = false;
      Bactive6 = false;
      BColor = false;
    }
  }
  if (mouseX>b3.x && mouseX<b3.x + b3.size && mouseY>b3.y && mouseY<b3.y + b3.size ) {
    if (mousePressed==true) {
      Bactive1 = false;
      Bactive2 = false;
      Bactive3 = true;
      Bactive4 = false;
      Bactive5 = false;
      Bactive6 = false;
      BColor = false;
    }
  }
  if (mouseX>b4.x && mouseX<b4.x + b4.size && mouseY>b4.y && mouseY<b4.y + b4.size ) {
    if (mousePressed==true) {
      Bactive1 = false;
      Bactive2 = false;
      Bactive3 = false;
      Bactive4 = true;
      Bactive5 = false;
      Bactive6 = false;
      BColor = false;
    }
  }
  if (mouseX>b5.x && mouseX<b5.x + b5.size && mouseY>b5.y && mouseY<b5.y + b5.size ) {
    if (mousePressed==true) {
      Bactive1 = false;
      Bactive2 = false;
      Bactive3 = false;
      Bactive4 = false;
      Bactive5 = true;
      Bactive6 = false;
      BColor = false;
    }
  }
  if (mouseX>b6.x && mouseX<b6.x + b6.size && mouseY>b6.y && mouseY<b6.y + b6.size ) {
    if (mousePressed==true) {
      Bactive1 = false;
      Bactive2 = false;
      Bactive3 = false;
      Bactive4 = false;
      Bactive5 = false;
      Bactive6 = true;
      BColor = false;
    }
  }
  if (mouseX>cd.x && mouseX<cd.x + cd.size && mouseY>cd.y && mouseY<cd.y + cd.size ) {
    if (mousePressed==true) {
      Bactive1 = false;
      Bactive2 = false;
      Bactive3 = false;
      Bactive4 = false;
      Bactive5 = false;
      Bactive6 = false;
      BColor = true;
    }
  }

  //BUTTON DISPLAY
  cd.display();
  cd.hoverOver();

  b1.display();
  b2.display();
  b3.display();
  b4.display();
  b5.display();
  b6.display();

  b1.hoverOver();
  b2.hoverOver();
  b3.hoverOver();
  b4.hoverOver();
  b5.hoverOver();
  b6.hoverOver();
}

void mouseReleased() {
  if (Bactive3) {
    if (mouseY > (height/10 -5)) {
      b3.nshapeX = mouseX;
      b3.nshapeY = mouseY;

      extraCanvas1.beginDraw();  //mouseReleased-re megrajzolja az adott alakzatot
      extraCanvas1.noFill();
      extraCanvas1.stroke(BCol);
      extraCanvas1.strokeWeight(Bsize);
      extraCanvas1.line(b3.shapeX, b3.shapeY, b3.nshapeX, b3.nshapeY);
      extraCanvas1.endDraw();

      extraCanvas2.beginDraw();  //törli a folyamatosan kirajzolt előnézeti képet!
      extraCanvas2.clear();
      extraCanvas2.endDraw();
    }
  }
  if (Bactive4) {
    if (mouseY > (height/10 -5)) {
      b4.nshapeX = mouseX;
      b4.nshapeY = mouseY;

      extraCanvas1.beginDraw();  //mouseReleased-re megrajzolja az adott alakzatot
      extraCanvas1.noFill();
      extraCanvas1.stroke(BCol);
      extraCanvas1.strokeWeight(Bsize);
      extraCanvas1.endDraw();

      if (b4.rectDis > Bsize + 10) { 
        extraCanvas1.beginDraw();
        extraCanvas1.rect(b4.shapeX, b4.shapeY, b4.nshapeX-b4.shapeX, b4.nshapeY-b4.shapeY);
        extraCanvas1.endDraw();
      } 

      extraCanvas2.beginDraw();
      extraCanvas2.clear();
      extraCanvas2.endDraw();
    }
  }
  if (Bactive5) {
    if (mouseY > (height/10 -5)) {
      b5.nshapeX = mouseX;
      b5.nshapeY = mouseY;

      extraCanvas1.beginDraw();    //mouseReleased-re megrajzolja az adott alakzatot
      extraCanvas1.noFill();
      extraCanvas1.stroke(BCol);
      extraCanvas1.strokeWeight(Bsize);    
      extraCanvas1.ellipseMode(CORNER);
      extraCanvas1.ellipse(b5.shapeX, b5.shapeY, b5.nshapeX-b5.shapeX, b5.nshapeY-b5.shapeY);
      extraCanvas1.endDraw();

      if (b5.ellipseDis > Bsize + 10) {
        extraCanvas1.beginDraw();
        extraCanvas1.ellipse(b5.shapeX, b5.shapeY, b5.nshapeX-b5.shapeX, b5.nshapeY-b5.shapeY);
        extraCanvas1.endDraw();
      }

      extraCanvas2.beginDraw();
      extraCanvas2.clear();
      extraCanvas2.endDraw();
    }
  }
}

void mousePressed() {
  if (Bactive3) {
    if (mouseButton == LEFT ) {    //Az alakzatok kezdeti koordinátái
      b3.shapeX = mouseX;
      b3.shapeY = mouseY;
      if (b3.nshapeX == 0 && b3.nshapeY == 0) {
        b3.nshapeX = mouseX;
        b3.nshapeY = mouseY;
      }
    }
  }
  if (Bactive4) {
    if (mouseButton == LEFT ) {
      b4.shapeX = mouseX;
      b4.shapeY = mouseY;
      if (b4.nshapeX == 0 && b4.nshapeY == 0) {
        b4.nshapeX = mouseX ;
        b4.nshapeY = mouseY ;
      }
    }
  }
  if (Bactive5) {
    if (mouseButton == LEFT ) {
      b5.shapeX = mouseX;
      b5.shapeY = mouseY;
      if (b5.nshapeX == 0 && b5.nshapeY == 0) {
        b5.nshapeX = mouseX ;
        b5.nshapeY = mouseY ;
      }
    }
  }
}

  //KITÖLTŐ ESZKÖZHÖZ !
  public static boolean isValid(int fx, int fy) {
    if (fx<0) return false;
    if (fx>1023) return false;
    if (fy<0) return false;
    if (fy>641) return false;
    return true;
  }
