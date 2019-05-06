int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  int width;
  int height;
  int size;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    width = 400;
    height = 200;
    size = 25;
    values = new float[size];
    speeds = new float[size];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      System.out.println( values[i] );
      speeds[i] = random(2);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, width, height);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+ (height/2), x+width, y+ (height/2));

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    //???WRITE THIS METHOD!!!
    //THESE ARE WRONG: They just illustrate how they could look
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
      if (values[i] < 0){
        rect(x+ rect_width*i, y+ (height/2), rect_width, Math.abs(values[i]) );
      }
      else{
        rect(x + rect_width*i, y + (height/2) - values[i], rect_width, Math.abs(values[i]) );
      }
    }
   /* fill(255, 0, 0);
    rect(x+40, y+100, 60, 50);
    fill(0, 255, 0);
    rect(x+120, y+50, 60, 50);*/


    //Width of the visualizer is 400!

  
  }
  void update() {
    //???WRITE THIS METHOD!!!
    for (int i = 0; i < values.length; i++) {
      
      values[i] += speeds[i];
      if (values[i] >= (height/2) || values[i] <= -(height/2)){
        speeds[i] *= -1;
      }
      //??? keep them values between max/min value

      //??? reverse the speeds so they oscillate up/down when they reach max/min

      
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
