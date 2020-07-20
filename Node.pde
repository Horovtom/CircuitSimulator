class Node {
  static final int CROSS_SIZE = CELL_SIZE / 4; 

  PVector position;
  
  

  Node(PVector position) {
    this.position = position;
  }

  void display() {
    if (DEBUG_CELLS) 
    {
      rectMode(CENTER);
      stroke(0, 0, 0, 100);
      rect(position.x, position.y, CELL_SIZE, CELL_SIZE);
    }
    
    stroke(0);
    line(position.x - CROSS_SIZE, position.y, position.x + CROSS_SIZE, position.y);
    line(position.x, position.y - CROSS_SIZE, position.x, position.y + CROSS_SIZE);
  }
}