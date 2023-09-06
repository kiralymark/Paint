class ToolBox {    //szürke interfész az ablak tetején
  //Eszköz méretet állító gombok
  int bx1 = width-180;
  int bx2 = width-137;
  int bx3 = width-94;
  int bx4 = width-51;

  int by1 = 18;
  int by2 = 18;
  int by3 = 18;
  int by4 = 18;

  int bsizeX = 36;
  int bsizeY = 30;

  ToolBox() {

    //eszköztár minta
    noStroke();
    fill(200);
    rect(0, 0, width, height/10);
  }

  void display() {

    //eszköztár kirajzolása
    noStroke();
    fill(200);
    rect(0, 0, width, height/10);

    fill(0);
    textSize(32);

    if (Bactive1 ||Bactive3 ||Bactive4 ||Bactive5) {
      text("Size: " +Bsize, width-340, 42);  //ecset méretének kiírása

      noStroke();
      textSize(16);

      fill(120);
      rect(bx1, by1, bsizeX, bsizeY);
      fill(0);
      text("+1", bx1+7, by1+20);

      fill(120);
      rect(bx2, by2, bsizeX, bsizeY);
      fill(0);
      text("+5", bx2+7, by2+20);

      fill(120);
      rect(bx3, by3, bsizeX, bsizeY);
      fill(0);
      text("-5", bx3+7, by3+20);

      fill(120);
      rect(bx4, by4, bsizeX, bsizeY);
      fill(0);
      text("-1", bx4+7, by4+20);

      if (mouseX>bx1 && mouseX<bx1 + bsizeX && mouseY>by1 && mouseY<by1 + bsizeY) {
        if (mousePressed==true) {
          if (Bsize<300 && !Bactive5) {
            Bsize += 1;
          }
          if (Bsize<100 && Bactive5) {
            Bsize += 1;
          }
        }
      }
      if (mouseX>bx2 && mouseX<bx2 + bsizeX && mouseY>by2 && mouseY<by2 + bsizeY) {
        if (mousePressed==true) {
          if (Bsize<300 && !Bactive5) {
            Bsize += 5;
          }
          if (Bsize>300 && !Bactive5) {
            Bsize = 300;
          }
          if (Bsize<100 && Bactive5) {
            Bsize += 5;
          }
          if (Bsize>100 && Bactive5) {
            Bsize = 100;
          }
        }
      }
      if (mouseX>bx3 && mouseX<bx3 + bsizeX && mouseY>by3 && mouseY<by3 + bsizeY) {
        if (mousePressed==true) {
          if (Bsize>1) {
            Bsize -= 5;
          }
          if (Bsize<1) {
            Bsize = 1;
          }
        }
      }
      if (mouseX>bx4 && mouseX<bx4 + bsizeX && mouseY>by4 && mouseY<by4 + bsizeY) {
        if (mousePressed==true) {
          if (Bsize>1) {
            Bsize -= 1;
          }
          if (Bsize<1) {
            Bsize = 1;
          }
        }
      }
    }
  }
}
