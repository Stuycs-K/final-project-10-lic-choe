public class Map {
  public Tiles[] gameMap;

  void build() {

    gameMap = new Tiles[16];
    mapSet();
    grid();
    displayNameBox();
    displayName();
  }

  void mapSet() {
    gameMap[0] = new UnbuyableTiles("Go", "unbuyable");
    gameMap[1] = new BuyableTiles("Oriental Avenue", "buyable", 200);
    gameMap[2] = new BuyableTiles("Vermont Avenue", "buyable", 200);
    gameMap[3] = new BuyableTiles("Connecticut Avenue", "buyable", 200);
    gameMap[4] = new UnbuyableTiles("Nothing", "unbuyable");
    gameMap[5] = new BuyableTiles("St. Charles Place", "buyable", 300);
    gameMap[6] = new BuyableTiles("States Avenue", "buyable", 300);
    gameMap[7] = new BuyableTiles("Virginia Avenue", "buyable", 300);
    gameMap[8] = new UnbuyableTiles("Nothing", "unbuyable");
    gameMap[9] = new BuyableTiles("Kentucky Avenue", "buyable", 350);
    gameMap[10] = new BuyableTiles("Indiana Avenue", "buyable", 350);
    gameMap[11] = new BuyableTiles("Illinois Avenue", "buyable", 350);
    gameMap[12] = new Tiles("Nothing", "unbuyable");
    gameMap[13] = new BuyableTiles("Pacific Avenue", "buyable", 450);
    gameMap[14] = new BuyableTiles("North Carolina Avenue", "buyable", 450);
    gameMap[15] = new BuyableTiles("Pennsylvania Avenue", "buyable", 450);
  }

  void grid() {
    int startW =width/4;
    int startH = 5;
    
    int rectW = 150;
    int rectH = 200;
    for (int i=0; i < gameMap.length; i++) {
      fill(255);
      rect(startW, startH, rectW, rectH);
      if (i >=0 && i < 4) {
        startW += rectW;
      } else if (i >= 4 && i < 8) {
        startH +=rectH ;
      } else if (i >= 8 && i < 12) {
        startW -= rectW;
      } else if (i >=12 && i < 16) {

        startH -= rectH;
      }
    }
  }

  void displayNameBox() {
    int startW =width/4;
    int startH =5;
    int rectW = 150;
    int rectH = 200;
    for (int i=0; i < gameMap.length; i++) {
    rect(startW, startH, rectW, rectH/4);
      if (i >=0 && i < 4) {
        startW += rectW;
      } else if (i >= 4 && i < 8) {
             startH += rectH;
      } else if (i >= 8 && i < 12) {
           startW -= 150;
      } else if (i >=12 && i < 16) {
           startH -= rectH;
      }
      fill(255);
    }
  }
  
  void displayName() {
    int startW =width/4;
    int startH = 5;
    int rectW = 150;
    int rectH = 200;
    text(gameMap[0].getName(),startW+20,startH+20);
    fill(0);
    textSize(16);
    for (int i=0; i < gameMap.length; i++) {
      if(!gameMap[i].getName().equals("Nothing")){
      text(gameMap[i].getName(),startW+2,startH+20);
      }
      if (gameMap[i].getType().equals("buyable")) {
          text(gameMap[i].getPrice(),startW+50, startH+190);
        }
       
        fill(0);
      if (i >=0 && i < 4) {
        startW += rectW;
      } else if (i >= 4 && i < 8) {
             startH += rectH;
      } else if (i >= 8 && i < 12) {
           startW -= 150;
      } else if (i >=12 && i < 16) {
           startH -= rectH;
      }
       
    }
  }
  

  
}
