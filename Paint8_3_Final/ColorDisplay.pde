class ColorDisplay { 
  float x;      
  float y;
  float size;

  float rectSize;
  int rectCol;

  int BBackground = #99CCFF;

  PImage img;

  ColorDisplay(float tempRect, float tempX, float tempY, float tempSize, PImage tempImg) {    //színválasztó gomb mintája
    rectSize = tempRect;    
    x = tempX;      
    y = tempY;
    size = tempSize;

    img = tempImg;
  }

  void display() {    //gomb kirajzolása
    noStroke();
    fill(rectCol);
    rect(x, y, size, size);
    fill(0);  //szín megjelenítő kerete
    rect(x+rectSize/9-1, y+rectSize/9-1, rectSize*0.75+2, rectSize*0.75+2);
    fill(BCol);  //szín megjelenítő
    rect(x+rectSize/9, y+rectSize/9, rectSize*0.75, rectSize*0.75);
  }

  boolean MouseIsOver() {    //egér a gomb fölött érzékelése
    if (mouseX>x && mouseX<x+size && mouseY>y && mouseY<y+size ) {
      return true;
    }
    return false;
  }

  void hoverOver() {
    if (MouseIsOver()) {
      if (mousePressed==true) {    //egérkattintásra villanjon fel a gomb
        highlight();
      } else {
        rectCol = color(BBackground);
      }
    }
    if (!MouseIsOver()) {
      rectCol = color(BBackground);
    }
  }

  void highlight() {      //gomb felvillanása
    rectCol = color(255, 50, 50);
    fill(255);
    palette();
  }

  void revoke() {      //többi gomb ne villanjon fel
    if (MouseIsOver()) {
      rectCol = color(#ffbbbb);
    }
    if (!MouseIsOver()) {
      rectCol = color(BBackground);
    }
  }

  int colX = width-300;
  int colY = 0;
  int colW = 300;
  int colH = 194;

  void palette() {
    if (BColor) {

      fill(160);
      rect(colX-2, colY-2, colW+4, colH+4);
      imageMode(CORNER);
      image(img, colX, colY, colW, colH);

      if (keyPressed) {
        if (key=='1') {
          keyCol1 = BCol;
        }
        if (key=='2') {
          keyCol2 = BCol;
        }
        if (key=='3') {      
          keyCol3 = BCol;
        }
        if (key=='4') {    
          keyCol4 = BCol;
        }
        if (key=='5') {    
          keyCol5 = BCol;
        }
        if (key=='6') {    
          keyCol6 = BCol;
        }
        if (key=='7') {    
          keyCol7 = BCol;
        }
        if (key=='8') {    
          keyCol8 = BCol;
        }
      }

      if (mouseX>colX && mouseX<colX + colW && mouseY>colY && mouseY<colY + colH ) {
        if (mousePressed==true && mouseButton == LEFT) {

          BCol = color(get(mouseX, mouseY));
        }
      }
    }
  }
}
