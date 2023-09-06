class Button {
  float x, y;    //gombok X és Y koordinátái
  float size;    //LOCAL VARIABLE ( size of the Buttons)

  int rectCol;                 //  R  G  B
  int BBackground = #99DDFF;  //# 00|00|00    | 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F |

  PImage img;    //a megjelenítendő kép

  Button(PImage tempImg, float tempX, float tempY, float tempSize) {    // menü/eszköztár gombok mintája
    img = tempImg;    
    x = tempX;      
    y = tempY;
    size = tempSize;
  }

  void display() {    //gombok kirajzolása
    noStroke();
    fill(rectCol);      
    rectMode(CORNER);
    rect(x, y, size, size);
    imageMode(CORNER);      
    image(img, x, y, size, size);    //gombok képeinek megjelenítése
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
    tools();
  }

  void revoke() {      //többi gomb ne villanjon fel
    if (MouseIsOver()) {
      rectCol = color(#ffbbbb);
    }
    if (!MouseIsOver()) {
      rectCol = color(BBackground);
    }
  }

  //LOCAL VARIABLES for the shapes
  float shapeX;    
  float shapeY;
  float nshapeX;
  float nshapeY;

  float rectDis;      //alakzat egyik sarka és a túloldali sarka közötti távolság mérése
  float ellipseDis;

  void tools() {

    //Billentyű kombinációk
    if (keyPressed || (keyPressed && key == CODED)) {
      if ((key=='+' || keyCode == UP)  && Bsize<300 && !Bactive5) {        //ecset méret
        Bsize++;
      }
      if ((key=='+' || keyCode == UP)  && Bsize<100 && Bactive5) { //exception for the ellipse
        Bsize++;
      }
      if ((key=='-' || keyCode == DOWN) && Bsize>1) {      //ecset méret
        Bsize--;
      }
    } 

    if (keyPressed) {
      if (key=='0') {      //fekete
        BCol = color(0);
      }
      if (key=='1') {
        BCol = keyCol1;
      }
      if (key=='2') {
        BCol = keyCol2;
      }
      if (key=='3') {      
        BCol = keyCol3;
      }
      if (key=='4') {    
        BCol = keyCol4;
      }
      if (key=='5') {    
        BCol = keyCol5;
      }
      if (key=='6') {    
        BCol = keyCol6;
      }
      if (key=='7') {    
        BCol = keyCol7;
      }
      if (key=='8') {    
        BCol = keyCol8;
      }
      if (key=='9') {      //fehér
        BCol = color(255);
      }
    }

    if (Bactive1) {

      //Egér irányítás
      if (mousePressed && mouseY > height/10 -5 ) {
        extraCanvas1.beginDraw();
        extraCanvas1.strokeWeight(Bsize);
        extraCanvas1.endDraw();
        if (mouseButton==LEFT) {      //ecset
          extraCanvas1.beginDraw();
          extraCanvas1.stroke(BCol);
          extraCanvas1.line(pmouseX, pmouseY, mouseX, mouseY);
          extraCanvas1.endDraw();
        }
        if (mouseButton==RIGHT) {    //radír
          extraCanvas1.beginDraw();
          extraCanvas1.stroke(255);
          extraCanvas1.line(pmouseX, pmouseY, mouseX, mouseY);
          extraCanvas1.endDraw();
        }
      }
    }

    if (Bactive2) {
      //Egér irányítás
      if ((mousePressed && mouseY > height/10 -5) && mouseButton==RIGHT) {
        background(255);      //VÁSZON TÖRLÉS
        extraCanvas1.beginDraw();
        extraCanvas1.clear();
        extraCanvas1.endDraw();
      }
    }

    if (Bactive3) {    //Vonal előnézetének kirajzolása 
      if (mousePressed && mouseButton == LEFT) {

        extraCanvas2.beginDraw();
        extraCanvas2.clear();
        extraCanvas2.noFill();
        extraCanvas2.stroke(BCol);
        extraCanvas2.strokeWeight(Bsize);
        extraCanvas2.endDraw();

        if (mouseY > (height/10 -5)) {
          extraCanvas2.beginDraw();
          extraCanvas2.line(shapeX, shapeY, mouseX, mouseY);
          extraCanvas2.endDraw();
        }
      }
    }

    if (Bactive4) {    //téglalap előnézetének kirajzolása
      if (mousePressed && mouseButton == LEFT) {
        rectDis = dist(shapeX, shapeY, mouseX, mouseY);

        extraCanvas2.beginDraw();
        extraCanvas2.clear();
        extraCanvas2.noFill();
        extraCanvas2.stroke(BCol);
        extraCanvas2.strokeWeight(Bsize);
        extraCanvas2.endDraw();

        if (rectDis > Bsize + 10 && mouseY > (height/10 -5)) {
          extraCanvas2.beginDraw();
          extraCanvas2.rect(shapeX, shapeY, mouseX-shapeX, mouseY-shapeY);
          extraCanvas2.endDraw();
        }
      }
    }
    if (Bactive5) {    //ellipszis előnézetének kirajzolása
      if (Bsize > 100) {
        Bsize = 10;
      }

      if (mousePressed && mouseButton == LEFT) {
        ellipseDis = dist(shapeX, shapeY, mouseX, mouseY);

        extraCanvas2.beginDraw();
        extraCanvas2.clear();
        extraCanvas2.noFill();
        extraCanvas2.stroke(BCol);
        extraCanvas2.strokeWeight(Bsize);
        extraCanvas2.ellipseMode(CORNER);
        extraCanvas2.endDraw();

        if (ellipseDis > Bsize + 10 && mouseY > (height/10 -5)) {
          extraCanvas2.beginDraw();
          extraCanvas2.ellipse(shapeX, shapeY, mouseX-shapeX, mouseY-shapeY);
          extraCanvas2.endDraw();
        }
      }
    }

    //KITÖLTŐ ESZKÖZ
    if (Bactive6) {  
      if (BCol == 1) {
        BCol = color(0);    //'Bug' elkerüléshez
      }
      if (mousePressed) {
        if (mouseButton==CENTER || mouseButton==RIGHT) {
          extraCanvas1.beginDraw();

          fx=mouseX;
          fy=mouseY;

          color clicked= extraCanvas1.get(fx, fy);

          boolean[][] v= new boolean[1024][642];
          qx.add(fx); 
          qy.add(fy);
          while (!qx.isEmpty()) {
            fx=qx.remove();
            fy=qy.remove();
            extraCanvas1.set(fx, fy, BCol);
            for (int i=0; i<4; i++) {
              fx1=fx+d[i][0];
              fy1=fy+d[i][1];
              if (!isValid(fx1, fy1)) continue;
              if (!v[fx1][fy1] && extraCanvas1.get(fx1, fy1)==clicked) {
                v[fx1][fy1]=true;
                qx.add(fx1);
                qy.add(fy1);
              }
            }
          }
          extraCanvas1.endDraw();
        }
      }
    }
  }
}
