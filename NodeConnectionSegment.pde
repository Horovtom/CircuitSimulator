class NodeConnectionCSegment extends NodeContent {
  static final int ARC_SIZE = CELL_SIZE / 4;
  static final int ARC_EDGE_START = HALF_CELL_SIZE - (ARC_SIZE/2);
  static final int ARC_EDGE_STOP = ARC_EDGE_START + ARC_SIZE;


  boolean LR = false;
  boolean UD = false;
  
  void display(int x, int y) {
    stroke(0);
    noFill();

    if (UD) {
      line(x + HALF_CELL_SIZE, y, x + HALF_CELL_SIZE, y + CELL_SIZE);
    }
    if (LR) {
      if (UD) {
        // With crossing

        arc(x, y, ARC_SIZE, ARC_SIZE, 0, PI/2);
        line(x, y + HALF_CELL_SIZE, x + ARC_EDGE_START, y + HALF_CELL_SIZE);
        line(x + ARC_EDGE_STOP, y + HALF_CELL_SIZE, x + CELL_SIZE, y + HALF_CELL_SIZE);
      } else {
        line(x, y + HALF_CELL_SIZE, x + CELL_SIZE, y + HALF_CELL_SIZE);
      }
    }
  }
}