import java.util.Random;
import processing.sound.*;
int turn;
PImage img, bts,btsjoe,bts2, kenny,tolkien,cartman,kyle, dora, boots, swiper, diego,gameover;
static int PLAYERONE = 0;
static int PLAYERTWO = 1;
Player[] players;
BTSMap screen;
boolean loadingScreen;
boolean avatarScreen;
boolean gameScreen;
boolean endScreen;
boolean menuButtonOver;
boolean controlScreen;
int movement;
int p1pos = 0;
int p2pos = 0;
int movement1;
int movement2;
int startW =width/4+400;  
int startH = 100;
int rectW = 145;
int rectH = 200;
boolean playOver;
boolean avatarOver;
boolean controlOver;
int prevPos1 = 0;
int prevPos2 = 0;
boolean mortgaging1;
boolean mortgaging2;
void setup() {
  size(1500, 1000);
  turn = -1;
  loadingScreen = true;
  avatarScreen = false;
  gameScreen = false;
  endScreen = false;
  menuButtonOver = false;
  controlScreen = false;
  playOver = false;
  avatarOver = false;
  controlOver = false;
  kenny = loadImage("kenny.png");
  tolkien =loadImage("tolkien.png");
  cartman = loadImage("cartman.png");
  kyle = loadImage("kyle.png");
  dora = loadImage("dora.png");
  boots= loadImage("boots.png");
  swiper = loadImage("swiper.png");
  diego = loadImage("diego.png");
  screen = new BTSMap();
  start();
}

void controlScreen(){
btsjoe = loadImage("btsjoe.png");
image(btsjoe,0,0,width,height);
 fill(255,0,0);
 rect(30,30,75,30,10);
 fill(255);
 textSize(30);
 text("Menu",35,55);
 fill(255,0,0);
 rect(width/2-730, 800, 700, 50, 30);
 rect(width/2-730, 725, 700, 50, 30);
 rect(width/2-730, 650, 700, 50, 30);
  rect(width/2+30, 800, 700, 50, 30);
 rect(width/2+30, 725, 700, 50, 30);
 rect(width/2+30, 650, 700, 50, 30);
 fill(255);
 text("To roll your dice, press \"enter\"!",width/2-700,685);
 text("To sell your property, press \"m\"and click on the tile!", width/2-700, 760);
 text("To buy property, press \"b\"!", width/2-700,835);
 text("Person who goes to 0 dollars loses!",width/2+60, 835);
 text("There are special tiles scattered throughout the map!",width/2+60, 760);
 text("Hover over a tile to look at it!",width/2+60, 685);
}
void loadingScreen(){
  img = loadImage("monoplylogo.png");
  bts = loadImage("bts.png");
  image(bts,0,0,width,height);
  fill(255,0,0);
  rect(width/2-250, 800, 500, 50, 30);
  rect(width/2-250, 650, 500, 50, 30);
  rect(width/2-250, 725, 500, 50, 30);
  fill(255);
  textSize(40);
  text("Play Game",width/2-130,690);
  text("Select Avatar", width/2-130,840);
  text("Rules", width/2-130,765);
  image(img, 200, 10);
}

void avatarScreen(){
  bts2 = loadImage("stage.jpg");
  image(bts2,0,0,width,height);
  fill(0);
  textSize(50);
  fill(255,0,0);
  rect(width/2-300, height/2-250, 450, 70, 30);
  rect(width/2-300, height/2+50, 450, 70, 30);
  if (players[0].getPfp().equals("kenny")) {
    rect(200, height/2-150, 150, 150);
  }
  image(kenny,200,height/2-150,150,150);
  if (players[0].getPfp().equals("tolkien")) {
    rect(525,height/2-150, 150, 150);
  }
  image(tolkien,450,height/2-150,300,150);
  if (players[0].getPfp().equals("cartman")) {
    rect(800, height/2-150, 150, 150);
  }
  image(cartman,800,height/2-150,150,150);
  if (players[0].getPfp().equals("kyle")) {
    rect(1100, height/2-150, 150, 150);
  }
  image(kyle,1100,height/2-150,150,150);
  if (players[1].getPfp().equals("dora")) {
    rect(200, height/2+150, 150, 150);
  }
  image(dora,200,height/2+150,150,150);
  if (players[1].getPfp().equals("boots")) {
    rect(500, height/2+150, 175, 175);
  }
  image(boots,500,height/2+150,150,150);
  if (players[1].getPfp().equals("swiper")) {
    rect(800, height/2+150, 175, 175);
  }
  image(swiper,800,height/2+150,150,150);
  if (players[1].getPfp().equals("diego")) {
    rect(1100, height/2+150, 175, 175);
  }
  image(diego,1100,height/2+150,150,150);
  fill(255);
  text("Player 1 Avatars: ",width/2-250,height/2-200);
  text("Player 2 Avatars: ",width/2-250,height/2+100);
  textSize(30);
  fill(255,0,0);
  rect(30,30,75,30,10);
  fill(255);
  text("Menu",35,55);
  fill(0);
  textSize(75);
  if (overRect(200,height/2-150,150,150)){
    text("Kenny",width/2-100,55);
  } else if (overRect(500,height/2-150,150,150)){
  text("Tolkien",width/2-100,55);
  }else if (overRect(800,height/2-150,150,150)){
  text("Cartman",width/2-100,55);
  }else if (overRect(1100,height/2-150,150,150)){
  text("Kyle",width/2-100,55);
  }else if (overRect(200,height/2+150,150,150)){
  text("dora",width/2-100,55);
  }else if (overRect(500,height/2+150,150,150)){
  text("boots",width/2-100,55);
  }else if (overRect(800,height/2+150,150,150)){
  text("swiper",width/2-100,55);
  }else if (overRect(1100,height/2+150,150,150)){
  text("diego",width/2-100,55);
  }
}

void start() {
 
  players = new Player[2];
  turn = -1;
  players[0] = new Player("Player One");
  players[1] = new Player("Player Two");
  players[0].setColor(color(255, 0, 0));
  players[1].setColor(color(0, 0, 255));
  players[0].setPfp("kenny", kenny);
  players[1].setPfp("dora", dora);
  
}

void end() {
  endScreen = true;
  gameover = loadImage("gameOver.jpg");
  textSize(200);
  //textAlign(CENTER);
  image(gameover, 0, 0, 1500, 1000);
  if (players[0].broke()) {
    text("PLAYER 2 WINS!!!", width/2, height/2);
  }
  else {
    text("PLAYER 1 WINS!!!", 750, 500);
  }
  text ("press r to restart", 750, 750);
}

void draw() {
  update(mouseX, mouseY);
  if (loadingScreen){
    loadingScreen();
  } else if (controlScreen) {
    controlScreen();
  }else if(avatarScreen){
    avatarScreen();    
  }else if(gameScreen){
   background(255);
  screen.build();
  displayPlayerStat(players[0], 10, 100);
  displayPlayerStat(players[1], 1340, 100);
  playerLocation(players[0]);
  playerLocation(players[1]);
  text(players[0].pos(),width/2,height/2-100);
  text(players[1].pos(),width/2,height/2+100);
  if (mouseOverTile() != -1) {
    displayTileStat(mouseOverTile());
  }
  if (players[0].broke() || players[1].broke()) {
    end();
  }
  if (screen.gameMap[p1pos].getName().equals("Pyramid \nScheme") ||screen.gameMap[p2pos].getName().equals("Pyramid \nScheme")) {  
       textSize(40);
        text("Oh no, you got caught scamming the government!\nThe government seized half your money!", 300,300);
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
        prevPos1 = p1pos;
        p1pos = players[0].pos();
        if (screen.gameMap[p1pos].getType().equals("Airplane")) {
          players[0].fly();
          p1pos = players[0].pos();
        }
        if (screen.gameMap[p1pos].getName().equals("Pyramid \nScheme")) {
          players[0].pay(players[0].bank()*.5);
          
        }
        if (players[1].properties.indexOf(screen.gameMap[p1pos]) != -1) {
          players[0].pay(screen.gameMap[p1pos].getPrice());
          players[1].add(screen.gameMap[p1pos].getPrice());
        }else if (p1pos < prevPos1 || p1pos == 0) { 
          players[0].add(200);
        }   
      } else {
        movement2 = players[1].takeTurn();
        prevPos2 = p2pos;
        p2pos = players[1].pos();
        if (screen.gameMap[p2pos].getType().equals("Airplane")) {
          players[1].fly();
          p2pos = players[1].pos();
        }
        if (screen.gameMap[p2pos].getName().equals("Pyramid \nScheme")) {
          players[1].pay(players[1].bank()*.5);

        }
        if (players[0].properties.indexOf(screen.gameMap[p2pos]) != -1) {
          players[1].pay(screen.gameMap[p2pos].getPrice());
          players[0].add(screen.gameMap[p2pos].getPrice());
        }
        else if (p2pos < prevPos2 || p2pos == 0) {
          players[1].add(200);
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
    if (key == 'm') {
      if (turn == PLAYERONE) {
        mortgaging1 = true;
      }
      else {
        mortgaging2 = true;
      }
    }
    if (key == 'c') {
      mortgaging1 = false;
      mortgaging2 = false;
    }
  }
  else if (avatarScreen) {
  }
  else if (endScreen) {
    if (key == 'r') {
      setup();
    }
  }
}

void statBox(float x, float y, int xS, int yS) {
  fill(200);
  rect(x, y, xS, yS);
}

void displayTileStat(int tilenum) {
  noFill();
  if (players[0].owned().indexOf(screen.gameMap[tilenum]) != -1) {
    stroke(255,0,0);
  }
  else if (players[1].owned().indexOf(screen.gameMap[tilenum]) != -1) {
    stroke (0,0,255);
  }
  rect(650,300,200,200);
  line(650,330,850,330);
  textAlign(CENTER);
  text(screen.gameMap[tilenum].getName(), 750, 320);
  if (screen.gameMap[tilenum].getType().equals("buyable")){
  text("Price: " + screen.gameMap[tilenum].getPrice(), 750, 375);
  }
  textAlign(LEFT);
  fill(255);
  stroke(0, 0, 0);
}

void displayPlayerStat(Player currentP, float xVal, float yVal) {
  statBox(xVal, yVal, 150, 50);
  statBox(xVal, yVal+70, 150, 50);
  statBox(xVal, yVal+290, 150, 600);
  statBox(xVal, yVal+150, 150, 100);
  textSize(15);
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

void displayPlayer(PImage playerIcon,float x, float y){
  image(playerIcon,x,y,50,50);
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
  if (controlOver){
    loadingScreen = false;
    controlScreen = true;
  }
}
 if (avatarScreen){
   if (menuButtonOver){
     loadingScreen = true;
     avatarScreen = false;
   } 
    if (overRect(200,height/2-150,150,150)){
    players[0].setPfp("kenny", kenny);
  } else if (overRect(500,height/2-150,150,150)){
    players[0].setPfp("tolkien", tolkien); 
  }else if (overRect(800,height/2-150,150,150)){
 players[0].setPfp("cartman", tolkien); 
    }else if (overRect(1100,height/2-150,150,150)){
    players[0].setPfp("kyle", kyle); 
  }else if (overRect(200,height/2+150,150,150)){
     players[1].setPfp("dora", dora); 
  }else if (overRect(500,height/2+150,150,150)){
  players[1].setPfp("boots", boots);
  }else if (overRect(800,height/2+150,150,150)){
  players[1].setPfp("swiper", swiper); 
    }else if (overRect(1100,height/2+150,150,150)){
 players[1].setPfp("diego", diego); 
}
 }
 if (gameScreen){
   if (menuButtonOver){
     loadingScreen = true;
     gameScreen = false;
   }
   if (mortgaging1 && players[0].owned().indexOf(screen.gameMap[mouseOverTile()]) != -1) {
     players[0].mortgage(screen.gameMap[mouseOverTile()]);
     mortgaging1 = false;
   }
   else if (mortgaging2 && players[1].owned().indexOf(screen.gameMap[mouseOverTile()]) != -1) {
     players[1].mortgage(screen.gameMap[mouseOverTile()]);
     mortgaging2 = false;
   }
 }
 if (controlScreen){
   if (menuButtonOver){
     loadingScreen = true;
     controlScreen = false;
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
  controlOver = overRect(width/2-250, 725, 500, 50);
}

int mouseOverTile() {
  for (int i = 0; i < screen.gameMap.length; i++) {
    if (mouseX >= screen.gameMap[i].getStartX() && mouseX <= screen.gameMap[i].getEndX() && mouseY >= screen.gameMap[i].getStartY() && mouseY <= screen.gameMap[i].getEndY()) {
      return i;
    }
  }
  return -1;
}

 void playerLocation(Player player) {
   if (player.name().equals(players[0].name())){
   displayPlayer(player.getPfpimg(),screen.gameMap[player.pos()].getStartX()+5,screen.gameMap[player.pos()].getStartY()+30);
   } else {
   displayPlayer(player.getPfpimg(),screen.gameMap[player.pos()].getStartX()+45,screen.gameMap[player.pos()].getStartY()+30);
   }
  }

  
