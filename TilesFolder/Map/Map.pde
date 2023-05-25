public Tiles[] gameMap;

void setup(){
  size (1500,1000);
  gameMap = new Tiles[16];
}

void mapSet(){
  gameMap[0] = new Tiles("Go", "unbuyable");
  gameMap[1] = new Tiles("Oriental Avenue", "buyable");
  gameMap[2] = new Tiles("Vermont Avenue", "buyable");
  gameMap[3] = new Tiles("Connecticut Avenue", "buyable");
  gameMap[4] = new Tiles("Nothing", "unbuyable");
  gameMap[5] = new Tiles("St. Charles Place", "buyable");
  gameMap[6] = new Tiles("States Avenue", "buyable");
  gameMap[7] = new Tiles("Virginia Avenue","buyable");
  gameMap[8] = new Tiles("Nothing", "unbuyable");
  gameMap[9] = new Tiles("Kentucky Avenue", "buyable");
  gameMap[10] = new Tiles("Indiana Avenue", "buyable");
  gameMap[11] = new Tiles("Illinois Avenue", "buyable");
  gameMap[12] = new Tiles("Nothing", "unbuyable");
  gameMap[13] = new Tiles("Pacific Avenue", "buyable");
  gameMap[14] = new Tiles("North Carolina Avenue", "buyable");
  gameMap[15] = new Tiles("Pennsylvania Avenue" , "buyable");
}

void grid(){
  int startW = 200;
  int startH = 10;
  for (int i=0; i < gameMap.length ;i++){
  
    if (i >=0 && i < 4){
      rect(startW,startH, 200,200);
      fill(0);
      text(gameMap[i].getName(),startW+15,startH+20);
   
    fill(255);
      startW += 200;
    }
    else if (i >= 4 && i < 8){
    rect(startW,startH, 200,200);
     fill(0);
     text(gameMap[i].getName(),startW+15,startH+20);
    
    fill(255);
      startH += 200;
    } else if (i >= 8 && i < 12){
    rect(startW,startH, 200,200);
     fill(0);
     text(gameMap[i].getName(),startW+15,startH+20);
    
    fill(255);
      startW -= 200;
    } else if (i >=12 && i < 16){
    rect(startW,startH, 200,200);
     fill(0);
     text(gameMap[i].getName(),startW+15,startH+20);
  
    fill(255);
      startH -= 200;
    }
    
     textSize(19);
  }
  
}

void draw(){
mapSet();
grid();
}
