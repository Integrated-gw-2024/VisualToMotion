import java.util.regex.Matcher;
import java.util.regex.Pattern;


float x = 0;
float y = 0;

float targetX = 0;
float targetY = 0;


PImage img;

Ball b;
Ball b1;
ArrayList<Ball> balls;

XML xml;
XML[] firstChild;

String[] importedRectColor;

Boolean isMouseReleased = true;


void setup() {

  size(1000, 1000);

  b = new Ball();
  balls = new ArrayList<Ball>();



  img = loadImage("img.png");



  xml = loadXML("mosaic.xml");
  XML[] importedRects = xml.getChildren("circle");

  importedRectColor = new String[importedRects.length];
  
  println(importedRects.length);



  XML styleElement = xml.getChild("defs").getChild("style");
  String styleText = styleElement.getContent();

  String patternString = "(\\.cls-\\d+\\{fill:#(?:[0-9A-Fa-f]{6});)+";
  Pattern pattern = Pattern.compile(patternString);
  Matcher matcher = pattern.matcher(styleText);

  /*
  while (matcher.find()) {
    String match = matcher.group();
    String[] parts = match.split("(?=\\.cls-\\d+)");
    for (String part : parts) {
      String clsNum = part.replaceAll("\\.cls-(\\d+)\\{fill:#(?:[0-9A-Fa-f]{6});", "$1");
      String col = part.replaceAll("\\.cls-\\d+\\{fill:#([0-9A-Fa-f]{6});", "#$1");

      int num = Integer.parseInt(clsNum);

      importedRectColor[num] = col;
      //println(importedRectColor[num]);
    }
  }
*/

  for (int i=0; i<importedRects.length; i++) {
    float x = importedRects[i].getFloat("cx");
    float y = importedRects[i].getFloat("cy");

    //String classNameRaw = importedRects[i].getString("class");

    //int className = Integer.parseInt(classNameRaw.replaceAll("cls-(\\d+)", "$1"));


    b = new Ball();

    float n = 160;

    b.initialX = x+n;
    b.initialY = y+n;

    b.x = x+n;
    b.y = y+n;


    b.targetX = x+n;
    b.targetY = y+n;

    /*println(importedRectColor[className]);
    if (importedRectColor[className] != null) {
      b.col = importedRectColor[className];
    }*/


    balls.add(b);
  }



  background(20);
}

void draw() {

  background(190);
  scale(0.3);
  fill(0);




  for (int i=0; i<=balls.size()-1; i++) {
    if (floor(balls.get(i).targetX)!=floor(balls.get(i).x) && floor(balls.get(i).targetY)!=floor(balls.get(i).y)) {
      balls.get(i).move();
    } else {
      balls.get(i).setTargetRandom();
    }
  }



  for (int i=0; i<=balls.size()-1; i++) {
    balls.get(i).render();
  }
}


void mousePressed() {
  isMouseReleased = false;

  for (int i=0; i<=balls.size()-1; i++) {
    balls.get(i).targetY = balls.get(i).initialY;
    balls.get(i).targetX = balls.get(i).initialX;
  }

    for (int i=0; i<=balls.size()-1; i++) {
      balls.get(i).move();
    }
}

void mouseReleased() {

  isMouseReleased = true;
}

void keyPressed() {
  b = new Ball();

  balls.add(b);
}
