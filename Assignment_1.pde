float x; // Declare X
float y; // Declare Y
float easing = 0.05; // Easing speed
boolean drawT = false; // Declare T
int frame = 0;

//Set Up
void setup() {
  size(800, 400);
  cursor(HAND); // Cursor
  println(mouseX + " : " + mouseY); // Mouse data
  fill(0);
}

void draw() { 
  background(51);
  
  if (mouseX < 400) {
    fill (228,98,255);
    rect(0, 0, 400, 400); // Left rectangle 
    } 
    
    else {
    fill(255,149,10);
    rect(400, 0, 800, 400); // Right rectangle 
  }
  
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  
  float x = mouseX;
  float y = mouseY;
  float ix = width - mouseX; // Inverse X
  float iy = height - mouseY; // Inverse Y
  
// Big ellipse
  fill(255, 150);
  ellipse(x, height/2, y, y);
  fill(0, 159);
  ellipse(ix, height/2, iy, iy);
  
// Click mouse to reveal bigger ellipse   
if (mousePressed==true) {
fill(255);
ellipse(x,y,80,80);
}

else {
fill(0,255,240);
ellipse(x,y,60,60);
noStroke();
}

// Press D to reveal right square
 if ((keyPressed == true) && (key == 'd')){
 fill(255,0,94);
 rect(560,150,100,100);
 }
 
 // Press A to reveal left square
 if ((keyPressed == true) && (key == 'a')){
 fill(255,0,94);
 rect(160,150,100,100);
 }
 
 // Drawing T
 if (drawT == true) {
   rect(90, 80, 220, 80);
    rect(156, 160, 88, 180);
    rect(490, 80, 220, 80);
    rect(550, 160, 88, 180);
  }
}

// Drag to release small ellipse
void mouseDragged() {
fill(0,255,240);
ellipse(mouseX-20,mouseY-20,40,40); 
}

// Press T to summon the letter T
void keyPressed() {
  if ((key == 'T') || (key == 't')) {
    drawT = true;
  }
}

void keyReleased() {
  drawT = false;
}
 