class NodeConnectionJoint extends NodeContent {
  boolean N, E, W, S;

  void display(int x, int y) {
    noFill();
    stroke(0);

    if (N || S) {
      int start = y + (N ? 0 : HALF_CELL_SIZE);
      int end = y + (S ? CELL_SIZE : HALF_CELL_SIZE);
      line(x + HALF_CELL_SIZE, start, x + HALF_CELL_SIZE, end);
    }
    if (W||E) {
      int start = x + (W ? 0 : HALF_CELL_SIZE);
      int end = x + (E? CELL_SIZE:HALF_CELL_SIZE);
      line(start, y + HALF_CELL_SIZE, end, y + HALF_CELL_SIZE);
    }

    fill(0, 0, 255);
    noStroke();
    ellipse(x, y, CELL_SIZE/6, CELL_SIZE/6);
  }
}