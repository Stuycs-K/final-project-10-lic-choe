int turn;
int step;
Player[] players;

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
  text(turn, 100, 100);
  text(players[0].pos(), 100, 200);
  text(players[1].pos(), 100, 300);
  if (turn % 2 == 0) {
    step = 0;
    players[0].takeTurn();
    step++;
  }
  else {
    step = 0;
    players[1].takeTurn();
    step++;
  }
}

void keyPressed() {
  if (step == 3) {
    turn++;
  }
}
