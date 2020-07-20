class View {
  Node[][] nodes;
  int lastClickedX, lastClickedY;

  View() {
    nodes = new Node[NODE_COUNT][NODE_COUNT];
    for (int i =0; i < NODE_COUNT; i++) {
      for (int j = 0; j < NODE_COUNT; j++) {
        nodes[i][j] = new Node(new PVector(i * CELL_SIZE, j * CELL_SIZE));
      }
    }
  }

  void display() {
    for (int i = max(visibleCoords[0], 0); i <= min(visibleCoords[2], NODE_COUNT-1); i++) {
      for (int j = max(visibleCoords[1], 0); j <= min(visibleCoords[3], NODE_COUNT-1); j++) {
        nodes[i][j].display();
      }
    }
  }
  
  void update() {
    
    
  }

  void clicked(int x, int y) {
    if (x < 0 || y < 0 || x >= NODE_COUNT || y >= NODE_COUNT)
      return;
    println("CLICKED ON: " + x + " " + y);
  }
    
    
    
}