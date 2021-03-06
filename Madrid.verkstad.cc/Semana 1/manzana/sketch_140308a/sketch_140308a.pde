int nX = 0;      // X coordinate, Newton
int nY = 0;      // Y coordinate, Newton
float mY = 0;    // Y coordinate, apples
int mX = 15;     // X coordinate, apples
float mV = 0;    // Y speed, apples
float mA = 0.05; // Y acceleration, apples
int p = 0;       // Points
boolean pCount = true;  // Check whether to count points or not
long t = 0;      // Store the time 
  
void setup() {
  size(400, 400);  
  nY = height - 25; 
  t = millis();  // Initialize the time counter
}
 
void draw() {
  background(200);  
   
  // Apple's movement
  mV = mV + mA;  
  mY = mY + mV;  
  if (mY > height) {
    mY = 15;    
    mX = int(random(width - 20)); 
    mV = 0;   
    // When throwing a new apple it will be possible 
    // to start counting points again
    pCount = true;  
  }
   
  fill(255);  
   
  // Collision detection
  if (mY + 10 > nY && mY - 10 < nY + 20) {  
    if (mX + 10 > nX && mX - 10 < nX + 20) { 
      fill(255, 0, 0);  
      // If collision increase the points
      if (pCount) p = p + 1;
      pCount = false;  // Whenever you make it at this point, do not 
                       // count any more points
    } 
  }
 
  ellipse(mX, mY, 20, 20); 
  rect(nX, nY, 20, 20); 
 
   
  // Count the time
  float timer = (millis() - t) / 1000;  // Count how much time has passed in seconds
 
  // GAME OVER
  if (timer >= 30) {  // If time reaches 30 seconds, end the game
    noLoop();
  }
 
  // Show the time on the screen
  fill(0);
  text("Time: " + (30 - timer), 10, 20);
 
  // Show the points on the screen
  fill(0);  
  text("Hits: " + p, 3 * width / 4, 20); 
}
 
void keyPressed() {
  // Increase the coordinates in 3 pixels
  if (keyCode == RIGHT) {
    nX = nX + 3;
  }
  // Decrease the coordinates in 3 pixels
  if (keyCode == LEFT) {
    nX = nX - 3;
  }
  // Limit the X coordinates
  if (nX < 0) {
    nX = 0;
  }
  if (nX > width - 20) {  
    nX = width - 20;
  }
}
