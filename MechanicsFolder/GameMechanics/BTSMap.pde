public class BTSMap {
  public Tiles[] gameMap;

  public BTSMap() {
    gameMap = new Tiles[40];
    mapSet();
  }
  void build() {
    grid();
    displayName();
  }

  void mapSet() {
    gameMap[0] = new UnbuyableTiles("Go", "unbuyable");
    gameMap[1] = new BuyableTiles("Oriental Avenue", "buyable", 200);
    gameMap[2] = new BuyableTiles("Vermont Avenue", "buyable", 200);
    gameMap[3] = new UnbuyableTiles("Lottery", "unbuyable");
    gameMap[4] = new BuyableTiles("Connecticut Avenue", "buyable", 200);
    gameMap[5] = new UnbuyableTiles("Crazy Fangirl", "unbuyable");
    gameMap[6] = new BuyableTiles("Black Swan", "buyable", 250);
    gameMap[7] = new BuyableTiles("Life Goes On", "buyable", 250);
    gameMap[8] = new UnbuyableTiles("KTX Station", "unbuyable");
    gameMap[9] = new BuyableTiles("Butter", "buyable", 250);
    gameMap[10] = new UnbuyableTiles("Nothing", "unbuyable");
    gameMap[11] = new BuyableTiles("St. Charles Place", "buyable", 300);
    gameMap[12] = new BuyableTiles("States Avenue", "buyable", 300);
    gameMap[13] = new UnbuyableTiles("Thief", "unbuyable");
    gameMap[14] = new BuyableTiles("Magic Shop", "buyable", 300);
    gameMap[15] = new UnbuyableTiles("Concert", "unbuyable");
    gameMap[16] = new BuyableTiles("Dynamite", "buyable", 325);
    gameMap[17] = new BuyableTiles("Dis-ease", "buyable", 325);
    gameMap[18] = new UnbuyableTiles("Tax Fraud", "unbuyable");
    gameMap[19] = new BuyableTiles("Yet To Come", "buyable", 325);
    gameMap[20] = new UnbuyableTiles("Nothing", "unbuyable");
    gameMap[21] = new BuyableTiles("Kentucky Avenue", "buyable", 350);
    gameMap[22] = new BuyableTiles("Indiana Avenue", "buyable", 350);
    gameMap[23] = new UnbuyableTiles("KTX Station", "unbuyable");
    gameMap[24] = new BuyableTiles("Illinois Avenue", "buyable", 350);
    gameMap[25] = new UnbuyableTiles("New Merch", "unbuyable");
    gameMap[26] = new BuyableTiles("a", "buyable", 400);
    gameMap[27] = new BuyableTiles("b", "buyable", 400);
    gameMap[28] = new UnbuyableTiles("idk anymore", "unbuyable");
    gameMap[29] = new BuyableTiles("c", "buyable", 400);
    gameMap[30] = new UnbuyableTiles("Nothing", "unbuyable");
    gameMap[31] = new BuyableTiles("Pacific Avenue", "buyable", 450);
    gameMap[32] = new BuyableTiles("North Carolina Avenue", "buyable", 450);
    gameMap[33] = new UnbuyableTiles("Pyramid Scheme", "unbuyable");
    gameMap[34] = new BuyableTiles("Pennsylvania Avenue", "buyable", 450);
    gameMap[35] = new UnbuyableTiles("Joe Biden", "unbuyable");
    gameMap[36] = new BuyableTiles("Euphoria", "buyable", 325);
    gameMap[37] = new BuyableTiles("b", "buyable", 325);
    gameMap[38] = new UnbuyableTiles("a", "unbuyable");
    gameMap[39] = new BuyableTiles("c", "buyable", 325);
 
  }

  void grid() {
    textSize(30);
    fill(255, 0, 0);
    rect(30, 30, 75, 30);
    fill(255);
    text("Menu", 35, 55);
    int startW =width/4-180;
    int startH = 5;
    int rectW = 100;
    int rectH = 90;
    for (int i=0; i < gameMap.length; i++) {

       fill(255);
        rect(startW, startH, rectW, rectH);
        gameMap[i].setCoords(startW, startH, startW+rectW, startH+rectH);
        rect(startW, startH, rectW, rectH/4);
      if (i >=0 && i < 10) {
        startW += rectW;
      } else if (i >= 10 && i < 20) {
        startH +=rectH ;
      } else if (i >= 20 && i < 30) {
        startW -= rectW;
      } else if (i >= 30 && i < 40) {
        startH -= rectH;
      }
    }
  }



  void displayName() {
    int startW =width/4-180;
    int startH = 5;
    int rectW = 100;
    int rectH = 90;
    text(gameMap[0].getName(), startW+20, startH+20);
    fill(0);
    textSize(16);
    for (int i=0; i < gameMap.length; i++) {
      if (!gameMap[i].getName().equals("Nothing")) {
        text(gameMap[i].getName(), startW+2, startH+20);
      }
      if (gameMap[i].getType().equals("buyable")) {
        text(gameMap[i].getPrice(), startW+50, startH+90);
      }

      fill(0);
      if (i >=0 && i < 10) {
        startW += rectW;
      } else if (i >= 10 && i < 20) {
        startH += rectH;
      } else if (i >= 20 && i < 30) {
        startW -= rectW;
      } else if (i >=30 && i < 40) {
        startH -= rectH;
      }
    }
  }
}
