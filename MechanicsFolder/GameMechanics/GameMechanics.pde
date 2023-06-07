import java.util.Random;
int turn;
PImage img, bts,btsjoe, kenny,tolkien,cartman,kyle, dora, boots, swiper, diego ,ssbu,gameover;
static int PLAYERONE = 0;
static int PLAYERTWO = 1;
Player[] players;
Map screen;
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
  
void setup() {
  size(1500, 1000);
  turn = 0;
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
  screen = new Map();
  start();
}

void controlScreen(){
btsjoe = loadImage("btsjoe.png");
image(btsjoe,0,0,width,height);
 fill(255,0,0);
 rect(30,30,75,30);
 fill(255);
 textSize(30);
 text("Menu",35,55);
 fill(255,0,0);
 rect(width/2-350, 800, 700, 50, 30);
  rect(width/2-350, 650, 700, 50, 30);
  fill(255);
   text("To roll, press \"enter\" on your keyboard!",width/2-220,685);
  text("To buy property, press \"b\" on your keyboard!", width/2-300,835);
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
  text("Controls", width/2-130,765);
  image(img, 200, 10);
}

void avatarScreen(){
  /*
  ssbu = loadImage("ssbu.png");
  image(ssbu,0,0,width,height);
  */
  background(255);
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
  rect(30,30,75,30);
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
  textAlign(CENTER);
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
  if (endScreen) {
    if (key == 'r') {
      setup();
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

 void playerLocation(Player player) {
    
    if ( player.pos()  == 0){
        displayPlayer(player.getPfpimg(),startW,startH);      
    }
    else if (player.pos() == 1){
        displayPlayer(player.getPfpimg(),startW + rectW,startH);
    }
    else if (player.pos() == 2){
        displayPlayer(player.getPfpimg(),startW + rectW+rectW,startH);
    }
    else if (player.pos() == 3){
      displayPlayer(player.getPfpimg(),startW + rectW+rectW+rectW,startH);
    }
    else if (player.pos() == 4){
        displayPlayer(player.getPfpimg(),startW + (4 *rectW),startH);
    }
    else if (player.pos() == 5){
        displayPlayer(player.getPfpimg(),startW + (4 *rectW),startH + ( 1 * rectH));
    }
    else if (player.pos() == 6){
        displayPlayer(player.getPfpimg(),startW + (4 *rectW),startH + (2 * rectH));
    }
    else if (player.pos() == 7){
        displayPlayer(player.getPfpimg(),startW + (4 *rectW),startH + ( 3 * rectH));
    }
    else if (player.pos() == 8){
        displayPlayer(player.getPfpimg(),startW+ (4 *rectW),startH+ ( 4 * rectH));
    }
    else if (player.pos() == 9){
        displayPlayer(player.getPfpimg(),startW+ (3 *rectW),startH+ ( 4 * rectH));
  }
    else if (player.pos() == 10){
        displayPlayer(player.getPfpimg(),startW+ (2 *rectW),startH+ ( 4 * rectH));
    }
    else if (player.pos() == 11){
        displayPlayer(player.getPfpimg(),startW+ (1 *rectW),startH+ ( 4 * rectH));
    }
    else if (player.pos() == 12){
        displayPlayer(player.getPfpimg(),startW,startH+ ( 4 * rectH));
    }
    else if (player.pos() == 13){
        displayPlayer(player.getPfpimg(),startW,startH+ ( 3 * rectH));
    }
    else if (player.pos() == 14){
        displayPlayer(player.getPfpimg(),startW,startH+ ( 2 * rectH));
    }
    else if (player.pos() == 15){
        displayPlayer(player.getPfpimg(),startW ,startH + ( 1 * rectH));
    }
  }

  
