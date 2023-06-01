class Ball {

  float initialX = 0;
  float initialY = 0;
  
  float x = 300;
  float y = 300;


  float targetX = 300;
  float targetY = 300;

  String col = "#f7f7f7";


  void move() {
    if(random(50,100)<random(50,100) && isMouseReleased == true){
      targetY += random(-10, 10);
    targetX += random(-10, 10);
    
    }
    
    float easing = 0.1;
    
    float dx = targetX - x;
    float dy = targetY - y;

    x += dx * easing;
    y += dy * easing;
    
    //fill(255,0,0);
    //ellipse(targetX,targetY,10,10);
  }

  void setTargetRandom() {
    //println("[x]" + targetX + "   " + targetX);
    //println("[y]" + targetY + "   " + targetY);
    if(targetX<initialX+60 && targetX>initialX-60 && isMouseReleased == true){
      targetX += random(-40, 40);
    }else{
      targetX = initialX+random(-10,10);
      //println("modoru");
    }
    
    if(targetY<initialX+60 && targetY>initialX-60 && isMouseReleased == true){
      targetY += random(-40, 40);
    }else{
      targetY = initialY+random(-10,10);
      //println("modoru");
    }
  }

  void render() {
    int red = Integer.parseInt(col.substring(1, 3), 16);
    int green = Integer.parseInt(col.substring(3, 5), 16);
    int blue = Integer.parseInt(col.substring(5, 7), 16);
    fill(red, green, blue);
    
    noStroke();
    ellipse(x, y, 30, 30);
  }
}
