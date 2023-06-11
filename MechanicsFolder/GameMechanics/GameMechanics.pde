import java.util.Random; //<>//
import processing.sound.*;
int turn;
PImage img, bts, btsjoe, bts2, kenny, tolkien, cartman, kyle, dora, boots, swiper, diego, gameover, disneyplus, pyramid, irs, lottery, kidnap, bt21, concert, thief, fangirl, wallet; //<>//
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
float lot1, lot2, fan1, fan2, wallet1, wallet2;

void setup() {
  size(1500, 1000);
  turn= -1;
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
  disneyplus = loadImage("disneyplus.jpg");
  pyramid=loadImage("pyramid.png");
  irs=loadImage("IRS.jpg");
  lottery = loadImage("lottery.jpg");
  kidnap =loadImage("kidnap.jpg");
  bt21=loadImage("bts21.jpg");
  concert=loadImage("concert.png");
  thief=loadImage("thief.jpg");
  fangirl = loadImage("fangirl.jpg");
  wallet = loadImage("wallet.png");
  screen = new BTSMap();
  start();
}

void controlScreen() {
  btsjoe = loadImage("btsjoe.png");
  image(btsjoe, 0, 0, width, height);
  fill(255, 0, 0);
  rect(30, 30, 75, 30, 10);
  fill(255);
  textSize(30);
  text("Menu", 35, 55);
  fill(255, 0, 0);
  rect(width/2-730, 950, 700, 50, 30);
  rect(width/2+30, 950, 700, 50, 30);
  rect(width/2-730, 875, 700, 50, 30);
  rect(width/2+30, 875, 700, 50, 30);
  rect(width/2-730, 800, 700, 50, 30);
  rect(width/2-730, 725, 700, 50, 30);
  rect(width/2-730, 650, 700, 50, 30);
  rect(width/2+30, 800, 700, 50, 30);
  rect(width/2+30, 725, 700, 50, 30);
  rect(width/2+30, 650, 700, 50, 30);
  rect(width/2-730, 575, 700, 50, 30);
  rect(width/2+30, 575, 700, 50, 30);
  fill(255);
  text("To roll your dice, press \"enter\"!", width/2-700, 610);
  text("To sell your property, press \"m\"and click on the tile!", width/2-700, 685);
  text("To buy property, press \"b\"!", width/2+60, 610);
  text("Player who goes to 0 dollars loses!", width/2+60, 685);
  text("There are special tiles scattered throughout the map!", width/2+60, 760);
  text("Hover over a tile to look at it!", width/2-700, 760);
  text("Airplane teleports you to Airport.", width/2+60, 835);
  text("Concert, new merch, and Disney+ collab get you money.", width/2-700, 835);
  text("Lottery and wallet have a channce of giving money.", width/2-700, 910);
  text("Pyramid scheme and tax fraud make you lose half.", width/2+60, 910);
  text("Thieves steal your money.", width/2+60, 985);
  text("Crazy fangirls might steal your money.", width/2-700, 985);
}
void loadingScreen() {
  img = loadImage("monoplylogo.png");
  bts = loadImage("bts.png");
  image(bts, 0, 0, width, height);
  fill(255, 0, 0);
  rect(width/2-250, 800, 500, 50, 30);
  rect(width/2-250, 650, 500, 50, 30);
  rect(width/2-250, 725, 500, 50, 30);
  fill(255);
  textSize(40);
  text("Play Game", width/2-130, 690);
  text("Select Avatar", width/2-130, 840);
  text("Rules", width/2-130, 765);
  image(img, 200, 10);
}

void avatarScreen() {
  bts2 = loadImage("stage.jpg");
  image(bts2, 0, 0, width, height);
  fill(0);
  textSize(50);
  fill(255, 0, 0);
  rect(width/2-300, height/2-250, 450, 70, 30);
  rect(width/2-300, height/2+50, 450, 70, 30);
  if (players[0].getPfp().equals("kenny")) {
    rect(200, height/2-150, 150, 150);
  }
  image(kenny, 200, height/2-150, 150, 150);
  if (players[0].getPfp().equals("tolkien")) {
    rect(525, height/2-150, 150, 150);
  }
  image(tolkien, 450, height/2-150, 300, 150);
  if (players[0].getPfp().equals("cartman")) {
    rect(800, height/2-150, 150, 150);
  }
  image(cartman, 800, height/2-150, 150, 150);
  if (players[0].getPfp().equals("kyle")) {
    rect(1100, height/2-150, 150, 150);
  }
  image(kyle, 1100, height/2-150, 150, 150);
  if (players[1].getPfp().equals("dora")) {
    rect(200, height/2+150, 150, 150);
  }
  image(dora, 200, height/2+150, 150, 150);
  if (players[1].getPfp().equals("boots")) {
    rect(500, height/2+150, 175, 175);
  }
  image(boots, 500, height/2+150, 150, 150);
  if (players[1].getPfp().equals("swiper")) {
    rect(800, height/2+150, 175, 175);
  }
  image(swiper, 800, height/2+150, 150, 150);
  if (players[1].getPfp().equals("diego")) {
    rect(1100, height/2+150, 175, 175);
  }
  image(diego, 1100, height/2+150, 150, 150);
  fill(255);
  text("Player 1 Avatars: ", width/2-250, height/2-200);
  text("Player 2 Avatars: ", width/2-250, height/2+100);
  textSize(30);
  fill(255, 0, 0);
  rect(30, 30, 75, 30, 10);
  fill(255);
  text("Menu", 35, 55);
  fill(0);
  textSize(75);
  if (overRect(200, height/2-150, 150, 150)) {
    text("Kenny", width/2-100, 55);
  } else if (overRect(500, height/2-150, 150, 150)) {
    text("Tolkien", width/2-100, 55);
  } else if (overRect(800, height/2-150, 150, 150)) {
    text("Cartman", width/2-100, 55);
  } else if (overRect(1100, height/2-150, 150, 150)) {
    text("Kyle", width/2-100, 55);
  } else if (overRect(200, height/2+150, 150, 150)) {
    text("dora", width/2-100, 55);
  } else if (overRect(500, height/2+150, 150, 150)) {
    text("boots", width/2-100, 55);
  } else if (overRect(800, height/2+150, 150, 150)) {
    text("swiper", width/2-100, 55);
  } else if (overRect(1100, height/2+150, 150, 150)) {
    text("diego", width/2-100, 55);
  }
}

void start() {

  players = new Player[2];
  turn =  -1;
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
  } else {
    text("PLAYER 1 WINS!!!", 750, 500);
  }
  text ("press r to restart", 750, 750);
}

void draw() {
  update(mouseX, mouseY);
  if (loadingScreen) {
    loadingScreen();
  } else if (controlScreen) {
    controlScreen();
  } else if (avatarScreen) {
    avatarScreen();
  } else if (gameScreen) {
    background(191, 219, 174);
    screen.build();
    displayPlayerStat(players[0], 10, 100);
    displayPlayerStat(players[1], 1340, 100);
    playerLocation(players[0]);
    playerLocation(players[1]);
   
    fill(220, 220, 220);
    rect(700, 100, 70, 25);
    fill(0);
    textSize(15);
    text("NOTICE", 710, 120);
    if (turn == PLAYERONE || turn ==-1) {
      textSize(30);
      fill(255, 0, 0);
      rect(300, 170, 880, 45, 50);
      fill(255);
      text("It is " + players[0].name() +"'s turn to roll", 590, 200);
      if (turn > -1) {
        fill(255, 0, 0);
        rect(300, 260, 880, 45, 50);
        rect(300, 350, 880, 45, 50);
        fill(255);
        text(players[0].name() + " just rolled a " + movement2, 580, 290);
        text(players[0].name() + " went from " + screen.gameMap[prevPos2].getName() + " to " + screen.gameMap[p2pos].getName() +".", 400, 380);
      }
    } else {
      textSize(30);
      fill(255, 0, 0);
      rect(300, 170, 880, 45, 50);
      fill(255);
      text("It is " + players[1].name() +"'s turn to roll", 590, 200);
      if (turn > -1) {
        fill(255, 0, 0);
        rect(300, 260, 880, 45, 50);
        rect(300, 350, 880, 45, 50);
        fill(255);
        text(players[1].name() + " just rolled a " + movement1, 580, 290);
        text(players[1].name() + " went from " + screen.gameMap[prevPos1].getName() + " to " + screen.gameMap[p1pos].getName() +".", 400, 380);
      }
    }
    /*
    text(players[0].pos(), width/2, height/2-100);
     text(players[1].pos(), width/2, height/2+100);
    */
    if (players[0].broke() || players[1].broke()) {
      end();
    }
    fill(0);
    if ((screen.gameMap[p1pos].getName().equals("Pyramid Scheme")&&turn ==0) ||(screen.gameMap[p2pos].getName().equals("Pyramid Scheme")&&turn ==1)) {
      fill(191, 219, 174);
      rect(295, 95, 900, 815);
      textSize(35);
      image(pyramid, 470, 350, 600, 600);
      fill(255, 0, 0);
      rect(300, 790, 880, 40, 50);
      rect(300, 840, 880, 45, 50);
      fill(255);
      text("Oh no, " +players[turn].name() +  " got caught in a pyramid scheme!\nThe government seized half of "  +players[turn].name() + "'s money!", 305, 820);
    } else if ((screen.gameMap[p1pos].getName().equals("Disney+ collab")&&turn ==0)||(screen.gameMap[p2pos].getName().equals("Disney+ collab")&&turn ==1)) {
      textSize(40);
      image(disneyplus, 295, 95, 900, 815);
      fill(255, 0, 0);
      rect(300, 790, 880, 50, 50);
      rect(300, 850, 880, 50, 50);
      fill(255);
      text(players[turn].name() + " had a collab concert with Disney+!\n" + players[turn].name() +"'s net worth increased by 15%!", 305, 820);
    } else if ((screen.gameMap[p1pos].getName().equals("Tax Fraud") &&turn ==0)||(screen.gameMap[p2pos].getName().equals("Tax Fraud")&&turn ==1)) {
      fill(191, 219, 174);
      rect(295, 95, 900, 815);
      textSize(40);
      image(irs, 295, 200, 900, 400);
      fill(255, 0, 0);
      rect(300, 790, 880, 50, 50);
      rect(300, 850, 880, 50, 50);
      fill(255);
      text(players[turn].name() +" committed tax fraud.\nThe IRS seized half " +players[turn].name() + "'s assets.", 308, 822);
    } else if (screen.gameMap[p1pos].getName().equals("Lottery") &&turn ==0) {
      textSize(30);
      image(lottery, 295, 95, 900, 815);
      fill(255, 0, 0);
      rect(300, 790, 880, 50, 50);
      fill(255);
      if (lot1 > 0 && lot1 <= .33) {
        textSize(25);
        text(players[turn].name() +" won the lottery!"+players[turn].name() + "'s net worth incrased by 75%!", 305, 820);
      } else {
        text(players[turn].name() +" spent 10% of their net worth for a ticket and got nothing.", 305, 820);
      }
    } else if (screen.gameMap[p2pos].getName().equals("Lottery")&&turn ==1) {
      textSize(30);
      image(lottery, 295, 95, 900, 815);
      fill(255, 0, 0);
      rect(300, 790, 880, 50, 50);
      fill(255);
      if (lot2 > 0 && lot2 <= .33) {
        textSize(25);
        text(players[turn].name() +" won the lottery!"+players[turn].name() + "'s net worth incrased by 75%!", 305, 820);
      } else {
        text(players[turn].name() +" spent 10% of their net worth for a ticket and got nothing.", 305, 820);
      }
    } else if ((screen.gameMap[p1pos].getName().equals("Crazy Fangirl") &&turn ==0)) {
      image(fangirl, 295, 95, 900, 815);
      fill(255, 0, 0);
      rect(300, 790, 880, 50, 50);
      fill(255);
      textSize(20);
      if (fan1 > 0 && fan1 <=.5) {
        text("Wild fangirls ambushed "+ players[turn].name()+", stealing $300. Better luck next time!", 305, 820);
      } else {
        text("Phew, wild fangirls ambushed " +players[turn].name()+ ", but "+players[turn].name() + " managed to escape from the fangirls. Nice job.", 305, 820);
      }
    } else if (screen.gameMap[p2pos].getName().equals("Crazy Fangirl")&&turn ==1) {
      textSize(20);
      image(fangirl, 295, 95, 900, 815);
      fill(255, 0, 0);
      rect(300, 790, 880, 50, 50);
      fill(255);
      if (fan2 > 0 && fan2 <=.5) {
        text("Wild fangirls ambushed "+ players[turn].name()+", stealing $300.\nBetter luck next time!", 305, 820);
      } else {
        text("Wild fangirls ambushed " +players[turn].name()+ ", but "+players[turn].name() + " managed to escape from the fangirls. Nice job.", 305, 820);
      }
    } else if ((screen.gameMap[p1pos].getName().equals("Thief") &&turn ==0)||(screen.gameMap[p2pos].getName().equals("Thief")&&turn ==1)) {
      textSize(40);
      image(thief, 295, 95, 900, 815);
      fill(255, 0, 0);
      rect(300, 790, 880, 50, 50);
      fill(255);
      text(players[turn].name() +" got ambushed by a thief and lost $150.", 305, 823);
    } else if ((screen.gameMap[p1pos].getName().equals("Airplane") &&turn ==0)||(screen.gameMap[p2pos].getName().equals("Airplane")&&turn ==1)) {
      textSize(35);
      image(screen.gameMap[35].tilePfp(), 295, 95, 900, 815);
      fill(255, 0, 0);
      rect(300, 790, 880, 50, 50);
      fill(255);
      text(players[turn].name() +" got on an airplane and flew to the airport.", 305, 820);
    } else if ((screen.gameMap[p1pos].getName().equals("Concert") &&turn ==0)||(screen.gameMap[p2pos].getName().equals("Concert")&&turn ==1)) {
      textSize(25);
      image(concert, 295, 95, 900, 815);
      fill(255, 0, 0);
      rect(300, 790, 880, 50, 50);
      fill(255);
      text(players[turn].name() +" Had a successful concert and increased in net worth by 50%", 305, 820);
    } else if ((screen.gameMap[p1pos].getName().equals("New Merch") &&turn ==0)||(screen.gameMap[p2pos].getName().equals("New Merch")&&turn ==1)) {
      textSize(35);
      image(bt21, 295, 95, 900, 815);
      fill(255, 0, 0);
      rect(300, 790, 880, 50, 50);
      fill(255);
      text(players[turn].name() +" dropped some new merch and earned $200.", 305, 820);
    } else if ((screen.gameMap[p1pos].getName().equals("Kidnappers") &&turn ==0)||(screen.gameMap[p2pos].getName().equals("Kidnappers")&&turn ==1)) {
      textSize(30);
      image(kidnap, 295, 95, 900, 815);
      fill(255, 0, 0);
      rect(300, 790, 880, 50, 50);
      fill(255);
      text(players[turn].name() +" got kidnapped and woke up at " + screen.gameMap[players[turn].pos()].getName() + ".", 305, 820);
    } else if (screen.gameMap[p1pos].getName().equals("Wallet on floor") &&turn ==0) {
      textSize(35);
      image(wallet, 295, 95, 900, 815);
      fill(255, 0, 0);
      rect(300, 790, 880, 50, 50);
      fill(255);
      if (wallet1 > 0 && wallet1 <=.33) {
        text(players[turn].name() +" found a wallet with $150 inside!", 305, 820);
      } else if (wallet1 >.33 && wallet1 <=.66) {
        textSize(25);
        text(players[turn].name() +" found a wallet on the ground, but it was a trap by the police!" +players[turn].name() +" paid $100!", 305, 800);
      } else {
        text(players[turn].name() +" found an empty wallet on the ground", 305, 820);
      }
    } else if (screen.gameMap[p2pos].getName().equals("Wallet on floor")&&turn ==1) {
      textSize(35);
      image(wallet, 295, 95, 900, 815);
      fill(255, 0, 0);
      rect(300, 790, 880, 50, 50);
      fill(255);
      if (wallet2 > 0 && wallet2 <=.33) {
        text(players[turn].name() +" found a wallet with $150 inside!", 305, 820);
      } else if (wallet2 >.33 && wallet2 <=.66) {
        textSize(25);
        text(players[turn].name() +" found a wallet on the ground, but it was a trap by the police!" +players[turn].name() +" paid $100!", 305, 800);
      } else {
        text(players[turn].name() +" found an empty wallet on the ground", 305, 820);
      }
    }
     if (mouseOverTile() != -1) {
      textSize(20);
      displayTileStat(mouseOverTile());
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
        if (screen.gameMap[p1pos].getName().equals("Pyramid Scheme")|| screen.gameMap[p1pos].getName().equals("Tax Fraud")) {
          players[0].pay(players[0].bank()*.5);
        }
        if (screen.gameMap[p1pos].getName().equals("Disney+ collab")) {
          players[0].add(players[0].bank() * .15);
        }
        if (screen.gameMap[p1pos].getName().equals("Thief")) {
          players[0].pay(150);
        }
        if (screen.gameMap[p1pos].getName().equals("New Merch")) {
          players[0].add(200);
        }
        if (screen.gameMap[p1pos].getName().equals("Concert")) {
          players[0].add(players[0].bank()*.5);
        }
        if (screen.gameMap[p1pos].getName().equals("Kidnappers")) {
          players[0].move(int(random(0, 40)));
        }
        if (screen.gameMap[p1pos].getName().equals("Lottery")) {
          lot1 = random(0, 1);
          players[0].pay(players[0].bank()*.1);
          if (lot1 > 0 && lot1 <=.33) {
            players[0].add(players[0].bank() * .75);
          }
        }
        if (screen.gameMap[p1pos].getName().equals("Wallet on floor")) {
          wallet1= random(0, 1);
          if (wallet1 > 0 && wallet1 <=.33) {
            players[0].add(150);
          } else if (wallet1 >.33 && wallet1 <=.66) {
            players[0].pay(100);
          }
        }
        if (screen.gameMap[p1pos].getName().equals("Crazy Fangirl")) {
          fan1= random(0, 1);
          if (fan1 > 0 && fan1 <=.5) {
            players[0].pay(300);
          }
        }

        if (players[1].properties.indexOf(screen.gameMap[p1pos]) != -1) {
          players[0].pay(screen.gameMap[p1pos].getPrice());
          players[1].add(screen.gameMap[p1pos].getPrice());
        } else if (p1pos < prevPos1 || p1pos == 0) {
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
        if (screen.gameMap[p2pos].getName().equals("Pyramid Scheme") || screen.gameMap[p2pos].getName().equals("Tax Fraud")) {
          players[1].pay(players[1].bank()*.5);
        }
        if (screen.gameMap[p2pos].getName().equals("Disney+ collab")) {
          players[1].add(players[1].bank() * .15);
        }
        if (screen.gameMap[p2pos].getName().equals("Thief")) {
          players[1].pay(150);
        }
        if (screen.gameMap[p2pos].getName().equals("New Merch")) {
          players[1].add(200);
        }
        if (screen.gameMap[p2pos].getName().equals("Concert")) {
          players[1].add(players[1].bank()*.5);
        }
        if (screen.gameMap[p2pos].getName().equals("Kidnappers")) {
          players[1].move(int(random(0, 40)));
        }
        if (screen.gameMap[p2pos].getName().equals("Lottery")) {
          lot2 = random(0, 1);
          players[1].pay(players[1].bank()*.1);
          if (lot2 > 0 && lot2 <=.33) {
            players[1].add(players[1].bank() * .75);
          }
        }
        if (screen.gameMap[p2pos].getName().equals("Wallet on floor")) {
          wallet2 = random(0, 1);
          if (wallet2 > 0 && wallet2 <=.33) {
            players[1].add(150);
          } else if (wallet2 >.33 && wallet2 <=.66) {
            players[1].pay(100);
          }
        }
        if (screen.gameMap[p2pos].getName().equals("Crazy Fangirl")) {
          fan2 = random(0, 1);
          if (fan2 > 0 && fan2 <=.5) {
            players[1].pay(300);
          }
        }
        if (players[0].properties.indexOf(screen.gameMap[p2pos]) != -1) {
          players[1].pay(screen.gameMap[p2pos].getPrice());
          players[0].add(screen.gameMap[p2pos].getPrice());
        } else if (p2pos < prevPos2 || p2pos == 0) {
          players[1].add(200);
        }
        println("p2pos" + p2pos);
      }
    }
    if (key == 'b') {
      if (turn == PLAYERONE) {
        if (screen.gameMap[p1pos].getType().equals("buyable") && !screen.gameMap[p1pos].isOwned()) {
          players[0].buy(screen.gameMap[p1pos]);
          screen.gameMap[p1pos].setOwner(players[0]);
        }
      } else {
        if (screen.gameMap[p2pos].getType().equals("buyable") && !screen.gameMap[p2pos].isOwned()) {
          players[1].buy(screen.gameMap[p2pos]);
          screen.gameMap[p2pos].setOwner(players[1]);
        }
      }
    }
    if (key == 'm') {
      if (turn == PLAYERONE) {
        mortgaging1 = true;
      } else {
        mortgaging2 = true;
      }
    }
    if (key == 'c') {
      mortgaging1 = false;
      mortgaging2 = false;
    }
  } else if (avatarScreen) {
  }
  if (endScreen) {
    if (key == 'r') {
      setup();
      loadingScreen = true;
      endScreen = false;
    }
  }
}

void statBox(float x, float y, int xS, int yS) {
  fill(200);
  rect(x, y, xS, yS);
}

void displayTileStat(int tilenum) {
  if (!screen.gameMap[tilenum].getName().equals("Rest stop")) {
    image(screen.gameMap[tilenum].tilePfp(), width/4-80, 95, 900, 810);
  }
  fill(screen.gameMap[tilenum].tileColor());
  rect(width/2-200, 300, 400, 400);
  fill(255);
  rect(width/2-200, 330, 400, 400);

  textAlign(CENTER);

  if (screen.gameMap[tilenum].getType().equals("unbuyable") || tilenum == 1 || tilenum == 2 || tilenum == 4 || tilenum == 39 || tilenum == 37 || tilenum == 36) {
    fill(255);
  } else if (players[1].owned().indexOf(screen.gameMap[tilenum]) != -1) {
    fill(0);
  }
  text(screen.gameMap[tilenum].getName(), width/2, 320);
  fill(0);
  if (screen.gameMap[tilenum].getType().equals("buyable")) {
    text("Price: " + screen.gameMap[tilenum].getPrice(), width/2, 375);
    text("Mortgage: " + screen.gameMap[tilenum].getPrice() * 0.75, width/2, 410);
    if (screen.gameMap[tilenum].isOwned()) {
      text("Owner: " + screen.gameMap[tilenum].getOwner(), width/2, 445);
    } else {
      text("Nobody owns this tile!", width/2, 445);
    }
  } else {
    rectMode(CENTER);
    textSize(25);
    if (screen.gameMap[tilenum].getName().equals("Lottery")) {
      text("Your balance is multipled by 0.9x, there is a 33% chance your balance is then doubled, and a 66% chance that nothing happens", width/2, 510, 360, 200);
    } else if (screen.gameMap[tilenum].getName().equals("Crazy Fangirl")) {
      text("There is a 50% chance that you lose $100", width/2, 510, 360, 250);
    } else if (screen.gameMap[tilenum].getName().equals("Disney+ collab")) {
      text("Your balance is multiplied by 1.15x", width/2, 480, 360, 250);
    } else if (screen.gameMap[tilenum].getName().equals("Thief")) {
      text("You lose $150", width/2, 480, 360, 250);
    } else if (screen.gameMap[tilenum].getName().equals("Airport")) {
      text("You immediately teleport to the 'Airplane' tile!", width/2, 480, 360, 250);
    } else if (screen.gameMap[tilenum].getName().equals("Tax Fraud")) {
      text("Your balance is halved", width/2, 480, 360, 250);
    } else if (screen.gameMap[tilenum].getName().equals("Concert")) {
      text("Your balance is multiplied by 1.5x", width/2, 480, 360, 250);
    } else if (screen.gameMap[tilenum].getName().equals("New Merch")) {
      text("You gain $200", width/2, 445, 180, 250);
    } else if (screen.gameMap[tilenum].getName().equals("Kidnappers")) {
      text("You immediately teleport to a random tile", width/2, 480, 360, 250);
    } else if (screen.gameMap[tilenum].getName().equals("Pyramid Scheme")) {
      text("Your balance is halved", width/2, 480, 360, 250);
    } else if (screen.gameMap[tilenum].getName().equals("Airplane")) {
      text("You will be teleported here from the 'Airport' tile!", width/2, 480, 360, 250);
    } else if (screen.gameMap[tilenum].getName().equals("Wallet on floor")) {
      text("There is a 33% chance that you lose $100, a 33% chance that you gain $150, and a 33% chance nothing happens", width/2, 480, 360, 250);
    }
  }
  textAlign(LEFT);
  rectMode(CORNER);
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
    fill(255, 0, 0);
  } else {
    fill(0, 0, 255);
  }
  text(currentP.name(), xVal+20, yVal + 40);
  fill(0, 0, 0);
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

void displayPlayer(PImage playerIcon, float x, float y) {
  image(playerIcon, x, y, 50, 50);
}



void mousePressed() {
  if (loadingScreen) {
    if (avatarOver) {
      avatarScreen = true;
      loadingScreen = false;
    }
    if (playOver) {
      loadingScreen = false;
      gameScreen = true;
    }
    if (controlOver) {
      loadingScreen = false;
      controlScreen = true;
    }
  }
  if (avatarScreen) {
    if (menuButtonOver) {
      loadingScreen = true;
      avatarScreen = false;
    }
    if (overRect(200, height/2-150, 150, 150)) {
      players[0].setPfp("kenny", kenny);
    } else if (overRect(500, height/2-150, 150, 150)) {
      players[0].setPfp("tolkien", tolkien);
    } else if (overRect(800, height/2-150, 150, 150)) {
      players[0].setPfp("cartman", tolkien);
    } else if (overRect(1100, height/2-150, 150, 150)) {
      players[0].setPfp("kyle", kyle);
    } else if (overRect(200, height/2+150, 150, 150)) {
      players[1].setPfp("dora", dora);
    } else if (overRect(500, height/2+150, 150, 150)) {
      players[1].setPfp("boots", boots);
    } else if (overRect(800, height/2+150, 150, 150)) {
      players[1].setPfp("swiper", swiper);
    } else if (overRect(1100, height/2+150, 150, 150)) {
      players[1].setPfp("diego", diego);
    }
  }
  if (gameScreen) {
    if (menuButtonOver) {
      loadingScreen = true;
      gameScreen = false;
    }
    if (mouseOverTile() == -1) {
    } else if (mortgaging1 && players[0].owned().indexOf(screen.gameMap[mouseOverTile()]) != -1 && screen.gameMap[mouseOverTile()].getOwner().equals(players[0].name())) {
      players[0].mortgage(screen.gameMap[mouseOverTile()]);
      mortgaging1 = false;
    } else if (mortgaging2 && players[1].owned().indexOf(screen.gameMap[mouseOverTile()]) != -1&& screen.gameMap[mouseOverTile()].getOwner().equals(players[1].name())) {
      players[1].mortgage(screen.gameMap[mouseOverTile()]);
      mortgaging2 = false;
    }
  }
  if (controlScreen) {
    if (menuButtonOver) {
      loadingScreen = true;
      controlScreen = false;
    }
  }
}

boolean overRect(int x, int y, int width, int height) {
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
  menuButtonOver = overRect(30, 30, 75, 30);
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
  if (player.name().equals(players[0].name())) {
    displayPlayer(player.getPfpimg(), screen.gameMap[player.pos()].getStartX()+5, screen.gameMap[player.pos()].getStartY()+30);
  } else {
    displayPlayer(player.getPfpimg(), screen.gameMap[player.pos()].getStartX()+45, screen.gameMap[player.pos()].getStartY()+30);
  }
}
