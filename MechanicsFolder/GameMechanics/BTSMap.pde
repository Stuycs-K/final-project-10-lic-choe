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
    gameMap[0] = new UnbuyableTiles("Go", "unbuyable",25,25,52,loadImage("go.jpg"));
    gameMap[1] = new BuyableTiles("Taebaek-Si", "buyable", 200,102,0,204,loadImage("taebaeksi.jpg"));
    gameMap[2] = new BuyableTiles("Sokcho-si", "buyable", 200,102,0,204,loadImage("sokchosi.jpg"));
    gameMap[3] = new UnbuyableTiles("Lottery", "unbuyable",25,25,25,loadImage("lottery.jpg"));
    gameMap[4] = new BuyableTiles("Donghae-si", "buyable", 200,102,0,204,loadImage("donghaesi.jpg"));
    gameMap[5] = new UnbuyableTiles("Crazy Fangirl", "unbuyable",25,25,25,loadImage("fangirl.jpg"));
    gameMap[6] = new BuyableTiles("Gongju-si", "buyable", 250,0,153,153,loadImage("gongjusi.jpg"));
    gameMap[7] = new BuyableTiles("Sangju-si", "buyable", 250,0,153,153,loadImage("sangjusi.jpg"));
    gameMap[8] = new UnbuyableTiles("Disney+ collab", "unbuyable",25,25,25,loadImage("disneyplus.jpg"));
    gameMap[9] = new BuyableTiles("Gimje-si", "buyable", 250,0,153,153,loadImage("gimjesi.jpg"));
    gameMap[10] = new UnbuyableTiles("Rest stop", "unbuyable",25,25,25);
    gameMap[11] = new BuyableTiles("Jeongeup-si", "buyable", 300,204,0,102,loadImage("jeongeupsi.png"));
    gameMap[12] = new BuyableTiles("Gimcheon-si", "buyable", 300,204,0,102,loadImage("gimcheonsi.png"));
    gameMap[13] = new UnbuyableTiles("Thief", "unbuyable",25,25,25,loadImage("thief.jpg"));
    gameMap[14] = new BuyableTiles("Gwangyang-si", "buyable", 300,204,0,102,loadImage("gwangyangsi.jpg"));
    gameMap[15] = new UnbuyableTiles("Airport", "Airport",25,25,25,loadImage("airport.jpg"));
    gameMap[16] = new BuyableTiles("Yangju-si", "buyable", 325,204,102,0,loadImage("yangjusi.jpg"));
    gameMap[17] = new BuyableTiles("Chungju-si", "buyable", 325,204,102,0,loadImage("chungjusi.jpg"));
    gameMap[18] = new UnbuyableTiles("Tax Fraud", "unbuyable",25,25,25,loadImage("IRS.jpg"));
    gameMap[19] = new BuyableTiles("Gwangmyeong-si", "buyable", 325,204,102,0,loadImage("gwangmyeongsi.jpg"));
    gameMap[20] = new UnbuyableTiles("Rest stop", "unbuyable",25,25,25);
    gameMap[21] = new BuyableTiles("Iksan-si", "buyable", 350,204,0,0,loadImage("iksansi.png"));
    gameMap[22] = new BuyableTiles("Gunsan-si", "buyable", 350,204,0,0,loadImage("gunsansi.png"));
    gameMap[23] = new UnbuyableTiles("Concert", "unbuyable",25,25,25,loadImage("concert.png"));
    gameMap[24] = new BuyableTiles("Gunpo-si", "buyable", 350,204,0,0,loadImage("gunposi.jpg"));
    gameMap[25] = new UnbuyableTiles("New Merch", "unbuyable",25,25,25,loadImage("bts21.jpg"));
    gameMap[26] = new BuyableTiles("Gimhae-si", "buyable", 400,255,255,0,loadImage("gimhaesi.jpg"));
    gameMap[27] = new BuyableTiles("Yeosu-si", "buyable", 400,255,255,0,loadImage("yeosusi.jpg"));
    gameMap[28] = new UnbuyableTiles("Kidnappers", "unbuyable",25,25,25,loadImage("kidnap.jpg"));
    gameMap[29] = new BuyableTiles("Gyeongju-si", "buyable", 400,255,255,0,loadImage("gyeongjusi.png"));
    gameMap[30] = new UnbuyableTiles("Rest stop", "unbuyable",25,25,25);
    gameMap[31] = new BuyableTiles("Seongnam-si", "buyable", 450,0,153,0,loadImage("seongnamsi.jpg"));
    gameMap[32] = new BuyableTiles("Cheongju-si", "buyable", 450,0,153,0,loadImage("cheongjusi.jpg"));
    gameMap[33] = new UnbuyableTiles("Pyramid Scheme", "unbuyable",25,25,25,loadImage("pyramid.png"));
    gameMap[34] = new BuyableTiles("Bucheon-si", "buyable", 450,0,153,0,loadImage("bucheonsi.png"));
    gameMap[35] = new UnbuyableTiles("Airplane", "Airplane",25,25,25,loadImage("airplane.jpg"));
    gameMap[36] = new BuyableTiles("Incheon", "buyable", 500,0,0,204,loadImage("incheon.jpg"));
    gameMap[37] = new BuyableTiles("Busan", "buyable", 500,0,0,204,loadImage("busan.jpg"));
    gameMap[38] = new UnbuyableTiles("Wallet on floor", "unbuyable",25,25,25,loadImage("wallet.png"));
    gameMap[39] = new BuyableTiles("Seoul", "buyable", 500,0,0,204,loadImage("seoul.jpg"));
 
  }

  void grid() {
    textSize(30);
    fill(255, 0, 0);
    rect(30, 30, 75, 30, 10);
    fill(255);
    text("Menu", 35, 55);
    int startW =width/4-180;
    int startH = 5;
    int rectW = 100;
    int rectH = 90;
    for (int i=0; i < gameMap.length; i++) {

        fill(255);
        rect(startW, startH, rectW, rectH);
        if (gameMap[i].hasPfp()) {
          image(gameMap[i].tilePfp(), startW, startH, rectW, rectH);
        }
        gameMap[i].setCoords(startW, startH, startW+rectW, startH+rectH);
        if (gameMap[i].getType().equals("buyable")){
          fill(gameMap[i].tileColor());
         rect(startW, startH, rectW, rectH/4);
        } else if (!gameMap[i].getName().equals("Go")){
           fill(255);
         rect(startW, startH, rectW, rectH/4);
        }
       
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
    fill(0);
    text(gameMap[0].getName(), startW+20, startH+20);
    fill(0);
    
    
    for (int i=0; i < gameMap.length; i++) {
      if (i == 1||i == 2 ||i == 4||i == 39 ||i == 37 ||i == 36){
        
      fill(255);
      }
      if (i == 8 || i == 33 || i ==19){
        textSize(13);
      } else {
        textSize(16);
      }
      if (!gameMap[i].getName().equals("Nothing") && !gameMap[i].getName().equals("Go")) {
        text(gameMap[i].getName(), startW+2, startH+20);
      }
      if (gameMap[i].getType().equals("buyable")) {
        fill(255,0,0);
        rect(startW+32,startH+72,30,15);
        fill(255);
        text(gameMap[i].getPrice(), startW+35, startH+85);
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
