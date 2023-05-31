import java.util.Random;

int turn;
static int PLAYERONE = 0;
static int PLAYERTWO = 1;
Player[] players;
Map screen;
int movement;

void setup() {
  size(1500, 1000);
  start();
  end();
}

void start() {
  players = new Player[2];
  turn = 0;
  players[0] = new Player("Player One");
  players[1] = new Player("Player Two");
}

void end() {
}

void draw() {
  background(255);
  Map screen = new Map();
  screen.build();
 
  displayPlayerStat(players[0],100,10);
  displayPlayerStat(players[1],1300,10);
}

void keyPressed() {
  if (key == ENTER) {
    turn++;
    turn%=2;
  if (turn == PLAYERONE) {
    movement = players[0].takeTurn();
  }
  else {
    movement = players[1].takeTurn();
  }
  }
  int curpos = players[turn].pos();
  if (key == 'b' && screen.gameMap[curpos].getType().equals("buyable")) {
    players[turn].buy(screen.gameMap[curpos]);
  }
}

void statBox(float x, float y, int xS,int yS){
  fill(200);
 rect(x, y, xS,yS);
 
}

void displayPlayerStat(Player currentP, float xVal, float yVal) {
   statBox(xVal,yVal,150,50);
   statBox(xVal,yVal+70,150,50);
   statBox(xVal,yVal+290,150,600);
   statBox(xVal,yVal+150,150,100);
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
    text("Player Name:",xVal+20, yVal+15);
    text(currentP.name(), xVal+20, yVal + 40);
    text("Player Balance:", xVal+20, yVal+85);
            text(currentP.bank(), xVal+20, yVal +110);
    text("Player Property:", xVal+20, yVal + 307);
    text("Player Roll:", xVal+20,yVal+170);
    textSize(30);
    text(movement, xVal+40,yVal+220);
    textSize(15);
}
