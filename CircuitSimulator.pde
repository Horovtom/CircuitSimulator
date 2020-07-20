static final boolean DEBUG_CELLS = true;

static final int CELL_SIZE = 20;
static final int NODE_COUNT = 100;


// COMPUTED
static final int HALF_CELL_SIZE = CELL_SIZE / 2;


final float[] viewport = new float[4];
final int[] visibleCoords = new int[4];

Display display;
View view;
//SimulationControl control;

void setup() {
  size(1000, 1000);
  display = new Display();
  view = new View();
}

void draw() {
  // Does necessary transformation of viewport
  display.update();
  display.display();
  
  view.update();
  view.display();
}

void mouseDragged() {
  display.mouseDrag();
}

void mouseWheel(MouseEvent event) {
  display.mouseWh(event);
}

void mouseClicked() {
 display.clicked(); 
}