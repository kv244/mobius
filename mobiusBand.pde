mobiusStrip ms;
float w = 100.0; // band width
float radius;
float angle = PI/5; 


void setup(){
  size(960, 640, P3D);
  radius = width/5;
  ms = new mobiusStrip(radius, w);
  ms.make(30, 100); //1st, how many steps for the width, 2 how many between dots on one band   //<>//
}

void draw(){
  background(0);
  
  //camera(-20, 20, 20, 0, 0, 0, 0, 0, 1);
  PVector current; PVector next = new PVector(0, 0, 0); // to avoid error
  
  translate(width/3, height/2, -10);  // /3 for line, /2 for points
  rotateX(angle);
  
  for(int i = 0; i < ms.size(); i ++){
    current = ms.position(i); 
    if( i == ms.size() - 1)
      next = ms.position(0);
    else
      next = ms.position(i+1);
      
    stroke(0, 255, 255);
    point(current.x, current.y, current.z);
    
     
    stroke(255, 0, 255);
    // this projection causes an issue (Z shift?)
    line(screenX(current.x, current.y, current.z), 
      screenY(current.x, current.y, current.z), 
      screenX(next.x, next.y, next.z), 
      screenY(next.x, next.y, next.z));
      
  } 
     
  angle += PI/100;
}
