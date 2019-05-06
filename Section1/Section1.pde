int MAX_VALUE = (height/2);
int MIN_VALUE = -(height/2);
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y; // coordinate of box
  int width; // width of box
  int height; // height of box
  int size; // number of bars
  float [] values; // array of bar sizes
  float [] speeds; // array of bar speeds
  Visualizer(float x, float y, int w, int h, int s) {
    // instantiate fields
    this.x = x;
    this.y = y;
    width = w;
    height = h;
    size = s;
    values = new float[size];
    speeds = new float[size];
    // loop through values array, assigning random lengths and speeds
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    
    // make a white box with specified width and height
    fill(255);
    rect(x, y, width, height);
 
    //the line is the 0 y-value, the top is half the height, the bottom is the opposite of half the height
    line(x, y+ (height/2), x+width, y+ (height/2));
  
    // width of each rectangle is calculated based on number of rectangles
    int rect_width = width / size;
    // for each element in values
    for (int i = 0; i < values.length; i++){
      // color green if height is between 50 and 100
      if ( values[i] > (height/4) && values[i] <= (height/2)){
        fill(0,255,0);
      }
      // color yellow if height is between 0 and 50
      else if (values[i] > 0 && values[i] <= (height/4)){
        fill(255,255,0);
      }
      // color orange if height is between -50 and 0
      else if (values[i] > -(height/4) && values[i] <= 0){
        fill(204, 102, 0);
      }
      // color red if height is between -100 and -50
      else if (values[i] >= -(height/2) && values[i] <= -(height/4)){
        fill(255,0,0);
      }
      
      // bar starts below the line if value is negative and above the line if value is positive
      if (values[i] < 0){
        rect(x+ rect_width*i, y+ (height/2), rect_width, Math.abs(values[i]) );
      }
      else{
        rect(x + rect_width*i, y + (height/2) - values[i], rect_width, Math.abs(values[i]) );
      }
    }
  
  }
  void update() {
    // for each bar in the values array
    for (int i = 0; i < values.length; i++) {
      // update speed 
      values[i] += speeds[i];
      // reverse speed if reached max or min
      if (values[i] >= (height/2) || values[i] <= -(height/2)){
        speeds[i] *= -1;
      }
     
    }
  }
}

void setup() {
  size(1200, 1000);
  v = new Visualizer(20, 20, 400, 200, 20);
  v = new Visualizer(420, 20, 400, 400, 30);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
