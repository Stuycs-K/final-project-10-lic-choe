public Tiles[] gameMap;

void setup(){
  size (1500,1000);
  gameMap = new Tiles[16];
}

void mapSet(){
  gameMap[0] = new UnbuyableTiles("Go", "unbuyable");
  gameMap[1] = new BuyableTiles("Oriental Avenue", "buyable",1500);
  gameMap[2] = new BuyableTiles("Vermont Avenue", "buyable",1500);
  gameMap[3] = new BuyableTiles("Connecticut Avenue", "buyable",1500);
  gameMap[4] = new UnbuyableTiles("Nothing", "unbuyable");
  gameMap[5] = new BuyableTiles("St. Charles Place", "buyable",1500);
  gameMap[6] = new BuyableTiles("States Avenue", "buyable",1500);
  gameMap[7] = new BuyableTiles("Virginia Avenue","buyable",1500);
  gameMap[8] = new UnbuyableTiles("Nothing", "unbuyable");
  gameMap[9] = new BuyableTiles("Kentucky Avenue", "buyable",1500);
  gameMap[10] = new BuyableTiles("Indiana Avenue", "buyable",1500);
  gameMap[11] = new BuyableTiles("Illinois Avenue", "buyable",1500);
  gameMap[12] = new Tiles("Nothing", "unbuyable");
  gameMap[13] = new BuyableTiles("Pacific Avenue", "buyable",1500);
  gameMap[14] = new BuyableTiles("North Carolina Avenue", "buyable",1500);
  gameMap[15] = new BuyableTiles("Pennsylvania Avenue" , "buyable",1500);
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
