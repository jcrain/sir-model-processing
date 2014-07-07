//====SIR Model With Cellular Auto ===//

Cell[][] grid;

// Number of columns and rows in the grid
int cols = 91;
int rows = 91;
int[][] neighbor = { {-1,-1},  // Define the Moore Neighborhood
                     {0,-1},
                     {1,-1},
                     {1,0},
                     {1,1},
                     {0,1},
                     {-1,1},
                     {-1,0}  };

void setup() {
  size(312,312);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Cell((i*3)+6,(j*3)+6,3,3,i+j,0);
    }
  }
  frameRate(5);
 grid[90][90].initialize();
}

void draw() {
  background(0);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].setColor();
      grid[i][j].display();
      grid[i][j].change(i, j);
    }
  }
}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x,y;   // x,y location
  float w,h;   // width and height
  float color; // color to indicate a change in state
  int state; // state will change our color variable accordingly

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempColor, int tempState) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    color = tempColor;
    state = tempState;
  } 
  
  // Oscillation means increase angle
  void setColor() {
	  if (state == 0 ) {
	  	color = 0;
	  } else if ( state == 1 ){
	      color = 160;	
	  } else if ( state == 0.5){
	  	color = 254;
	  } else {
	  	color = 254;
	  }
  }

  void display() {
    stroke(255);      // Give our shapes an outline  
    fill(color);      // Color calculated based on the state
    ellipse(x,y,w,h); //redraw each ellipse
  }
  
  void change(int i, int j) {
	
	int j2 = 0;
	int i2 = 0;
  int neighState;

  if ( state == 0) {
	  int sick = 0;
	for (int k = 0; k < 8; k++){
	    i2 = i + neighbor[k][0];
	    j2 = j + neighbor[k][1];
	    
	    if( i2 >= 0 && j2 >= 0 && j2 < cols && i2 < rows ){ // We need to be sure we are checking the state of grid spaces that 
		    neighState = grid[i2][j2].getState();             // Actually exist
		    sick = sick + neighState;
		    if (state == 0){
			    if (sick >= 1 && random(1) < 0.1){
				     state = 1;
				   } 	else{
							  state = 0;
							 }
				 } 	
	     }// end neighbor check
	   } //end for k = 0:8
   } // end highest if statement
     else if (state == 1 && random(1) < 0.08 ) {
	     state = 0.5;
     }
     else if (state == 0.5){
	     state = 0.5;
     }
  }

  void initialize() {
	  state = 1;
  }

  public int getState(){
	  int storeState;
	  storeState = state;
	  return storeState;
  }
}




