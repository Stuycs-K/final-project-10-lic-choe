import java.util.Random;
int turn;
static int PLAYERONE = 0;
static int PLAYERTWO = 1;
Player[] players;
Map screen;
int movement;
int p1pos = 0;
int p2pos = 0;
int movement1;
int movement2;
   int startW =width/4+400;  
   int startH = 100;
int rectW = 145;
    int rectH = 200;

  
void setup() {
  size(1500, 1000);
  start();
  end();
}

void start() {
  players = new Player[2];
  turn = -1;
  players[0] = new Player("Player One");
  players[1] = new Player("Player Two");
  players[0].setColor(color(255, 0, 0));
  players[1].setColor(color(0, 0, 255));
  
}

void end() {
}

void draw() {
  background(255);
  screen = new Map();
  screen.build();

  displayPlayerStat(players[0], 100, 10);
  displayPlayerStat(players[1], 1300, 10);
    playerLocation(players[0]);
   playerLocation(players[1]);
  text(players[0].pos(),width/2,height/2-100);
  text(players[1].pos(),width/2,height/2+100);
}

void keyPressed() {
  if (key == ENTER) {
    turn++;
    turn%=2;
    if (turn == PLAYERONE) {
      movement1 = players[0].takeTurn();
      p1pos = players[0].pos();
      println("p1pos" + p1pos); 
       
    } else {
      movement2 = players[1].takeTurn();
      p2pos = players[1].pos();
      println("p2pos" + p2pos);
      
    }
  }
  if (key == 'b') {
    if (turn == PLAYERONE) {
      if (screen.gameMap[p1pos].getType().equals("buyable") && (players[0].owned().indexOf(screen.gameMap[p1pos]) == -1)) {
        players[0].buy(screen.gameMap[p1pos]);
        
      }
    } else {
      if (screen.gameMap[p2pos].getType().equals("buyable") && (players[1].owned().indexOf(screen.gameMap[p2pos]) == -1)) {
        players[1].buy(screen.gameMap[p2pos]);
        
      }
    }
  }
}

void statBox(float x, float y, int xS, int yS) {
  fill(200);
  rect(x, y, xS, yS);
}

void displayPlayerStat(Player currentP, float xVal, float yVal) {
  statBox(xVal, yVal, 150, 50);
  statBox(xVal, yVal+70, 150, 50);
  statBox(xVal, yVal+290, 150, 600);
  statBox(xVal, yVal+150, 150, 100);
  fill(0);
  float increment = 20;
  ArrayList<Tiles> ownedProperties = currentP.owned();
  if (ownedProperties.isEmpty()) {
    text("NO PROPERTY YET!", xVal+10, yVal + 330);
  } else {
    for (int i = 0; i < currentP.owned().size(); i++) {
      text(currentP.owned().get(i).getName(), xVal, yVal + increment+330);

      increment += 20;
    }
  }
  text("Player Name:", xVal+20, yVal+15);
  text(currentP.name(), xVal+20, yVal + 40);
  text("Player Balance:", xVal+20, yVal+85);
  text(currentP.bank(), xVal+20, yVal +110);
  text("Player Property:", xVal+20, yVal + 307);
  text("Player Roll:", xVal+20, yVal+170);
  textSize(30);
  if (currentP.name().equals("Player One")) {
    text(movement1, xVal+40, yVal+220);
    textSize(15);
  }
  if (currentP.name().equals("Player Two")) {
    text(movement2, xVal+40, yVal+220);
    textSize(15);
  }
}

void displayPlayer(color playerC, float x, float y) {
  fill(playerC);
  float radi = 30;
  ellipse(x, y, radi, radi);
}

 void playerLocation(Player player) {
    
    if ( player.pos()  == 0){
      displayPlayer(player.getColor(), startW,startH);
    }
    if (player.pos() == 1){
      displayPlayer(player.getColor(), startW + rectW,startH);
    }
    if (player.pos() == 2){
      displayPlayer(player.getColor(), startW + rectW+rectW,startH);
    }
    if (player.pos() == 3){
      displayPlayer(player.getColor(),startW + rectW+rectW+rectW,startH);
    }
    if (player.pos() == 4){
      displayPlayer(player.getColor(), startW + (4 *rectW),startH);
    }
    if (player.pos() == 5){
      displayPlayer(player.getColor(),startW + (4 *rectW),startH + ( 1 * rectH));
    }
    if (player.pos() == 6){
      displayPlayer(player.getColor(), startW + (4 *rectW),startH + ( 2 * rectH));
    }
    if (player.pos() == 7){
      displayPlayer(player.getColor(), startW + (4 *rectW),startH + ( 3 * rectH));
    }
    if (player.pos() == 8){
      displayPlayer(player.getColor(), startW + (4 *rectW),startH + ( 4 * rectH));
    }
    if (player.pos() == 9){
    displayPlayer(player.getColor(), startW + (3 *rectW),startH + ( 4 * rectH));
  }
    if (player.pos() == 10){
      displayPlayer(player.getColor(), startW + (2 *rectW),startH + ( 4 * rectH));
    }
    if (player.pos() == 11){
      displayPlayer(player.getColor(), startW + (1 *rectW),startH + ( 4 * rectH));
    }
    if (player.pos() == 12){
      displayPlayer(player.getColor(), startW ,startH + ( 4 * rectH));
    }
    if (player.pos() == 13){
      displayPlayer(player.getColor(), startW ,startH + ( 3 * rectH));
    }
     if (player.pos() == 14){
     displayPlayer(player.getColor(), startW ,startH + ( 2 * rectH));
     }
      if (player.pos() == 15){
      displayPlayer(player.getColor(), startW ,startH + ( 1 * rectH));
      }
       
    
    
  }
  

  
