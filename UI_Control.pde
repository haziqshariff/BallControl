import controlP5.*;

ControlP5 cp5;
ColorPicker cp;
int knobValue = 100;
int myColor = color(0,0,0);
int sliderValue = 100;
int sliderTicks1 = 100;

Textlabel A;
Knob myKnobA;
Chart myChart;
Slider abc;

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
   noStroke();
  
  
  cp5 = new ControlP5(this); // UI 1: Color Picker
  cp = cp5.addColorPicker("picker")
          .setPosition(20, 80)
          .setColorValue(color(255, 128, 0, 128));
          
    cp5 = new ControlP5(this); // UI 2: Knob
  
myKnobA = cp5.addKnob("knobValue")
               .setRange(0,255)
               .setValue(220)
               .setPosition(100,210)
               .setRadius(50)
               .setNumberOfTickMarks(10)
               .setTickMarkLength(4)
               .snapToTickMarks(true)
               .setColorForeground(color(255))
               .setColorBackground(color(0, 160, 100))
               .setColorActive(color(255,255,0))
               .setDragDirection(Knob.HORIZONTAL);
               
cp5 = new ControlP5(this); // UI 3: Slider
  cp5.addSlider("Slider")                                  
     .setPosition(80,350)
     .setWidth(400)
     .setRange(0,550)
     .setValue(128)
     .setNumberOfTickMarks(4)
     .setSliderMode(Slider.FLEXIBLE);
     
     
     cp5 = new ControlP5(this);  // UI 4: Text
  
  A = cp5.addTextlabel("label")                           
                    .setText("Welcome")
                    .setPosition(600, 120)
                    .setColorValue(000000)
                    .setFont(createFont("Arial",20));
                    
  cp5 = new ControlP5(this); // UI 5: Data Flow
  myChart = cp5.addChart("dataflow")
               .setPosition(500, 200)
               .setSize(200, 100)
               .setRange(-20, 20)
               .setView(Chart.LINE)
               .setStrokeWeight(1.5)
               .setColorCaptionLabel(color(40))
               ;

  myChart.addDataSet("incoming");
  myChart.setData("incoming", new float[100]);
  
                    
}



void draw() { 
  
 
  myChart.push("incoming", (sin(frameCount*0.1)*10));

  fill(sliderValue);
  rect(0,0,width,100);
  
  fill(myColor);
  rect(0,280,width,70);
  
  background(cp.getColorValue());
  fill(0, 80);
  rect(50, 90, 275, 80);
  
  fill(knobValue);
  rect(0,height/2,width,height/2);
  fill(0,100);
  rect(80,40,140,320);
  
  
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

  fill(sliderTicks1);
  ellipse(x, height/2, y, y);
  fill(0, 159);
  ellipse(ix, height/2, iy, iy);
  
// Click mouse to reveal bigger ellipse
fill(knobValue);
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
