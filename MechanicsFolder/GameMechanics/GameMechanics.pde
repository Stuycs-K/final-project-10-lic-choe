import java.util.Random;
int turn;
PImage img, bts;
PImage[] tokens;
static int PLAYERONE = 0;
static int PLAYERTWO = 1;
Player[] players;
Map screen;
boolean loadingScreen = true;
boolean avatarScreen = false;
boolean gameScreen = false;
boolean menuButtonOver = false;
int movement;
int p1pos = 0;
int p2pos = 0;
int movement1;
int movement2;
int startW =width/4+400;  
int startH = 100;
int rectW = 145;
int rectH = 200;
boolean playOver = false;
boolean avatarOver = false;
  
void setup() {
  size(1500, 1000);
  screen = new Map();
  start();
  
}
void loadingScreen(){
  img = loadImage("monoplylogo.png");
  bts = loadImage("bts.png");
  image(bts,0,0,width,height);
  fill(255,0,0);
  rect(width/2-250, 800, 500, 50, 30);
  rect(width/2-250, 650, 500, 50, 30);
  fill(255);
  textSize(40);
  text("Play Game",width/2-130,690);
  text("Select Avatar", width/2-130,840);
  image(img, 200, 10);
}

void avatarScreen(){
  background(23,252,239);
  fill(0);
  textSize(100);
  text("NEED TO WORK ON THIS SOON",0,height/2);
  textSize(30);
  fill(255,0,0);
  rect(30,30,75,30);
  fill(255);
  text("Menu",35,55);
  tokens = new PImage[4];
  tokens[0] = loadImage("dogtoken.png");
  tokens[1] = loadImage("hattoken.png");
  tokens[2] = loadImage("shiptoken.png");
  tokens[3] = loadImage("cartoken.png");
  image(tokens[0], 200, 150, 100, 100);
  image(tokens[1], 300, 150, 100, 100);
  image(tokens[2], 400, 150, 100, 100);
  image(tokens[3], 500, 150, 100, 100);
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
  background(255);
  text("GAME OVER", 300, 300);
}

void draw() {
  update(mouseX, mouseY);
  if (loadingScreen){
    loadingScreen();
  }else if(avatarScreen){
    avatarScreen();
  }else if(gameScreen){
   background(255);
  screen.build();
  displayPlayerStat(players[0], 150, 10);
  displayPlayerStat(players[1], 1200, 10);
    playerLocation(players[0]);
   playerLocation(players[1]);
  text(players[0].pos(),width/2,height/2-100);
  text(players[1].pos(),width/2,height/2+100);
  if (players[0].broke() || players[1].broke()) {
    end();
  }
  }
 
}

void keyPressed() {
  if (gameScreen) {
    if (key == ENTER) {
      turn++;
      turn%=2;
      if (turn == PLAYERONE) {
        movement1 = players[0].takeTurn();
        p1pos = players[0].pos();
        if (players[1].properties.indexOf(screen.gameMap[p1pos]) != -1) {
          players[0].pay(screen.gameMap[p1pos].getPrice());
          players[1].add(screen.gameMap[p1pos].getPrice());
        }
        println("p1pos" + p1pos);      
      } else {
        movement2 = players[1].takeTurn();
        p2pos = players[1].pos();
        if (players[0].properties.indexOf(screen.gameMap[p2pos]) != -1) {
          players[1].pay(screen.gameMap[p2pos].getPrice());
          players[0].add(screen.gameMap[p2pos].getPrice());
        }
        else if (screen.gameMap[p2pos].getName().equals("Go")) {
          players[0].add(200);
        }
      println("p2pos" + p2pos);
      }
    }
    if (key == 'b') {
      if (turn == PLAYERONE) {
        if (screen.gameMap[p1pos].getType().equals("buyable") && !screen.gameMap[p1pos].isOwned()) {
          players[0].buy(screen.gameMap[p1pos]);
        }
      } else {
        if (screen.gameMap[p2pos].getType().equals("buyable") && !screen.gameMap[p2pos].isOwned()) {
          players[1].buy(screen.gameMap[p2pos]);  
        }
      }
    }    
  }
  if (avatarScreen) {
    if (key == ' ') {
       
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
  if (currentP.name().equals("Player One")) {
    fill(255,0,0);
  }
  else {
    fill(0,0,255);
  }
  text(currentP.name(), xVal+20, yVal + 40);
  fill(0,0,0);
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
  
void mousePressed(){
if (loadingScreen){
  if (avatarOver){
    avatarScreen = true;
    loadingScreen = false;
  }
  if (playOver){
    loadingScreen = false;
    gameScreen = true;
  }
}
 if (avatarScreen){
   if (menuButtonOver){
     loadingScreen = true;
     avatarScreen = false;
   }
 }
 if (gameScreen){
   if (menuButtonOver){
     loadingScreen = true;
     gameScreen = false;
   }
 }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void update(int x, int y) {
  avatarOver = overRect(width/2-250, 800, 500, 50);
  playOver = overRect(width/2-250, 650, 500, 50);
  menuButtonOver = overRect(30,30,75,30);
}

  
