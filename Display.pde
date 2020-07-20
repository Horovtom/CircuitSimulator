class Display {
  float mx, my, ratio, xpt, ypt, xzt, yzt, swt, zoom;
  PVector translation = new PVector();


  Display() {
    zoom=1.0;
    mx=width/60;
    my=mx*height/width;
    ratio=mx/my;
  }

  void display() {
    scale(zoom);
    translation.x = xzt - xpt;
    translation.y = yzt - ypt;
    translate(-translation.x, -translation.y);
    viewport[0] = translation.x;
    viewport[1] = translation.y;
    viewport[2] =  translation.x + (width / zoom);
    viewport[3] =  translation.y + (height/ zoom);
    background(255);
  }

  void mouseDrag() {
    xpt-=(pmouseX-mouseX)/zoom;
    ypt-=(pmouseY-mouseY)/zoom;
  }

  void mouseWh(MouseEvent event) {
    swt-=event.getCount();
    if (swt==0) {
      zoom=1.0;
    } else if (swt>=1 && swt<=10) {
      zoom=pow(2, swt);
    } else if (swt<=-1 && swt>=-10) {
      zoom=1/pow(2, abs(swt));
    }
    xzt=((zoom-1)*width/2)/zoom;
    yzt=((zoom-1)*height/2)/zoom;
    if (event.getCount()<=-1) {
      xpt-=(mouseX-width/2)/zoom;
      ypt-=(mouseY-height/2)/zoom;
    } else {
      xpt+=(mouseX-width/2)/(pow(2, swt+1));
      ypt+=(mouseY-height/2)/(pow(2, swt+1));
    }
  }

  void update() {
    updateVisibleCoords();
  }

  void updateVisibleCoords() {
    visibleCoords[0] = (int) viewport[0] / CELL_SIZE;
    visibleCoords[1] = (int) viewport[1] / CELL_SIZE;
    visibleCoords[2] = (int) ((viewport[2] + CELL_SIZE) / CELL_SIZE);
    visibleCoords[3] = (int) ((viewport[3] + CELL_SIZE) / CELL_SIZE);
  }

  void clicked() {
    update();
    
    // TODO: THIS IS WRONG
    int x = visibleCoords[0] + int((mouseX + (HALF_CELL_SIZE * zoom)) / (CELL_SIZE*zoom));
    int y = visibleCoords[1] + int((mouseY + (HALF_CELL_SIZE * zoom)) / (CELL_SIZE*zoom));
    view.clicked(x, y);
  }
}