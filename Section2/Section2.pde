int levels;
color bg,fg;

void setup() {
  size(800, 600);
  levels = 1;
}

/*Create Sierpiski's Gasket (google an image of this)
  The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
  levels:
  0 = regular triangle
  1 = triforce (looks like 3 triangles)
  2 = each of the 3 triangles will be cut into 3 triangles.
  etc.
*/
void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
    // set negative levels to 0 by default
    if (levels <= 0){
      levels = 0;
    }
    // call helper function to draw the appropriate number of triangles
    gasketH(0, levels, v1x, v1y, v2x, v2y, v3x, v3y);
    
}

// helper method to draw the inner triangles
void gasketH(int level, int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y){

  // if highest level is reached, draw one triangle
  if (level == levels){
    fill(0,0,255);
    triangle(v1x,v1y,v2x,v2y,v3x,v3y);
  }
  // otherwise divide triangle into three smaller triangles and update current level
  else{
  
    gasketH(level+1, levels, v1x, v1y, (v1x + v2x) / 2, v2y, (v1x + v3x) / 2, (v1y + v3y) / 2);
   
    gasketH(level+1, levels, (v1x + v2x) / 2, v2y, v2x, v2y, (v2x + v3x) / 2, (v2y + v3y) / 2);
   
    gasketH(level+1, levels, (v1x + v3x) / 2, (v1y + v3y) / 2, (v2x + v3x) / 2, (v2y + v3y) / 2, v3x, v3y);
  }
}

void koch(int levels, float v1x, float v1y, float v2x, float v2y){
  
}

void draw() { 
  background(50);  
  
  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levles",20,20);
  fill(0,255,0);
  gasket(levels,0, height-10, width, height-10, width/2, 10);

  koch(levels,width-10, height/2, 10, height/3 ); 
 //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked(){ 
 levels ++;
 
}

void keyPressed(){
 levels --; 
 
}
